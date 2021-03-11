package soon.io.soon.DTO.notification;

import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import soon.io.soon.models.notification.NotificationTypes;
import soon.io.soon.models.notification.Notifications;

@Mapper(componentModel = "spring", injectionStrategy = InjectionStrategy.CONSTRUCTOR)
public interface NotificationMapper {

    @Mapping(target = "restaurant.id", source = "restaurantId")
    public Notifications toModel(NotificationDTO notificationDTO);

    @Mapping(target = "type", expression = "java(getNotificationType(notifications.getNotificationType()))")
    @Mapping(target = "restaurantId", source = "restaurant.id")
    public NotificationDTO toDTO(Notifications notifications);

    public default String getNotificationType(NotificationTypes notificationTypes) {
        return notificationTypes.name();
    }
}
