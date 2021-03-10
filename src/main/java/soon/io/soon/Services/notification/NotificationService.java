package soon.io.soon.Services.notification;

import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Service;
import soon.io.soon.models.notification.NotificationRepository;
import soon.io.soon.models.notification.NotificationTypes;
import soon.io.soon.models.notification.Notifications;

import java.time.LocalDateTime;

@AllArgsConstructor
@Service
public class NotificationService {

    private final Logger logger = LoggerFactory.getLogger(NotificationService.class);

    private final SimpMessageSendingOperations messagingTemplate;
    private final NotificationRepository notificationRepository;

    // TODO: 05/12/2020 change this to support send to specific user
    public void sendNotification(String to, Object subject) {
        messagingTemplate.convertAndSend("order-state", subject);
    }

    public void createConfigurationNotification() {
        logger.debug("SERVICE::CREATE STORAGE CONFIGURATION NOTIFICATION");
        Notifications dropBoxNotification = Notifications.builder()
                .createAt(LocalDateTime.now())
                .status("PENDING")
                .notificationType(NotificationTypes.NOTIFICATION_DROPBOX_CONFIGURATION)
                .build();
    }

    public void getNotificationByRestaurant() {
        
    }
}
