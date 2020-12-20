package soon.io.soon.DTO.catergory;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.springframework.beans.factory.annotation.Autowired;
import soon.io.soon.DTO.restaurant.RestaurantMapper;
import soon.io.soon.Services.profile.ProfileService;
import soon.io.soon.Utils.Errorhandler.RestaurantNotFound;
import soon.io.soon.models.category.Category;
import soon.io.soon.models.dish.Dish;
import soon.io.soon.models.restaurant.Restaurant;

import java.util.Collections;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

@Mapper(componentModel = "spring")
public abstract class CategoryMapper {


    @Autowired
    private ProfileService profileService;

    @Autowired
    private RestaurantMapper restaurantMapper;

    @Mapping(target = "restaurant", expression = "java(findRestaurant())")
    @Mapping(target = "dishes", ignore = true)
    public abstract Category toModel(CategoryDTO categoryDTO);

    @Mapping(target = "restaurantId", source = "restaurant.id")
    @Mapping(target = "dishes", expression = "java(getDishes(category))")
    public abstract CategoryDTO toDTO(Category category);

    public Set<Long> getDishes(Category category) {
        if (category.getDishes() == null)
            return Collections.emptySet();
        return category.getDishes().stream()
                .map(Dish::getId)
                .collect(Collectors.toSet());
    }

    public Restaurant findRestaurant() {
        return Optional.of("")
                .map(o -> profileService.getCurrentConnectedRestaurant())
                .map(restaurantMapper::RestaurantDTOToRestaurant)
                .orElseThrow(() -> new RestaurantNotFound("error.restaurant.not-connected"));
    }
}
