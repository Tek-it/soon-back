package soon.io.soon.Controllers.profile;

import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import soon.io.soon.DTO.restaurant.RestaurantDTO;
import soon.io.soon.Services.profile.ProfileService;
import soon.io.soon.models.user.User;

@RestController
@RequestMapping("/api/profile")
@AllArgsConstructor
public class ProfileResource {
    private final Logger logger = LoggerFactory.getLogger(ProfileResource.class);
    private final ProfileService profileService;

    @GetMapping("/current-user")
    public ResponseEntity<User> getCurrentUser() {
        logger.info("RESOURCE::Request to get the current connected profile");
        User currentConnectedUser = profileService.getCurrentConnectedUser();
        return ResponseEntity.status(HttpStatus.OK).body(currentConnectedUser);
    }

    @GetMapping("/current-restaurant")
    public ResponseEntity<RestaurantDTO> getCurrentRestaurant() {
        logger.info("RESOURCE::Request to get the current connected profile");
        RestaurantDTO restaurantDTO = profileService.getCurrentConnectedRestaurant();
        return ResponseEntity.status(HttpStatus.OK).body(restaurantDTO);
    }


}
