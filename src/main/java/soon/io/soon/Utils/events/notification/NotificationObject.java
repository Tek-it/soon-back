package soon.io.soon.Utils.events.notification;

import lombok.Builder;
import lombok.Data;
import lombok.ToString;

import java.time.LocalDateTime;

@Data
@ToString
@Builder
public class NotificationObject {
    private int id;
    private String title;
    private String content;
    private String type;
    private LocalDateTime localDateTime;

}
