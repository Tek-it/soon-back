package soon.io.soon.DTO.authentication;

import lombok.*;

@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class RegisterDTO {


    private String firstname;

    private String lastname;

    private String email;

    private String password;

    private String numberPhone;

    private String profilePicture;


}
