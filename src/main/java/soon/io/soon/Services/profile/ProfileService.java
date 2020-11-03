package soon.io.soon.Services.profile;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import soon.io.soon.DTO.restaurant.RestaurantDTO;
import soon.io.soon.Services.restaurant.RestaurantService;
import soon.io.soon.Utils.Errorhandler.DishException;
import soon.io.soon.Utils.Errorhandler.UserNotFoundException;
import soon.io.soon.models.TicketType;
import soon.io.soon.models.user.User;
import soon.io.soon.security.SecurityUtils;

import java.util.Optional;

@Service
@AllArgsConstructor
public class ProfileService {

    private final SecurityUtils securityUtils;
    private final RestaurantService restaurantService;

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
        return restaurantService.findRestaurantByUser(currentConnectedUser.getId());
    }


}
