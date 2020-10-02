package soon.io.soon.DTO.user;

import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import soon.io.soon.models.user.User;

@Mapper(componentModel = "spring", injectionStrategy = InjectionStrategy.CONSTRUCTOR)
public interface UserMapper {

    public UserDTO toDTO(User user);

    public User toModel(UserDTO userDTO);

}
