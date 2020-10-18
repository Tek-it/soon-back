package soon.io.soon.models.authentication;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ResetPasswordModel {
    private String token;
    private String password;
}
