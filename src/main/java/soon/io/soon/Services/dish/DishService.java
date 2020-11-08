package soon.io.soon.Services.dish;

import lombok.AllArgsConstructor;
import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import soon.io.soon.DTO.dish.DishDTO;
import soon.io.soon.DTO.dish.DishMapper;
import soon.io.soon.Services.filestorage.FileStorage;
import soon.io.soon.Utils.Errorhandler.DishException;
import soon.io.soon.Utils.Errorhandler.FileStorageException;
import soon.io.soon.models.category.Category;
import soon.io.soon.models.category.CategoryRepository;
import soon.io.soon.models.dish.Dish;
import soon.io.soon.models.dish.DishRepository;

import javax.transaction.Transactional;
import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class DishService {

    private final DishRepository dishRepository;
    private final DishMapper dishMapper;
    private final CategoryRepository categoryRepository;
    private final FileStorage fileStorage;

    public List<DishDTO> getDishesByCategoryId(long id) {
        return dishRepository.findByCategoryId(id)
                .stream()
                .map(dishMapper::toDTO)
                .collect(Collectors.toList());
    }

    public DishDTO createDish(DishDTO dishDTO, MultipartFile image) {
        try {
            Category category = categoryRepository.findById(dishDTO.getCategoryId())
                    .orElseThrow(() -> new DishException("error.dish.notfound"));
            if (image != null) {
                fileStorage.upload(image.getOriginalFilename(), "soon-files", image.getInputStream());
            }
            return Optional.of(dishDTO)
                    .map(dishMapper::toModel)
                    .map(dish -> setDish(category, dish))
                    .map(dish -> {
                        dish.setAvatar((image != null ? image.getOriginalFilename() : ""));
                        return dish;
                    })
                    .map(dishRepository::save)
                    .map(dish -> {
                        category.getDishes().add(dish);
                        return dish;
                    })
                    .map(dishMapper::toDTO)
                    .orElse(null);
        } catch (IOException e) {
            e.printStackTrace();
            throw new FileStorageException("error.file.upload");
        }
    }

    @NotNull
    private Dish setDish(Category category, Dish dish) {
        dish.setCategory(category);
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
                            saveFile(image);
                            dish.setAvatar(image.getOriginalFilename());
                        }
                    }
                    return dish;
                })
                .map(dishRepository::save)
                .map(dishMapper::toDTO)
                .orElseThrow(() -> new DishException("error.dish.notfound"));
    }


    private void saveFile(MultipartFile image) {
        try {
            fileStorage.upload(image.getOriginalFilename(), "soon-files", image.getInputStream());
        } catch (IOException e) {
            e.printStackTrace();
            throw new FileStorageException("error.file.upload");
        }
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

