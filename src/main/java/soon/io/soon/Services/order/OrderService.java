package soon.io.soon.Services.order;


import lombok.AllArgsConstructor;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import soon.io.soon.DTO.bill.BillDTO;
import soon.io.soon.DTO.bill.BillMapper;
import soon.io.soon.DTO.order.OrderDTO;
import soon.io.soon.DTO.order.OrderMapper;
import soon.io.soon.Services.bill.BillService;
import soon.io.soon.Services.external.geoLocation.GeoLocationResolver;
import soon.io.soon.Services.notification.NotificationService;
import soon.io.soon.Services.profile.ProfileService;
import soon.io.soon.Utils.Errorhandler.OrderException;

import soon.io.soon.Utils.Utils;
import soon.io.soon.models.bill.Bill;
import soon.io.soon.models.bill.BillRepository;
import soon.io.soon.models.order.Order;
import soon.io.soon.models.order.OrderRepository;
import soon.io.soon.models.orderDetails.OrderDetails;
import soon.io.soon.models.orderDetails.OrderDetailsRepository;
import soon.io.soon.models.orderStatus.OrderState;
import soon.io.soon.models.user.Address;

import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoField;
import java.util.*;
import java.util.stream.Collectors;

import static soon.io.soon.models.notification.NotificationTypes.*;

@Service
@AllArgsConstructor
public class OrderService {

    private final OrderRepository orderRepository;
    private final OrderDetailsRepository orderDetailsRepository;
    private final OrderMapper orderMapper;
    private final ProfileService profileService;
    private final GeoLocationResolver geoLocationResolver;
    private final NotificationService notificationService;
    private final BillRepository billRepository;
    private final Environment environment;

    @Transactional
    public OrderDTO createOrder(OrderDTO orderDTO) {
        return Optional.of(orderDTO)
                .map(orderMapper::toModel)
                .map(this::setOrderState)
                .map(this::resolveAddress)
                .map(this::setOrderReference)
                .map(orderRepository::save)
                .map(this::setOrderDetails)
                .map(this::createOrderBill)
                .map(orderRepository::save)
                .map(orderMapper::toDTO)
                .orElseThrow(() -> new OrderException("error.order.creation"));
    }

    @NotNull
    private Order setOrderDetails(Order order) {
        Set<OrderDetails> collect = order.getOrderDetails()
                .stream()
                .peek(orderDetails -> orderDetails.setOrder(order))
                .map(orderDetailsRepository::save)
                .collect(Collectors.toSet());
        order.setOrderDetails(collect);
        return order;
    }

    @NotNull
    private Order createOrderBill(Order order) {
        order.setBill(billRepository.save(Bill.builder().
                billReference(Utils.createReference(environment.getProperty("bill.prefix"))).
                tax(0).
                total(0).
                createdAt(LocalDateTime.now()).
                order(order).
                restaurant(order.getRestaurant()).build()));
        return order;
    }

    @NotNull
    private Order setOrderState(Order order) {
        order.setCreateAt(LocalDateTime.now());
        order.setOrderState(OrderState.builder().newOrder(true).build());
        return order;
    }

    @NotNull
    private Order setOrderReference(Order order) {
        order.setOrderReference(Utils.createReference(environment.getProperty("order.prefix")));
        return order;
    }

    public List<OrderDTO> getOrdersByRestaurantId() {
        Long restaurantId = profileService.getCurrentConnectedRestaurant().getId();
        return orderRepository.findByRestaurantId(restaurantId)
                .stream()
                .map(orderMapper::toDTO)
                .collect(Collectors.toList());
    }

    public List<OrderDTO> getOrdersByUserId(Long id) {
        return orderRepository.findByUserId(id)
                .stream()
                .map(orderMapper::toDTO)
                .collect(Collectors.toList());
    }

    public Map<String, Long> getWeeklyOrdersByRestaurantId() {
        Map<String, Long> orderMap = new TreeMap<>();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        Long restaurantId = profileService.getCurrentConnectedRestaurant().getId();

        LocalDateTime firstOfWeek = LocalDateTime.now().with(ChronoField.DAY_OF_WEEK, 1).toLocalDate().atStartOfDay();
        LocalDateTime today = LocalDateTime.now();
        orderRepository.findByCreateAtBetweenAndRestaurantIdOrderByCreateAt(firstOfWeek, today, restaurantId)
                .forEach(e -> orderMap.merge(e.getCreateAt().format(formatter), 1L, Long::sum));
        return orderMap;
    }


    public OrderDTO getOrderById(long id) {
        return orderRepository.findById(id)
                .map(orderMapper::toDTO)
                .orElseThrow(() -> new OrderException("error.order.notfound"));
    }

    public OrderDTO acceptOrderByRestaurant(Long id) {
        return orderRepository.findById(id)
                .map(this::setAccepted)
                .map(this::setNewOrder)
                .map(orderRepository::save)
                .map(orderMapper::toDTO)
                .orElseThrow(() -> new OrderException("error.order.notfound"));
    }


    public OrderDTO onDeliveredByDriver(Long id) {
        return orderRepository.findById(id)
                .map(this::setDelivered)
                .map(orderRepository::save)
                .map(orderMapper::toDTO)
                .orElseThrow(() -> new OrderException("error.order.notfound"));
    }

    public OrderDTO cancelOrderByRestaurant(Long id) {
        return orderRepository.findById(id)
                .map(this::setCanceled)
                .map(this::setNewOrder)
                .map(orderRepository::save)
                .map(orderMapper::toDTO)
                .orElseThrow(() -> new OrderException("error.order.notfound"));
    }

    @NotNull
    private Order setAccepted(Order order) {
        // TODO: 05/12/2020 i can separate the processing case and add a qeues for the orders
        order.getOrderState().setAccepted(true);
        order.getOrderState().setProcessing(true);
        notificationService.sendNotification(order.getUser().getEmail(), NOTIFICATION_ORDER_ACCEPTED);
        notificationService.sendNotification(order.getUser().getEmail(), NOTIFICATION_ORDER_PREPARING);
        return order;
    }

    @NotNull
    private Order setCanceled(Order order) {
        // TODO: 05/12/2020 i can separate the processing case and add a qeues for the orders
        order.getOrderState().setRejected(true);
        notificationService.sendNotification(order.getUser().getEmail(), NOTIFICATION_ORDER_REJECTED);
        return order;
    }

    @NotNull
    private Order setDelivered(Order order) {
        order.getOrderState().setDelivered(true);
        notificationService.sendNotification(order.getUser().getEmail(), NOTIFICATION_ORDER_DELIVERED);
        return order;
    }

    @NotNull
    private Order setNewOrder(Order order) {
        order.getOrderState().setNewOrder(false);
        return order;
    }

    @NotNull
    private Order resolveAddress(Order order) {
        Address address = geoLocationResolver.getAddress(order.getCoordinate());
        order.setAddress(address);
        return order;
    }

}
