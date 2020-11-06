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
    private final ProfileService profileService;

    @GetMapping("/current-user")
    public ResponseEntity<User> getCurrentUser() {
        User currentConnectedUser = profileService.getCurrentConnectedUser();
        return ResponseEntity.status(HttpStatus.OK).body(currentConnectedUser);
    }

    @GetMapping("/current-restaurant")
    public ResponseEntity<RestaurantDTO> getCurrentRestaurant() {
        RestaurantDTO restaurantDTO = profileService.getCurrentConnectedRestaurant();
        return ResponseEntity.status(HttpStatus.OK).body(restaurantDTO);
    }


}
