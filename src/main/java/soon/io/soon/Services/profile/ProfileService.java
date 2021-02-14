package soon.io.soon.Services.profile;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import soon.io.soon.DTO.restaurant.RestaurantDTO;
import soon.io.soon.DTO.restaurant.RestaurantMapper;
import soon.io.soon.Services.filestorage.FileStorage;
import soon.io.soon.Utils.Errorhandler.FileStorageException;
import soon.io.soon.Utils.Errorhandler.RestaurantNotFound;
import soon.io.soon.Utils.Errorhandler.UserNotFoundException;
import soon.io.soon.models.TicketType;
import soon.io.soon.models.restaurant.RestaurantRepository;
import soon.io.soon.models.user.User;
import soon.io.soon.security.SecurityUtils;

import java.io.IOException;
import java.util.Optional;

@Service
@AllArgsConstructor
public class ProfileService {

    private final SecurityUtils securityUtils;
    private final RestaurantRepository restaurantRepository;
    private final RestaurantMapper restaurantMapper;
    private final FileStorage fileStorage;

    public User getCurrentConnectedUser() {
        User currentConnectedUser = securityUtils.getCurrentConnectedUser();
        return Optional.ofNullable(currentConnectedUser)
                .orElseThrow(() -> new UserNotFoundException("user.not_connected"));
    }

    public RestaurantDTO getCurrentConnectedRestaurant() {
        User currentConnectedUser = securityUtils.getCurrentConnectedUser();
        Optional.ofNullable(currentConnectedUser)
                .filter(user -> user.getTicket() == TicketType.RESTAURANT)
                .orElseThrow(() -> new UserNotFoundException("user.not_connected"));
        return restaurantRepository.findByOwnerId(currentConnectedUser.getId())
                .map(restaurantMapper::restaurantToDTO)
                .orElseThrow(() -> new UserNotFoundException("error.user.notfound"));
    }

    public void uploadAvatar(MultipartFile avatar) {
        RestaurantDTO currentConnectedRestaurant = getCurrentConnectedRestaurant();
        try {
            fileStorage.upload(avatar.getOriginalFilename(), "soon-files", avatar.getInputStream());
            restaurantRepository.findById(currentConnectedRestaurant.getId())
                    .map(restaurant -> {
                        restaurant.setImageProfile(avatar.getOriginalFilename());
                        return restaurant;
                    })
                    .map(restaurantRepository::save)
                    .orElseThrow(() -> new RestaurantNotFound("error.restaurant.notfound"));
        } catch (IOException e) {
            throw new FileStorageException("error.file.upload");
        }
    }
}
