package soon.io.soon.DTO.user;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;
import lombok.ToString;
import soon.io.soon.models.user.Address;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class UserDTO {

    private Long id;

    @NotNull(message = "error.firstName.required")
    private String firstName;

    @NotNull(message = "error.lastName.required")
    private String lastName;

    @Email
    @NotNull(message = "error.email.required")
    private String email;

    @NotNull(message = "error.numberPhone.required")
    private String numberPhone;

    private Address address;


}
