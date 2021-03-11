package soon.io.soon.DTO.notification;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class NotificationDTO {
    private Long id;
    private String title;
    private String body;
    private String type;
    private String status;
    private LocalDateTime createAt;
    private Long restaurantId;
}
