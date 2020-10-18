package soon.io.soon.Controllers.category;

import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import soon.io.soon.DTO.catergory.CategoryDTO;
import soon.io.soon.Services.category.CategoryService;

import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("/api/category")
public class CategoryResource {

    private final CategoryService categoryService;

    @PostMapping
    public ResponseEntity<CategoryDTO> createCategory(@RequestBody CategoryDTO categoryDTO) {
        CategoryDTO result = categoryService.create(categoryDTO);
        return ResponseEntity.status(HttpStatus.OK).body(result);
    }

    @PutMapping
    public ResponseEntity<CategoryDTO> updateCategory(@RequestBody CategoryDTO categoryDTO) {
        CategoryDTO result = categoryService.update(categoryDTO);
        return ResponseEntity.status(HttpStatus.OK).body(result);
    }

    @GetMapping
    public ResponseEntity<List<CategoryDTO>> getCategories(@RequestParam("restaurantId") Long restaurantId) {
        List<CategoryDTO> result = categoryService.getCategoriesByRestaurantId(restaurantId);
        return ResponseEntity.status(HttpStatus.OK).body(result);
    }
}
