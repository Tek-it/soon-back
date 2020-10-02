package soon.io.soon.DTO.authentication;

import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import soon.io.soon.DTO.user.UserDTO;
import soon.io.soon.models.user.User;


@Mapper(componentModel = "spring", injectionStrategy = InjectionStrategy.CONSTRUCTOR)
public abstract class RegisterMapper {

    public abstract RegisterDTO toRegisterDTO(UserDTO userDTO);

    public abstract User toUser(RegisterDTO registerDTO);
}
