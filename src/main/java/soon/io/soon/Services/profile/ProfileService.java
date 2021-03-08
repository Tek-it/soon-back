package soon.io.soon.Services.profile;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import soon.io.soon.DTO.restaurant.RestaurantDTO;
import soon.io.soon.DTO.restaurant.RestaurantMapper;
import soon.io.soon.DTO.user.UserDTO;
import soon.io.soon.DTO.user.UserMapper;
import soon.io.soon.Services.filestorage.DropBoxStorage;
import soon.io.soon.Services.filestorage.FileStorage;
import soon.io.soon.Utils.Errorhandler.RestaurantException;
import soon.io.soon.Utils.Errorhandler.UserException;
import soon.io.soon.Utils.Utils;
import soon.io.soon.models.TicketType;
import soon.io.soon.models.restaurant.Restaurant;
import soon.io.soon.models.restaurant.RestaurantRepository;
import soon.io.soon.models.user.User;
import soon.io.soon.models.user.UserRepository;
import soon.io.soon.security.SecurityUtils;

import java.util.Optional;

@Service
@AllArgsConstructor
public class ProfileService {

    private final SecurityUtils securityUtils;
    private final RestaurantRepository restaurantRepository;
    private final RestaurantMapper restaurantMapper;
    private final DropBoxStorage fileStorage;
    private final UserRepository userRepository;
    private final UserMapper userMapper;

    public User getCurrentConnectedUser() {
        User currentConnectedUser = securityUtils.getCurrentConnectedUser();
        return Optional.ofNullable(currentConnectedUser)
                .orElseThrow(() -> new UserException("user.not_connected"));
    }

    public RestaurantDTO getCurrentConnectedRestaurant() {
        User currentConnectedUser = securityUtils.getCurrentConnectedUser();
        Optional.ofNullable(currentConnectedUser)
                .filter(user -> user.getTicket() == TicketType.RESTAURANT)
                .orElseThrow(() -> new UserException("user.not_connected"));
        return restaurantRepository.findByOwnerId(currentConnectedUser.getId())
                .map(restaurantMapper::restaurantToDTO)
                .orElseThrow(() -> new UserException("error.user.notfound"));
    }

    public UserDTO getCurrentConnectedUserSimple() {
        User currentConnectedUser = securityUtils.getCurrentConnectedUser();
        return Optional.ofNullable(currentConnectedUser)
                .filter(user -> user.getTicket() == TicketType.SIMPLE_USER)
                .map(userMapper::toDTO)
                .orElseThrow(() -> new UserException("user.not_connected"));
    }

    public UserDTO updateUser(UserDTO userDTO) {
            User user = getCurrentConnectedUser();
            return Optional.of(userDTO)
                    .map(userMapper::toModel)
                    .map(userResult->{
                        userResult.setTicket(TicketType.SIMPLE_USER);
                        userResult.setPassword(user.getPassword());
                        return userResult;
                    })
                    .map(userRepository::save)
                    .map(userMapper::toDTO)
                    .orElse(null);
    }


    public Optional<Restaurant> getCurrentRestaurant() {
        User currentConnectedUser = securityUtils.getCurrentConnectedUser();
        return restaurantRepository.findByOwnerId(currentConnectedUser.getId());
    }

    public void uploadAvatar(MultipartFile avatar) {
        RestaurantDTO currentConnectedRestaurant = getCurrentConnectedRestaurant();
        Utils.saveFile(avatar, fileStorage);
        restaurantRepository.findById(currentConnectedRestaurant.getId())
                .map(restaurant -> {
                    restaurant.setImageProfile(avatar.getOriginalFilename());
                    return restaurant;
                })
                .map(restaurantRepository::save)
                .orElseThrow(() -> new RestaurantException("error.restaurant.notfound"));

    }

    public byte[] downloadImage(String filename) {
        return fileStorage.download(filename, "soon-files");
    }
}
