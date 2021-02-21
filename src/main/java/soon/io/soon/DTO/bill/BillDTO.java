package soon.io.soon.DTO.bill;

import lombok.*;
import soon.io.soon.models.order.Order;
import soon.io.soon.models.restaurant.Restaurant;

import java.time.LocalDateTime;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class BillDTO {
    private Long id;
    private double total;
    private double tax;
    private String billReference;
    private LocalDateTime createdAt;
    private Long orderId;
    private Boolean status;
}
