package soon.io.soon.Controllers.category;

import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import soon.io.soon.DTO.catergory.CategoryDTO;
import soon.io.soon.Services.category.CategoryService;

import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("/api/category")
public class CategoryResource {

    private final CategoryService categoryService;

    @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<CategoryDTO> createCategory(@RequestPart(value = "category") CategoryDTO categoryDTO,
                                                      @RequestPart(value = "image", required = false) MultipartFile image
    ) {
        CategoryDTO result = categoryService.create(categoryDTO, image);
        return ResponseEntity.status(HttpStatus.OK).body(result);
    }

    @PutMapping
    public ResponseEntity<CategoryDTO> updateCategory(@RequestBody CategoryDTO categoryDTO) {
        CategoryDTO result = categoryService.update(categoryDTO);
        return ResponseEntity.status(HttpStatus.OK).body(result);
    }

    @GetMapping
    public ResponseEntity<List<CategoryDTO>> getCategories() {
        List<CategoryDTO> result = categoryService.getCategories();
        return ResponseEntity.status(HttpStatus.OK).body(result);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> updateCategory(@PathVariable("id") Long categoryId) {
        categoryService.delete(categoryId);
        return ResponseEntity.status(HttpStatus.OK).build();
    }

    @GetMapping("/{filename}")
    public byte[] getCategoryImage(@PathVariable("filename") String filename) {
        return categoryService.downloadImage(filename);
    }
}
