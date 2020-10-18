package soon.io.soon.Services.restaurant;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import soon.io.soon.DTO.restaurant.RestaurantDTO;
import soon.io.soon.DTO.restaurant.RestaurantMapper;
import soon.io.soon.Utils.Errorhandler.EmailDuplicationException;
import soon.io.soon.Utils.Errorhandler.UserNotFoundException;
import soon.io.soon.models.TicketType;
import soon.io.soon.models.restaurant.Restaurant;
import soon.io.soon.models.restaurant.RestaurantRepository;
import soon.io.soon.models.user.User;
import soon.io.soon.models.user.UserRepository;

import java.util.Optional;

@AllArgsConstructor
@Service
public class RestaurantService {

    private final RestaurantRepository restaurantRepository;
    private final UserRepository userRepository;
    private final RestaurantMapper restaurantMapper;

    public RestaurantDTO create(RestaurantDTO restaurantDTO) {
        checkUniqueEmail(restaurantDTO.getOwner().getEmail());
        return Optional.of(restaurantDTO)
                .map(restaurantMapper::RestaurantDTOToRestaurant)
                .map(this::saveUser)
                .map(restaurantRepository::save)
                .map(restaurantMapper::restaurantToDTO)
                .orElse(null);
    }

    private Restaurant saveUser(Restaurant restaurant) {
        User user = restaurant.getOwner();
        user.setTicket(TicketType.RESTAURANT);
        userRepository.save(user);
        return restaurant;
    }

    private void checkUniqueEmail(String email) {
        if (userRepository.existsByEmail(email)) {
            throw new EmailDuplicationException("error.email.duplication");
        }
    }

    public RestaurantDTO findRestaurantByUser(Long userId) {
        return restaurantRepository.findByOwnerId(userId)
                .map(restaurantMapper::restaurantToDTO)
                .orElseThrow(() -> new UserNotFoundException("error.user.notfound"));
    }
}
