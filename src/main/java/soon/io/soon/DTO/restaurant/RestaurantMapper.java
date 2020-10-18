package soon.io.soon.DTO.restaurant;

import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import soon.io.soon.DTO.user.UserMapper;
import soon.io.soon.models.category.Category;
import soon.io.soon.models.restaurant.Restaurant;

import java.util.Collections;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

@Mapper(componentModel = "spring", injectionStrategy = InjectionStrategy.CONSTRUCTOR, uses = {UserMapper.class})
public abstract class RestaurantMapper {

    @Mapping(target = "categories", ignore = true)
    public abstract Restaurant RestaurantDTOToRestaurant(RestaurantDTO restaurantDTO);

    public abstract RestaurantDTO restaurantToDTO(Restaurant restaurant);

    public Set<Long> toCategory(Set<Category> categories) {
        if (categories != null) {
            return categories.stream()
                    .filter(Objects::nonNull)
                    .map(Category::getId)
                    .collect(Collectors.toSet());
        }
        return Collections.emptySet();
    }

}
