package soon.io.soon.DTO.authentication;

import javax.annotation.processing.Generated;
import org.springframework.stereotype.Component;
import soon.io.soon.DTO.user.UserDTO;
import soon.io.soon.models.user.User;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2020-11-08T18:31:15+0100",
    comments = "version: 1.3.0.Final, compiler: javac, environment: Java 15 (Oracle Corporation)"
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
