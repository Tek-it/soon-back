package soon.io.soon.DTO.order;

import soon.io.soon.DTO.item.ItemDTO;
import soon.io.soon.models.item.Item;
import soon.io.soon.models.restaurant.Coordinate;

import java.util.Set;

public class OrderDTO {

    private Long id;
    private Long userId;
    private Long restaurantId;
    private Set<ItemDTO> items;
    private Coordinate coordinate;

}
