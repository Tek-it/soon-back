package soon.io.soon.DTO.authentication;

import javax.annotation.Generated;
import org.springframework.stereotype.Component;
import soon.io.soon.DTO.user.UserDTO;
import soon.io.soon.models.user.User;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2020-08-23T21:26:16+0200",
    comments = "version: 1.3.0.Beta2, compiler: javac, environment: Java 1.8.0_152-release (JetBrains s.r.o)"
)
@Component
public class RegisterMapperImpl extends RegisterMapper {

    @Override
    public RegisterDTO toRegisterDTO(UserDTO userDTO) {
        if ( userDTO == null ) {
            return null;
        }

        RegisterDTO registerDTO = new RegisterDTO();

        return registerDTO;
    }

    @Override
    public User toUser(RegisterDTO registerDTO) {
        if ( registerDTO == null ) {
            return null;
        }

        User user = new User();

        return user;
    }
}
