package soon.io.soon.DTO.order;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import soon.io.soon.models.orderDetails.OrderDetails;

@Mapper(componentModel = "spring")
public abstract class OrderDetailsMapper {

    @Mapping(target = "order.id", source = "orderId")
    @Mapping(target = "dish.id", source = "dishId")
    public abstract OrderDetails toModel(OrderDetailsDTO orderDetailsDTO);

    @Mapping(target = "dishId", source = "dish.id")
    @Mapping(target = "orderId", source = "order.id")
    public abstract OrderDetailsDTO toDTO(OrderDetails orderDetails);

}
