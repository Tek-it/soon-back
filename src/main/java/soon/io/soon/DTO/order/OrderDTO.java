package soon.io.soon.DTO.order;

import lombok.*;
import soon.io.soon.models.orderDetails.OrderDetails;
import soon.io.soon.models.orderStatus.OrderState;

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

}
