package soon.io.soon.Services.category;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import soon.io.soon.DTO.catergory.CategoryDTO;
import soon.io.soon.DTO.catergory.CategoryMapper;
import soon.io.soon.Services.filestorage.FileStorage;
import soon.io.soon.Utils.Errorhandler.FileStorageException;
import soon.io.soon.Utils.Errorhandler.RestaurantNotFound;
import soon.io.soon.models.category.CategoryRepository;
import soon.io.soon.models.restaurant.Restaurant;
import soon.io.soon.models.restaurant.RestaurantRepository;

import javax.transaction.Transactional;
import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class CategoryService {

    private final CategoryRepository categoryRepository;
    private final CategoryMapper categoryMapper;
    private final RestaurantRepository restaurantRepository;
    private final FileStorage fileStorage;

    public CategoryDTO create(CategoryDTO categoryDTO, MultipartFile image) {
        try {
            Restaurant restaurant = restaurantRepository
                    .findById(categoryDTO.getRestaurant())
                    .orElseThrow(() -> new RestaurantNotFound("error.error.notfound"));
            String filePath = "";
            if (image != null) {
                filePath = fileStorage.upload(image.getOriginalFilename(), "soon-files", image.getInputStream());
            }
            String finalFilePath = filePath;
            return Optional.of(categoryDTO)
                    .map(categoryMapper::toModel)
                    .map(category -> {
                        category.setImage((image != null ? image.getOriginalFilename() : ""));
                        category.setRestaurant(restaurant);
                        return category;
                    })
                    .map(categoryRepository::save)
                    .map(categoryMapper::toDTO)
                    .orElse(null);
        } catch (IOException e) {
            e.printStackTrace();
            throw new FileStorageException("error.file.upload");
        }
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

    @Transactional
    public void delete(Long categoryId) {
        categoryRepository.deleteById(categoryId);
    }

    public byte[] downloadImage(String filename) {
        return fileStorage.download(filename, "soon-files");
    }
}
