package soon.io.soon.DTO.order;

import lombok.*;
import soon.io.soon.DTO.item.ItemDTO;
import soon.io.soon.models.restaurant.Coordinate;

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
    private Set<ItemDTO> items;
    private Coordinate coordinate;

}
