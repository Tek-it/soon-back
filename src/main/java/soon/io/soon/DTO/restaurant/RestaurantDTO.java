package soon.io.soon.DTO.restaurant;

import lombok.*;
import soon.io.soon.DTO.user.UserDTO;
import soon.io.soon.models.user.Address;

import java.util.Set;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RestaurantDTO {

    private Long id;
    private String name;
    private String description;
    private String imageProfile;
    private boolean availability;
    private UserDTO owner;
    private Set<Long> categories;
    private Address address;
    private Set<Long> hashtagsIds;
}
