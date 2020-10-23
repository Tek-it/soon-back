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
    private Set<String> dishImages;
    private boolean available;
}
