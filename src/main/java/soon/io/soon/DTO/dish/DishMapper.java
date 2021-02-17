package soon.io.soon.DTO.dish;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.springframework.beans.factory.annotation.Autowired;
import soon.io.soon.DTO.restaurant.RestaurantMapper;
import soon.io.soon.Services.profile.ProfileService;
import soon.io.soon.Utils.Errorhandler.DishException;
import soon.io.soon.Utils.Errorhandler.RestaurantException;
import soon.io.soon.models.category.Category;
import soon.io.soon.models.category.CategoryRepository;
import soon.io.soon.models.dish.Dish;
import soon.io.soon.models.restaurant.Restaurant;

import java.util.Optional;

@Mapper(componentModel = "spring", uses = {RestaurantMapper.class})
public abstract class DishMapper {


    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private ProfileService profileService;

    @Autowired
    private RestaurantMapper restaurantMapper;

    @Mapping(target = "category", expression = "java(findCategory(dishDTO.getCategoryId()))")
    @Mapping(target = "restaurant", expression = "java(findRestaurant())")
    public abstract Dish toModel(DishDTO dishDTO);

    @Mapping(target = "categoryId", source = "category.id")
    @Mapping(target = "restaurantId", source = "restaurant.id")
    public abstract DishDTO toDTO(Dish dish);

    public Category findCategory(Long id) {
        return categoryRepository.findById(id)
                .orElseThrow(() -> new DishException("error.dish.notfound"));
    }

    public Restaurant findRestaurant() {
        return Optional.of(1)
                .map(aLong -> profileService.getCurrentConnectedRestaurant())
                .map(restaurantMapper::RestaurantDTOToRestaurant)
                .orElseThrow(() -> new RestaurantException("error.restaurant.not-connected"));
    }
}
