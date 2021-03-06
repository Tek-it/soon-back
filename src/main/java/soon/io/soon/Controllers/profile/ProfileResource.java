package soon.io.soon.Controllers.profile;

import lombok.AllArgsConstructor;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import soon.io.soon.DTO.restaurant.RestaurantDTO;
import soon.io.soon.DTO.user.UserDTO;
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

    @GetMapping("/current-simple-user")
    public ResponseEntity<UserDTO> getCurrentSimpleUser() {
        UserDTO currentConnectedUser = profileService.getCurrentConnectedUserSimple();
        return ResponseEntity.status(HttpStatus.OK).body(currentConnectedUser);
    }

    @PutMapping("/current-simple-user")
    public ResponseEntity<UserDTO> updateCurrentSimpleUser(@RequestBody UserDTO userDTO) {
        UserDTO currentConnectedUser = profileService.updateUser(userDTO);
        return ResponseEntity.status(HttpStatus.OK).body(currentConnectedUser);
    }

    @GetMapping("/current-restaurant")
    public ResponseEntity<RestaurantDTO> getCurrentRestaurant() {
        RestaurantDTO restaurantDTO = profileService.getCurrentConnectedRestaurant();
        return ResponseEntity.status(HttpStatus.OK).body(restaurantDTO);
    }

    @PostMapping("/avatar")
    public ResponseEntity<Void> uploadAvatar(@Param("avatar") MultipartFile avatar) {
        profileService.uploadAvatar(avatar);
        return ResponseEntity.status(HttpStatus.OK).build();
    }

    @PutMapping("/avatar")
    public ResponseEntity<Void> updateAvatar(@Param("avatar") MultipartFile avatar) {
        profileService.uploadAvatar(avatar);
        return ResponseEntity.status(HttpStatus.OK).build();
    }

    @PostMapping("/avatar-owner")
    public ResponseEntity<Void> updateOwnerUserAvatar(@Param("avatar") MultipartFile avatar) {
        profileService.uploadOwnerUserAvatar(avatar);
        return ResponseEntity.status(HttpStatus.OK).build();
    }

    @GetMapping("/avatar/{filename}")
    public byte[] getRestaurantProfileImage(@PathVariable("filename") String filename) {
        return profileService.downloadImage(filename);
    }

}
