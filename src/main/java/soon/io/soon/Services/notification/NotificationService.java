package soon.io.soon.Services.notification;

import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Service;
import soon.io.soon.DTO.notification.NotificationDTO;
import soon.io.soon.DTO.notification.NotificationMapper;
import soon.io.soon.Services.profile.ProfileService;
import soon.io.soon.models.notification.NotificationRepository;
import soon.io.soon.models.notification.Notifications;
import soon.io.soon.models.restaurant.Restaurant;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import static soon.io.soon.models.notification.NotificationTypes.NOTIFICATION_DROPBOX_CONFIGURATION;
import static soon.io.soon.models.notification.NotificationTypes.NOTIFICATION_TWILIO_CONFIGURATION;

@AllArgsConstructor
@Service
public class NotificationService {

    private final Logger logger = LoggerFactory.getLogger(NotificationService.class);

    private final SimpMessageSendingOperations messagingTemplate;
    private final NotificationRepository notificationRepository;
    private final NotificationMapper notificationMapper;
    private final ProfileService profileService;

    // TODO: 05/12/2020 change this to support send to specific user
    public void sendNotification(String to, Object subject) {
        messagingTemplate.convertAndSend("order-state", subject);
    }

    public void createConfigurationNotification(Restaurant restaurant) {
        logger.debug("SERVICE::CREATE STORAGE CONFIGURATION NOTIFICATION");
        List<Notifications> notifications = Arrays.asList(
                Notifications.builder()
                        .createAt(LocalDateTime.now())
                        .status("PENDING")
                        .notificationType(NOTIFICATION_DROPBOX_CONFIGURATION)
                        .restaurant(restaurant)
                        .build(),
                Notifications.builder()
                        .createAt(LocalDateTime.now())
                        .status("PENDING")
                        .notificationType(NOTIFICATION_TWILIO_CONFIGURATION)
                        .restaurant(restaurant)
                        .build());
        notificationRepository.saveAll(notifications);
    }

    public Page<NotificationDTO> getNotificationByRestaurant(Pageable pageable) {
        logger.debug("SERVICE::GET LIST OF CURRENT CONNECTED RESTAURANT");
        Long restaurantId = profileService.getCurrentConnectedRestaurant().getId();
        return notificationRepository
                .findAllByRestaurantId(restaurantId, pageable)
                .map(notificationMapper::toDTO);
    }

    public NotificationDTO updateNotificationStatus(Long id) {
        return notificationRepository.findById(id)
                .map(notifications -> {
                    notifications.setStatus("DONE");
                    return notifications;
                })
                .map(notificationRepository::save)
                .map(notificationMapper::toDTO)
                .orElseThrow(() -> new RuntimeException("error.notification.notfound"));
    }

    public void deleteNotification(Long id) {
        notificationRepository.deleteById(id);
    }
}
