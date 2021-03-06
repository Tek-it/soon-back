package soon.io.soon.Services.restaurant;

import lombok.AllArgsConstructor;
import org.jetbrains.annotations.NotNull;
import org.slf4j.Logger;
import org.springframework.data.domain.*;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import soon.io.soon.Controllers.restaurant.RestaurantController;
import soon.io.soon.DTO.restaurant.RestaurantConfDTO;
import soon.io.soon.DTO.restaurant.RestaurantConfMapper;
import soon.io.soon.DTO.restaurant.RestaurantDTO;
import soon.io.soon.DTO.restaurant.RestaurantMapper;
import soon.io.soon.Services.notification.NotificationService;
import soon.io.soon.Services.profile.ProfileService;
import soon.io.soon.Services.roles.RolesService;
import soon.io.soon.Utils.Errorhandler.EmailException;
import soon.io.soon.Utils.Errorhandler.UserException;
import soon.io.soon.models.TicketType;
import soon.io.soon.models.restaurant.Restaurant;
import soon.io.soon.models.restaurant.RestaurantConfiguration;
import soon.io.soon.models.restaurant.RestaurantConfigurationRepository;
import soon.io.soon.models.restaurant.RestaurantRepository;
import soon.io.soon.models.roles.RoleContext;
import soon.io.soon.models.roles.Roles;
import soon.io.soon.models.user.User;
import soon.io.soon.models.user.UserRepository;

import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@AllArgsConstructor
@Service
public class RestaurantService {

    private final Logger logger = LoggerFactory.getLogger(RestaurantController.class);
    private final RestaurantRepository restaurantRepository;
    private final UserRepository userRepository;
    private final RestaurantMapper restaurantMapper;
    private final ProfileService profileService;
    private final RestaurantConfigurationRepository restaurantConfigurationRepository;
    private final RestaurantConfMapper restaurantConfMapper;
    private final NotificationService notificationService;
    private final RolesService rolesService;

    public RestaurantDTO create(RestaurantDTO restaurantDTO) {
        logger.debug("SERVICE::Request to create restaurant {}", restaurantDTO);
        checkUniqueEmail(restaurantDTO.getOwner().getEmail());
        return Optional.of(restaurantDTO)
                .map(restaurantMapper::RestaurantDTOToRestaurant)
                .map(this::saveUser)
                .map(restaurantRepository::save)
                .map(this::createConfigurationNotification)
                .map(restaurantMapper::restaurantToDTO)
                .orElse(null);
    }

    private Restaurant saveUser(Restaurant restaurant) {
        User user = restaurant.getOwner();
        Roles roles = rolesService.create(Roles.builder().roleContext(RoleContext.RESTAURANT_MANAGER).build());
        user.setRoles(Collections.singleton(roles));
        user.setTicket(TicketType.RESTAURANT);
        userRepository.save(user);
        return restaurant;
    }

    private void checkUniqueEmail(String email) {
        if (userRepository.existsByEmail(email)) {
            throw new EmailException("error.email.duplication");
        }
    }

    public RestaurantDTO findRestaurantByUser(Long userId) {
        logger.debug("SERVICE::Request to find restaurant by User Id {}", userId);
        return restaurantRepository.findByOwnerId(userId)
                .map(restaurantMapper::restaurantToDTO)
                .orElseThrow(() -> new UserException("error.user.notfound"));
    }

    public RestaurantDTO updateRestaurant(RestaurantDTO restaurantDTO) {
        logger.debug("SERVICE::Request to update restaurant {}", restaurantDTO);
        return Optional.of(restaurantDTO)
                .map(restaurantMapper::RestaurantDTOToRestaurant)
                .map(restaurantRepository::save)
                .map(restaurantMapper::restaurantToDTO)
                .orElse(null);
    }

    public RestaurantDTO updateRestaurantAvailability(boolean availability) {
        logger.debug("SERVICE::Request to create restaurant {}", availability);
        return Optional.of(profileService.getCurrentConnectedRestaurant())
                .map(restaurantDTO -> changeAvailability(availability, restaurantDTO))
                .map(restaurantMapper::RestaurantDTOToRestaurant)
                .map(restaurantRepository::save)
                .map(restaurantMapper::restaurantToDTO)
                .orElse(null);
    }

    @NotNull
    private RestaurantDTO changeAvailability(boolean availability, RestaurantDTO restaurantDTO) {
        restaurantDTO.setAvailability(availability);
        return restaurantDTO;
    }

    public List<RestaurantDTO> getRestaurantsByHashtags(Long id) {
        logger.debug("SERVICE::Request to get restaurant by hashtags{}", id);
        return restaurantRepository.findRestaurantsByHashtagsId(id)
                .stream()
                .map(restaurantMapper::restaurantToDTO)
                .collect(Collectors.toList());

    }

    // TODO: 22/02/2021 fix exception
    public void saveConfiguration(List<RestaurantConfDTO> restaurantConfDTOS) {
        restaurantConfDTOS.forEach(restaurantConfDTO -> {
            RestaurantConfiguration restaurantConfigurationModel = restaurantConfMapper.toModel(restaurantConfDTO);
            if (!restaurantConfigurationRepository.existsByAttributeAndRestaurantId(restaurantConfDTO.getAttribute(), restaurantConfDTO.getRestaurantId())) {
                profileService.getCurrentRestaurant()
                        .map(restaurant -> {
                            restaurantConfigurationModel.setRestaurant(restaurant);
                            return restaurantConfigurationModel;
                        })
                        .map(restaurantConfigurationRepository::save)
                        .map(restaurantConfMapper::toDto)
                        .orElseThrow(() -> new RuntimeException("error"));
            } else {
                restaurantConfigurationRepository
                        .findByAttributeAndRestaurantId(restaurantConfDTO.getAttribute(), restaurantConfDTO.getRestaurantId())
                        .map(restaurantConfiguration -> {
                            restaurantConfiguration.setValue(restaurantConfDTO.getValue());
                            return restaurantConfMapper.toDto(restaurantConfigurationRepository.save(restaurantConfiguration));
                        }).orElseThrow(() -> new RuntimeException(""));
            }
        });
    }

    public List<RestaurantConfDTO> getConfigurations() {
        Long id = profileService.getCurrentConnectedRestaurant().getId();
        return restaurantConfigurationRepository.findAllByRestaurantId(id)
                .stream().map(restaurantConfMapper::toDto)
                .collect(Collectors.toList());
    }

    public Page<RestaurantDTO> findRestaurantByDistance(double latitude, double longitude, double distance, int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return new PageImpl<>(restaurantRepository.findRestaurantAround(latitude, longitude, distance, pageable)
                .stream()
                .map(restaurantMapper::restaurantToDTO)
                .collect(Collectors.toList()));
    }

    public Page<RestaurantDTO> findRestaurantByName(String name, int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        Page<Restaurant> restaurantPage = restaurantRepository.findRestaurantsByNameContaining(name, pageable);

        return new PageImpl<>(restaurantPage.getContent()
                .stream()
                .map(restaurantMapper::restaurantToDTO)
                .collect(Collectors.toList()), restaurantPage.getPageable(), restaurantPage.getTotalElements());
    }

    private Restaurant createConfigurationNotification(Restaurant restaurant) {
        this.notificationService.createConfigurationNotification(restaurant);
        return restaurant;
    }
}
