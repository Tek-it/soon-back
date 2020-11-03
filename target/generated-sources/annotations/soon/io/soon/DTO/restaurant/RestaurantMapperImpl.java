package soon.io.soon.DTO.restaurant;

import javax.annotation.Generated;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import soon.io.soon.DTO.restaurant.RestaurantDTO.RestaurantDTOBuilder;
import soon.io.soon.DTO.user.UserMapper;
import soon.io.soon.models.restaurant.Restaurant;
import soon.io.soon.models.restaurant.Restaurant.RestaurantBuilder;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2020-11-02T16:46:17+0100",
    comments = "version: 1.3.0.Final, compiler: javac, environment: Java 11.0.7 (JetBrains s.r.o.)"
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

        RestaurantBuilder restaurant = Restaurant.builder();

        restaurant.id( restaurantDTO.getId() );
        restaurant.name( restaurantDTO.getName() );
        restaurant.description( restaurantDTO.getDescription() );
        restaurant.address( restaurantDTO.getAddress() );
        restaurant.owner( userMapper.toModel( restaurantDTO.getOwner() ) );

        return restaurant.build();
    }

    @Override
    public RestaurantDTO restaurantToDTO(Restaurant restaurant) {
        if ( restaurant == null ) {
            return null;
        }

        RestaurantDTOBuilder restaurantDTO = RestaurantDTO.builder();

        restaurantDTO.id( restaurant.getId() );
        restaurantDTO.name( restaurant.getName() );
        restaurantDTO.description( restaurant.getDescription() );
        restaurantDTO.owner( userMapper.toDTO( restaurant.getOwner() ) );
        restaurantDTO.categories( toCategory( restaurant.getCategories() ) );
        restaurantDTO.address( restaurant.getAddress() );

        return restaurantDTO.build();
    }
}
