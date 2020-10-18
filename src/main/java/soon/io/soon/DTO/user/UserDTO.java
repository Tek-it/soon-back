package soon.io.soon.DTO.user;

import lombok.*;
import org.jetbrains.annotations.NotNull;
import soon.io.soon.models.user.Address;


@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Setter
@Getter
public class UserDTO {

    private Long id;

    private String firstName;

    private String lastName;

    private String email;

    private String password;

    @NotNull("error.numberPhone.required")
    private String numberPhone;

    private Address address;

    private Long restaurantId;
}
