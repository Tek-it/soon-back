package soon.io.soon.Utils.events.notification;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Component;

@Component
public class NotificationPublisher<T> {

    @Autowired
    private ApplicationEventPublisher applicationEventPublisher;

    /**
     * Generic Event publisher
     * @param event
     */
    public void publishEvent(T event) {
        this.applicationEventPublisher.publishEvent(event);
    }
}
