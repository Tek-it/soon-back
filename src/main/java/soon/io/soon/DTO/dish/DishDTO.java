package soon.io.soon.DTO.dish;

import lombok.*;

import java.util.Set;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class DishDTO {

    private long id;
    private String name;
    private String description;
    private double basePrice;
    private int preparationTime;
    private Long categoryId;
    private Long restaurantId;
    private boolean available;
    private String avatar;
}
