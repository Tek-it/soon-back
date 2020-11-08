package soon.io.soon.DTO.user;

import javax.annotation.processing.Generated;
import org.springframework.stereotype.Component;
import soon.io.soon.models.user.User;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2020-11-08T18:31:15+0100",
    comments = "version: 1.3.0.Final, compiler: javac, environment: Java 15 (Oracle Corporation)"
)
@Component
public class UserMapperImpl extends UserMapper {

    @Override
    public UserDTO toDTO(User user) {
        if ( user == null ) {
            return null;
        }

        UserDTO userDTO = new UserDTO();

        userDTO.setId( user.getId() );
        userDTO.setFirstName( user.getFirstName() );
        userDTO.setLastName( user.getLastName() );
        userDTO.setEmail( user.getEmail() );
        userDTO.setNumberPhone( user.getNumberPhone() );
        userDTO.setAddress( user.getAddress() );

        return userDTO;
    }

    @Override
    public User toModel(UserDTO userDTO) {
        if ( userDTO == null ) {
            return null;
        }

        User user = new User();

        user.setId( userDTO.getId() );
        user.setFirstName( userDTO.getFirstName() );
        user.setLastName( userDTO.getLastName() );
        user.setNumberPhone( userDTO.getNumberPhone() );
        user.setEmail( userDTO.getEmail() );
        user.setPassword( userDTO.getPassword() );
        user.setAddress( userDTO.getAddress() );

        return user;
    }
}
