package soon.io.soon.DTO.order;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.springframework.beans.factory.annotation.Autowired;
import soon.io.soon.Utils.Errorhandler.RestaurantNotFound;
import soon.io.soon.Utils.Errorhandler.UserNotFoundException;
import soon.io.soon.models.order.Order;
import soon.io.soon.models.orderDetails.OrderDetails;
import soon.io.soon.models.restaurant.Restaurant;
import soon.io.soon.models.restaurant.RestaurantRepository;
import soon.io.soon.models.user.User;
import soon.io.soon.models.user.UserRepository;

import java.util.Set;
import java.util.stream.Collectors;

@Mapper(componentModel = "spring", uses = {OrderDetailsMapper.class})
public abstract class OrderMapper {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RestaurantRepository restaurantRepository;

    @Autowired
    private OrderDetailsMapper orderDetailsMapper;

    @Mapping(target = "user", expression = "java(findUser(orderDTO.getUserId()))")
    @Mapping(target = "restaurant", expression = "java(getRestaurant(orderDTO.getRestaurantId()))")
    @Mapping(target = "orderDetails", expression = "java(getListOrderDetails(orderDTO.getOrderDetails()))")
    public abstract Order toModel(OrderDTO orderDTO);

    @Mapping(target = "userId", source = "user.id")
    @Mapping(target = "restaurantId", source = "restaurant.id")
    @Mapping(target = "billId", source = "bill.id")
    @Mapping(target = "orderDetails", expression = "java(getListOrderDetailsDTO(order.getOrderDetails()))")
    public abstract OrderDTO toDTO(Order order);


    public User findUser(Long userId) {
        return userRepository.findById(userId)
                .orElseThrow(() -> new UserNotFoundException("error.user.notfound"));
    }

    public Restaurant getRestaurant(long restaurantId) {
        return restaurantRepository.findById(restaurantId)
                .orElseThrow(() -> new RestaurantNotFound("error.restaurant.notfound"));
    }

    public Set<OrderDetailsDTO> getListOrderDetailsDTO(Set<OrderDetails> detailsSet) {
        return detailsSet.stream()
                .map(orderDetailsMapper::toDTO)
                .collect(Collectors.toSet());
    }

    public Set<OrderDetails> getListOrderDetails(Set<OrderDetailsDTO> orderDetailsDTOS) {
        return orderDetailsDTOS.stream()
                .map(orderDetailsMapper::toModel)
                .collect(Collectors.toSet());
    }
}
