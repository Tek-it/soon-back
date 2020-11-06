package soon.io.soon.Controllers.restaurant;

import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import soon.io.soon.Controllers.profile.ProfileResource;
import soon.io.soon.DTO.restaurant.RestaurantDTO;
import soon.io.soon.Services.restaurant.RestaurantService;

@RestController
@RequestMapping("/api/restaurant")
@AllArgsConstructor
public class RestaurantController {
    private final Logger logger = LoggerFactory.getLogger(RestaurantController.class);
    private final RestaurantService restaurantService;

    @PostMapping("/create-account")
    public ResponseEntity<RestaurantDTO> createAccount(@RequestBody RestaurantDTO restaurantDTO) {
        RestaurantDTO restaurant = restaurantService.create(restaurantDTO);
        return ResponseEntity.status(HttpStatus.OK).body(restaurant);
    }

    @PutMapping("/update-account")
    public ResponseEntity<RestaurantDTO> updateCurrentRestaurant(@RequestBody RestaurantDTO restaurantDTO) {
        logger.info("RESOURCE::Request to get the current connected profile");
        RestaurantDTO restaurant = restaurantService.updateRestaurant(restaurantDTO);
        return ResponseEntity.status(HttpStatus.OK).body(restaurant);
    }

}
