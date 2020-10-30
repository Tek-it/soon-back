package soon.io.soon.Controllers.dish;

import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import soon.io.soon.DTO.dish.DishDTO;
import soon.io.soon.Services.dish.DishService;

import java.util.List;

@RestController
@RequestMapping("/api")
@AllArgsConstructor
public class DishResource {

    private final DishService dishService;

    @PostMapping(value = "/category/dishes", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    private ResponseEntity<DishDTO> createDish(@RequestPart(value = "dish") DishDTO dishDTO,
                                               @RequestPart(value = "image", required = false) MultipartFile image
    ) {
        DishDTO result = dishService.createDish(dishDTO, image);
        return ResponseEntity.status(HttpStatus.OK).body(result);
    }

    @PutMapping("/category/dishes")
    private ResponseEntity<DishDTO> updateDish(@RequestPart(value = "dish") DishDTO dishDTO,
                                               @RequestPart(value = "image", required = false) MultipartFile image) {
        DishDTO result = dishService.updateDish(dishDTO, image);
        return ResponseEntity.status(HttpStatus.OK).body(result);
    }

    @GetMapping("/category/{id}/dishes")
    private ResponseEntity<List<DishDTO>> getDishesByCategory(@PathVariable("id") long id) {
        List<DishDTO> result = dishService.getDishesByCategoryId(id);
        return ResponseEntity.status(HttpStatus.OK).body(result);
    }

    @DeleteMapping("/category/dish/{id}")
    public ResponseEntity<Void> deleteDish(@PathVariable("id") Long id) {
        dishService.deleteDish(id);
        return ResponseEntity.status(HttpStatus.OK).build();
    }
}

