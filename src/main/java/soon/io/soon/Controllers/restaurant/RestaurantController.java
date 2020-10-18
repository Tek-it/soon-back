package soon.io.soon.Controllers.restaurant;

import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import soon.io.soon.DTO.restaurant.RestaurantDTO;
import soon.io.soon.Services.restaurant.RestaurantService;

@RestController
@RequestMapping("/api/restaurant")
@AllArgsConstructor
public class RestaurantController {

    private final RestaurantService restaurantService;

    @PostMapping("/create-account")
    public ResponseEntity<RestaurantDTO> createAccount(@RequestBody RestaurantDTO restaurantDTO) {
        RestaurantDTO restaurant = restaurantService.create(restaurantDTO);
        return ResponseEntity.status(HttpStatus.OK).body(restaurant);
    }

}
