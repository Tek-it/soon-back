package soon.io.soon.DTO.order;

import lombok.*;

@Setter
@Getter
@Builder
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class OrderDetailsDTO {
    private Long id;
    private Long orderId;
    private Long dishId;
    private double quantity;
}
