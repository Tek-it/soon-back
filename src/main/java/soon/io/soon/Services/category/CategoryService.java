package soon.io.soon.Services.category;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import soon.io.soon.DTO.catergory.CategoryDTO;
import soon.io.soon.DTO.catergory.CategoryMapper;
import soon.io.soon.Utils.Errorhandler.RestaurantNotFound;
import soon.io.soon.models.category.Category;
import soon.io.soon.models.category.CategoryRepository;
import soon.io.soon.models.restaurant.Restaurant;
import soon.io.soon.models.restaurant.RestaurantRepository;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class CategoryService {

    private final CategoryRepository categoryRepository;
    private final CategoryMapper categoryMapper;
    private final RestaurantRepository restaurantRepository;

    public CategoryDTO create(CategoryDTO categoryDTO) {
        Restaurant restaurant = restaurantRepository
                .findById(categoryDTO.getRestaurant())
                .orElseThrow(() -> new RestaurantNotFound("error.error.notfound"));

        Category category = categoryMapper.toModel(categoryDTO);
        category.setRestaurant(restaurant);
        Category save = categoryRepository.save(category);
        return categoryMapper.toDTO(save);
    }

    public List<CategoryDTO> getCategoriesByRestaurantId(Long id) {
        // TODO: 15/10/2020 first check if the id exist or no
        return categoryRepository
                .findAllByRestaurantId(id)
                .stream()
                .map(categoryMapper::toDTO)
                .collect(Collectors.toList());
    }

    public CategoryDTO update(CategoryDTO categoryDTO) {
        return Optional.of(categoryDTO)
                .map(categoryMapper::toModel)
                .map(categoryRepository::save)
                .map(categoryMapper::toDTO)
                .orElse(null);
    }
}
