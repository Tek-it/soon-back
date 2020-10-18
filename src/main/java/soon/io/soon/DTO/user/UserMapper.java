package soon.io.soon.DTO.user;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import soon.io.soon.models.user.User;

@Mapper(componentModel = "spring")
public abstract class UserMapper {

    @Mapping(target = "password", ignore = true)
    public abstract UserDTO toDTO(User user);

    public abstract User toModel(UserDTO userDTO);

}
