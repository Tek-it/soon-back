package soon.io.soon.Services.category;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import soon.io.soon.DTO.catergory.CategoryDTO;
import soon.io.soon.DTO.catergory.CategoryMapper;
import soon.io.soon.Services.filestorage.FileStorage;
import soon.io.soon.Services.profile.ProfileService;
import soon.io.soon.Utils.Errorhandler.CategoryNotFoundExeption;
import soon.io.soon.Utils.Errorhandler.FileStorageException;
import soon.io.soon.models.category.Category;
import soon.io.soon.models.category.CategoryRepository;
import soon.io.soon.models.restaurant.RestaurantRepository;

import javax.transaction.Transactional;
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
    private final ProfileService profileService;

    public CategoryDTO create(CategoryDTO categoryDTO, MultipartFile image) {
        uploadImage(image);
        return Optional.of(categoryDTO)
                .map(categoryMapper::toModel)
                .map(category -> {
                    if (image != null && !image.isEmpty()) {
                        category.setImage(image.getOriginalFilename());
                    } else {
                        category.setImage("");
                    }
                    return category;
                })
                .map(categoryRepository::save)
                .map(categoryMapper::toDTO)
                .orElseThrow(() -> new CategoryNotFoundExeption("error.category.creation.problem"));
    }

    public CategoryDTO update(CategoryDTO categoryDTO, MultipartFile image) {
        uploadImage(image);
        return categoryRepository.findById(categoryDTO.getId())
                .map(category -> {
                    if (image != null && !image.isEmpty()) {
                        category.setImage(image.getOriginalFilename());
                    }
                    category.setName(categoryDTO.getName());
                    category.setDescription(categoryDTO.getDescription());
                    return category;
                }).map(categoryRepository::save)
                .map(categoryMapper::toDTO)
                .orElseThrow(() -> new CategoryNotFoundExeption("error.category.not.created"));
    }

    private void uploadImage(MultipartFile image) {
        try {
            if (image != null) {
                fileStorage.upload(image.getOriginalFilename(), "soon-files", image.getInputStream());
            }
        } catch (Exception e) {
            throw new FileStorageException("error.file.upload");
        }
    }

    @Transactional
    public void delete(Long categoryId) {
        categoryRepository.findById(categoryId)
                .map(this::deleteImage)
                .map(Category::getId)
                .ifPresent(categoryRepository::deleteById);
    }

    private Category deleteImage(Category category) {
        if (category.getImage() != null && !category.getImage().equals("")) {
            fileStorage.delete(category.getImage(), "soon-files");
        }
        return category;
    }

    public byte[] downloadImage(String filename) {
        return fileStorage.download(filename, "soon-files");
    }

    public List<CategoryDTO> getCategories() {
        return categoryRepository.findAll()
                .stream()
                .map(categoryMapper::toDTO)
                .collect(Collectors.toList());
    }

    public List<CategoryDTO> getCategoriesCurrentRestaurant() {
        Long id = profileService.getCurrentConnectedRestaurant()
                .getId();
        return categoryRepository.findByRestaurantId(id)
                .stream()
                .map(categoryMapper::toDTO)
                .collect(Collectors.toList());
    }
}
