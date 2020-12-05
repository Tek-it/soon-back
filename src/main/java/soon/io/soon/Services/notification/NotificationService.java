package soon.io.soon.Services.notification;

import lombok.AllArgsConstructor;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Service;

@AllArgsConstructor
@Service
public class NotificationService {
    private final SimpMessageSendingOperations messagingTemplate;

    // TODO: 05/12/2020 change this to support send to specific user
    public void sendNotification(String to, Object subject) {
        messagingTemplate.convertAndSend("order-state", subject);
    }
}
