package soon.io.soon.Utils.events.notification;

import org.springframework.context.ApplicationEvent;

public class NotificationEvent extends ApplicationEvent {

    private NotificationObject notificationObject;

    public NotificationEvent(Object source, NotificationObject notificationObject) {
        super(source);
        this.notificationObject = notificationObject;
    }

    public NotificationObject getNotificationObject() {
        return notificationObject;
    }
}
