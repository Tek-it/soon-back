package soon.io.soon.DTO.restaurant;

import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import soon.io.soon.DTO.user.UserMapper;
import soon.io.soon.models.restaurant.Restaurant;

@Mapper(componentModel = "spring", injectionStrategy = InjectionStrategy.CONSTRUCTOR, uses = {UserMapper.class})
public abstract class RestaurantMapper {

    public abstract Restaurant RestaurantDTOToRestaurant(RestaurantDTO restaurantDTO);

    public abstract RestaurantDTO restaurantToDTO(Restaurant restaurant);

}
