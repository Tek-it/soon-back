package soon.io.soon.DTO.authentication;

import lombok.*;
import soon.io.soon.DTO.user.UserDTO;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RegisterNbrDTO {
    private String numberPhone;
    private String code;
    private String step;
    private UserDTO userDTO;
}
