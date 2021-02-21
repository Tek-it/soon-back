package soon.io.soon.DTO.bill;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import soon.io.soon.DTO.catergory.CategoryDTO;
import soon.io.soon.models.bill.Bill;
import soon.io.soon.models.category.Category;
import soon.io.soon.models.order.Order;

@Mapper(componentModel = "spring")
public abstract class BillMapper {

    public abstract Bill BillDTOToBill(BillDTO billDTO);

    @Mapping(target = "orderId", source = "order.id")
    @Mapping(target = "status", expression = "java(getBillStatus(bill.getOrder()))")
    public abstract BillDTO BillTOBillDTO(Bill bill);


    public boolean getBillStatus(Order order){
        return order.getOrderState().isAccepted();
    }
}
