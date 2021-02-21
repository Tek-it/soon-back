package soon.io.soon.DTO.order;

import lombok.*;
import soon.io.soon.models.orderStatus.OrderState;
import soon.io.soon.models.restaurant.Coordinate;
import soon.io.soon.models.user.Address;

import java.time.LocalDateTime;
import java.util.Set;

@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class OrderDTO {

    private Long id;
    private Long userId;
    private Long restaurantId;
    private LocalDateTime createAt;
    private OrderState orderState;
    private Long billId;
    private Set<OrderDetailsDTO> orderDetails;
    private Coordinate coordinate;
    private Address address;
    private String orderReference;
}
