package soon.io.soon.Services.order;

import lombok.AllArgsConstructor;
import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Service;
import soon.io.soon.DTO.order.OrderDTO;
import soon.io.soon.DTO.order.OrderMapper;
import soon.io.soon.Services.external.geoLocation.GeoLocationResolver;
import soon.io.soon.Services.profile.ProfileService;
import soon.io.soon.Utils.Errorhandler.OrderNotFoundException;
import soon.io.soon.models.bill.Billing;
import soon.io.soon.models.order.Order;
import soon.io.soon.models.order.OrderRepository;
import soon.io.soon.models.orderDetails.OrderDetails;
import soon.io.soon.models.orderDetails.OrderDetailsRepository;
import soon.io.soon.models.orderStatus.OrderState;
import soon.io.soon.models.user.Address;

import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderDetailsRepository orderDetailsRepository;
    private final OrderMapper orderMapper;
    private final ProfileService profileService;
    private final GeoLocationResolver geoLocationResolver;


    @Transactional
    public OrderDTO createOrder(OrderDTO orderDTO) {
        return Optional.of(orderDTO)
                .map(orderMapper::toModel)
                .map(this::setOrderState)
                .map(this::createOrderBill)
                .map(this::resolveAddress)
                .map(orderRepository::save)
                .map(this::setOrderDetails)
                .map(orderRepository::save)
                .map(orderMapper::toDTO)
                .orElse(null);
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
        order.setBill(Billing.builder().tax(0).total(0).build());
        return order;
    }

    @NotNull
    private Order setOrderState(Order order) {
        order.setCreateAt(LocalDateTime.now());
        order.setOrderState(OrderState.builder().newOrder(true).build());
        return order;
    }

    public List<OrderDTO> getOrdersByRestaurantId() {
        Long restaurantId = profileService.getCurrentConnectedRestaurant().getId();
        return orderRepository.findByRestaurantId(restaurantId)
                .stream()
                .map(orderMapper::toDTO)
                .collect(Collectors.toList());
    }

    public OrderDTO getOrderById(long id) {
        return orderRepository.findById(id)
                .map(orderMapper::toDTO)
                .orElseThrow(() -> new OrderNotFoundException("error.order.notfound"));
    }

    public OrderDTO acceptOrderByRestaurant(Long id) {
        return orderRepository.findById(id)
                .map(this::setAccepted)
                .map(orderRepository::save)
                .map(orderMapper::toDTO)
                .orElseThrow(() -> new OrderNotFoundException("error.order.notfound"));
    }

    public OrderDTO onDeliveredByDriver(Long id) {
        return orderRepository.findById(id)
                .map(this::setDelivered)
                .map(orderRepository::save)
                .map(orderMapper::toDTO)
                .orElseThrow(() -> new OrderNotFoundException("error.order.notfound"));
    }

    @NotNull
    private Order setAccepted(Order order) {
        order.getOrderState().setAccepted(true);
        order.getOrderState().setProcessing(true);
        return order;
    }

    @NotNull
    private Order setDelivered(Order order) {
        order.getOrderState().setDelivered(true);
        return order;
    }

    @NotNull
    private Order resolveAddress(Order order) {
        Address address = geoLocationResolver.getAddress(order.getCoordinate());
        order.setAddress(address);
        return order;
    }

}
