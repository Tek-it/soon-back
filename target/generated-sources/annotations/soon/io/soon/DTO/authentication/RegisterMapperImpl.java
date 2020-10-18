package soon.io.soon.DTO.authentication;

import javax.annotation.Generated;
import org.springframework.stereotype.Component;
import soon.io.soon.DTO.user.UserDTO;
import soon.io.soon.models.user.User;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2020-10-18T21:52:10+0200",
    comments = "version: 1.3.0.Final, compiler: javac, environment: Java 11.0.8 (JetBrains s.r.o.)"
)
@Component
public class RegisterMapperImpl implements RegisterMapper {

    @Override
    public RegisterDTO toRegisterDTO(UserDTO userDTO) {
        if ( userDTO == null ) {
            return null;
        }

        RegisterDTO registerDTO = new RegisterDTO();

        registerDTO.setEmail( userDTO.getEmail() );
        registerDTO.setPassword( userDTO.getPassword() );
        registerDTO.setNumberPhone( userDTO.getNumberPhone() );

        return registerDTO;
    }

    @Override
    public User toUser(RegisterDTO registerDTO) {
        if ( registerDTO == null ) {
            return null;
        }

        User user = new User();

        user.setNumberPhone( registerDTO.getNumberPhone() );
        user.setEmail( registerDTO.getEmail() );
        user.setPassword( registerDTO.getPassword() );
        user.setProfilePicture( registerDTO.getProfilePicture() );

        return user;
    }
}
