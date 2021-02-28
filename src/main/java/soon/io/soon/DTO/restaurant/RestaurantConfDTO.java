package soon.io.soon.DTO.restaurant;

import lombok.*;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RestaurantConfDTO {
    private String attribute;
    private String value;
    private Long restaurantId;
}
