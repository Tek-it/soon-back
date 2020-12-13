package soon.io.soon.Services.order

import org.springframework.stereotype.Service
import soon.io.soon.DTO.order.OrderMapper
import soon.io.soon.Services.external.geoLocation.GeoLocationResolver
import soon.io.soon.Services.notification.NotificationService
import soon.io.soon.Services.profile.ProfileService
import soon.io.soon.models.order.OrderRepository
import soon.io.soon.models.orderDetails.OrderDetailsRepository

@Service
data class OrderServiceKT(val orderRepository: OrderRepository,
                          val orderMapper: OrderMapper,
                          val profileService: ProfileService,
                          val geoLocationResolver: GeoLocationResolver,
                          val notificationService: NotificationService,
                          val orderDetailsRepository: OrderDetailsRepository
) {
}
