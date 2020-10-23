package soon.io.soon.Services.dish;

import lombok.AllArgsConstructor;
import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Service;
import soon.io.soon.DTO.dish.DishDTO;
import soon.io.soon.DTO.dish.DishMapper;
import soon.io.soon.Utils.Errorhandler.DishException;
import soon.io.soon.models.category.Category;
import soon.io.soon.models.category.CategoryRepository;
import soon.io.soon.models.dish.Dish;
import soon.io.soon.models.dish.DishRepository;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class DishService {

    private final DishRepository dishRepository;
    private final DishMapper dishMapper;
    private final CategoryRepository categoryRepository;

    public List<DishDTO> getDishesByCategoryId(long id) {
        return dishRepository.findByCategoryId(id)
                .stream()
                .map(dishMapper::toDTO)
                .collect(Collectors.toList());
    }

    public DishDTO createDish(DishDTO dishDTO) {

        // TODO: 21/10/2020 refactoring code need
        Category category = categoryRepository.findById(dishDTO.getCategoryId())
                .orElseThrow(() -> new DishException("error.dish.notfound"));

        return Optional.of(dishDTO)
                .map(dishMapper::toModel)
                .map(dish -> setDish(category, dish))
                .map(dishRepository::save)
                .map(dish -> {
                    category.getDishes().add(dish);
                    return dish;
                })
                .map(dishMapper::toDTO)
                .orElse(null);
    }

    @NotNull
    private Dish setDish(Category category, Dish dish) {
        dish.setCategory(category);
        return dish;
    }

    public DishDTO updateDish(DishDTO dishDTO) {
        Dish foundDish = dishRepository.findById(dishDTO.getId())
                .orElseThrow(() -> new DishException("error.dish.notfound"));

        return Optional.of(dishDTO)
                .map(dishMapper::toModel)
                .map(dish -> {
                    foundDish.setName(dish.getName());
                    foundDish.setDescription(dish.getDescription());
                    foundDish.setAvgDelivery(dish.getAvgDelivery());
                    foundDish.setPreparationTime(dish.getPreparationTime());
                    foundDish.setAvailable(dish.isAvailable());
                    return foundDish;
                })
                .map(dishRepository::save)
                .map(dishMapper::toDTO)
                .orElse(null);
    }
}

