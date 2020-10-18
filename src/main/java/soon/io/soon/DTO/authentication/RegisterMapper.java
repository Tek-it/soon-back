package soon.io.soon.DTO.authentication;

import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import soon.io.soon.DTO.user.UserDTO;
import soon.io.soon.models.user.User;


@Mapper(componentModel = "spring", injectionStrategy = InjectionStrategy.CONSTRUCTOR)
public interface RegisterMapper {

     RegisterDTO toRegisterDTO(UserDTO userDTO);

     User toUser(RegisterDTO registerDTO);
}
