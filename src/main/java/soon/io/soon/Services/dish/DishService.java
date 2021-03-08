package soon.io.soon.Services.dish;

import lombok.AllArgsConstructor;
import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import soon.io.soon.DTO.dish.DishDTO;
import soon.io.soon.DTO.dish.DishMapper;
import soon.io.soon.DTO.restaurant.RestaurantMapper;
import soon.io.soon.Services.filestorage.DropBoxStorage;
import soon.io.soon.Services.profile.ProfileService;
import soon.io.soon.Utils.Errorhandler.DishException;
import soon.io.soon.Utils.Utils;
import soon.io.soon.models.category.CategoryRepository;
import soon.io.soon.models.dish.Dish;
import soon.io.soon.models.dish.DishRepository;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class DishService {

    private final DishRepository dishRepository;
    private final DishMapper dishMapper;
    private final DropBoxStorage fileStorage;

    public List<DishDTO> getDishesByCategoryId(long id) {
        return dishRepository.findByCategoryId(id)
                .stream()
                .map(dishMapper::toDTO)
                .collect(Collectors.toList());
    }

    public DishDTO createDish(DishDTO dishDTO, MultipartFile image) {
        Utils.saveFile(image, fileStorage);
        return Optional.of(dishDTO)
                .map(dishMapper::toModel)
                .map(dish -> setDishImage(image, dish))
                .map(dishRepository::save)
                .map(dishMapper::toDTO)
                .orElse(null);
    }

    @NotNull
    private Dish setDishImage(MultipartFile image, Dish dish) {
        dish.setAvatar((image != null ? image.getOriginalFilename() : ""));
        return dish;
    }


    public DishDTO updateDish(DishDTO dishDTO, MultipartFile image) {
        return dishRepository.findById(dishDTO.getId())
                .map(dish -> {
                    dish.setName(dishDTO.getName());
                    dish.setDescription(dishDTO.getDescription());
                    dish.setPreparationTime(dishDTO.getPreparationTime());
                    dish.setBasePrice(dishDTO.getBasePrice());
                    dish.setAvailable(dishDTO.isAvailable());
                    if (image != null) {
                        if (dish.getAvatar() == null || !dish.getAvatar().equals(image.getOriginalFilename())) {
                            Utils.saveFile(image, fileStorage);
                            dish.setAvatar(image.getOriginalFilename());
                        }
                    }
                    return dish;
                })
                .map(dishRepository::save)
                .map(dishMapper::toDTO)
                .orElseThrow(() -> new DishException("error.dish.notfound"));
    }


    @Transactional
    public void deleteDish(Long id) {
        dishRepository.deleteById(id);
    }

    public DishDTO getDishById(Long id) {
        return dishRepository.findById(id)
                .map(dishMapper::toDTO)
                .orElseThrow(() -> new DishException("error.dish.notfound"));
    }
}

