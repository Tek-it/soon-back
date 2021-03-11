package soon.io.soon.Controllers.notification;

import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import soon.io.soon.DTO.notification.NotificationDTO;
import soon.io.soon.Services.notification.NotificationService;

import java.util.List;

@RestController
@RequestMapping("/api/notification")
@AllArgsConstructor
public class NotificationController {
    private final Logger logger = LoggerFactory.getLogger(NotificationController.class);
    private final NotificationService notificationService;

    @GetMapping
    public ResponseEntity<List<NotificationDTO>> getListNotificationByRestaurant(
            @RequestParam(defaultValue = "0", value = "page") int page,
            @RequestParam(defaultValue = "10", value = "size") int size
    ) {
        logger.debug("RESOURCE::REQUEST TO GET NOTIFICATION BY CURRENT CONNECTED RESTAURANT");
        return ResponseEntity.ok(notificationService.getNotificationByRestaurant(PageRequest.of(page, size)));
    }

    @PutMapping("/{id}")
    public ResponseEntity<NotificationDTO> updateNotificationStatus(@PathVariable("id") Long id) {
        logger.debug("RESOURCE::REQUEST TO UPDATE NOTIFICATION STATUS BY ID {}", id);
        return ResponseEntity.ok(notificationService.updateNotificationStatus(id));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteNotification(@PathVariable("id") Long id) {
        logger.debug("RESOURCE::REQUEST TO DELETE NOTIFICATION STATUS BY ID {}", id);
        notificationService.deleteNotification(id);
        return ResponseEntity.ok().build();
    }
}
