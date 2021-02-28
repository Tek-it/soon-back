package soon.io.soon.DTO.restaurant;

import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import soon.io.soon.DTO.user.UserMapper;
import soon.io.soon.models.restaurant.Restaurant;
import soon.io.soon.models.restaurant.RestaurantConfiguration;

@Mapper(componentModel = "spring", injectionStrategy = InjectionStrategy.CONSTRUCTOR, uses = {UserMapper.class})
public abstract class RestaurantConfMapper {

    public abstract RestaurantConfiguration toModel(RestaurantConfDTO restaurantConfDTO);

    @Mapping(target = "restaurantId", source = "restaurant.id")
    public abstract RestaurantConfDTO toDto(RestaurantConfiguration restaurantConfiguration);

}
