package soon.io.soon.DTO.authentication;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;
import lombok.ToString;
import soon.io.soon.models.user.User;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class LoginDTO {

    private String token;

    private User user;
}
