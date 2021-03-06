package soon.io.soon.DTO.user;

import lombok.*;
import org.jetbrains.annotations.NotNull;
import soon.io.soon.models.roles.Roles;
import soon.io.soon.models.user.Address;

import javax.persistence.Column;
import javax.validation.constraints.Email;
import java.util.Set;


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

    @Email(message = "")
    private String email;

    private String password;

    private String profilePicture;

    @NotNull("error.numberPhone.required")
    private String numberPhone;

    private Address address;

    private Long restaurantId;

    // todo i need to change it
    private Set<Roles> roles;
}
