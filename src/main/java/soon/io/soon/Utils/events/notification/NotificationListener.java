package soon.io.soon.Utils.events.notification;

import org.springframework.context.event.EventListener;

public class NotificationListener<T> {

    @EventListener
    public void consumeEvent(T event) {
        // depending on annotation.event we handel
    }
}
