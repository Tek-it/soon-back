package soon.io.soon.Controllers.dish;

import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import soon.io.soon.DTO.dish.DishDTO;
import soon.io.soon.Services.dish.DishService;

import java.util.List;

@RestController
@RequestMapping("/api")
@AllArgsConstructor
public class DishResource {

    private final DishService dishService;

    @PostMapping("/category/dishes")
    private ResponseEntity<DishDTO> createDish(@RequestBody DishDTO dishDTO) {
        DishDTO result = dishService.createDish(dishDTO);
        return ResponseEntity.status(HttpStatus.OK).body(result);
    }

    @PutMapping("/category/dishes")
    private ResponseEntity<DishDTO> updateDish(@RequestBody DishDTO dishDTO) {
        DishDTO result = dishService.updateDish(dishDTO);
        return ResponseEntity.status(HttpStatus.OK).body(result);
    }

    @GetMapping("/category/{id}/dishes")
    private ResponseEntity<List<DishDTO>> getDishesByCategory(@PathVariable("id") long id) {
        List<DishDTO> result = dishService.getDishesByCategoryId(id);
        return ResponseEntity.status(HttpStatus.OK).body(result);
    }
}
