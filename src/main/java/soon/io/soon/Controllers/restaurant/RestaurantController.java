package soon.io.soon.Controllers.restaurant;

import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import soon.io.soon.DTO.restaurant.RestaurantConfDTO;
import soon.io.soon.DTO.restaurant.RestaurantDTO;
import soon.io.soon.Services.restaurant.RestaurantService;

import java.util.List;

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

    @PutMapping
    public ResponseEntity<RestaurantDTO> updateRestaurantAvailability(@RequestParam("availability") boolean availability) {
        logger.info("RESOURCE::Request to get the current connected profile");
        RestaurantDTO restaurant = restaurantService.updateRestaurantAvailability(availability);
        return ResponseEntity.status(HttpStatus.OK).body(restaurant);
    }

    @GetMapping("/hashtags/{id}")
    public ResponseEntity<List<RestaurantDTO>> getRestaurantByHashtag(@PathVariable("id") Long id) {
        logger.info("RESOURCE::Request to get the current connected profile");
        List<RestaurantDTO> restaurantList = restaurantService.getRestaurantsByHashtags(id);
        return ResponseEntity.status(HttpStatus.OK).body(restaurantList);
    }


    @PostMapping("/configuration")
    public ResponseEntity<Void> createConfiguration(@RequestBody List<RestaurantConfDTO> restaurantConfDTO) {
        restaurantService.saveConfiguration(restaurantConfDTO);
        return ResponseEntity.status(HttpStatus.OK).build();
    }

    @GetMapping("/configuration")
    public ResponseEntity<List<RestaurantConfDTO>> getConfigurations() {
        return ResponseEntity.status(HttpStatus.OK).body(restaurantService.getConfigurations());
    }

    @GetMapping("/restaurant-around")
    public ResponseEntity<Page<RestaurantDTO>> findRestaurantByDistance(@RequestParam("distance") double distance,
                                                                        @RequestParam("longitude") double longitude,
                                                                        @RequestParam("latitude") double latitude,
                                                                        @RequestParam("page") int page,
                                                                        @RequestParam("size") int size) {
        logger.info("RESOURCE::REQUEST TO GET LIST RESTAURANT BY DISTANCE {}", distance);
        Page<RestaurantDTO> result = restaurantService.findRestaurantByDistance(latitude, longitude, distance, page, size);
        return ResponseEntity.status(HttpStatus.OK).body(result);
    }

    @GetMapping("/restaurant-name")
    public ResponseEntity<Page<RestaurantDTO>> findRestaurantByName(@RequestParam("name") String name,
                                                                    @RequestParam("page") int page,
                                                                    @RequestParam("size") int size) {
        logger.info("RESOURCE::REQUEST TO GET LIST RESTAURANT BY NAME {}", name);
        Page<RestaurantDTO> result = restaurantService.findRestaurantByName(name, page, size);
        return ResponseEntity.status(HttpStatus.OK).body(result);
    }


}
