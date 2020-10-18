package soon.io.soon.DTO.restaurant;

import javax.annotation.Generated;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import soon.io.soon.DTO.user.UserMapper;
import soon.io.soon.models.restaurant.Restaurant;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2020-10-18T21:52:10+0200",
    comments = "version: 1.3.0.Final, compiler: javac, environment: Java 11.0.8 (JetBrains s.r.o.)"
)
@Component
public class RestaurantMapperImpl extends RestaurantMapper {

    private final UserMapper userMapper;

    @Autowired
    public RestaurantMapperImpl(UserMapper userMapper) {

        this.userMapper = userMapper;
    }

    @Override
    public Restaurant RestaurantDTOToRestaurant(RestaurantDTO restaurantDTO) {
        if ( restaurantDTO == null ) {
            return null;
        }

        Restaurant restaurant = new Restaurant();

        restaurant.setId( restaurantDTO.getId() );
        restaurant.setName( restaurantDTO.getName() );
        restaurant.setDescription( restaurantDTO.getDescription() );
        restaurant.setOwner( userMapper.toModel( restaurantDTO.getOwner() ) );

        return restaurant;
    }

    @Override
    public RestaurantDTO restaurantToDTO(Restaurant restaurant) {
        if ( restaurant == null ) {
            return null;
        }

        RestaurantDTO restaurantDTO = new RestaurantDTO();

        restaurantDTO.setId( restaurant.getId() );
        restaurantDTO.setName( restaurant.getName() );
        restaurantDTO.setDescription( restaurant.getDescription() );
        restaurantDTO.setOwner( userMapper.toDTO( restaurant.getOwner() ) );
        restaurantDTO.setCategories( toCategory( restaurant.getCategories() ) );

        return restaurantDTO;
    }
}
