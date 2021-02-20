package soon.io.soon.DTO.bill;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import soon.io.soon.DTO.catergory.CategoryDTO;
import soon.io.soon.models.bill.Bill;
import soon.io.soon.models.category.Category;

@Mapper(componentModel = "spring")
public abstract class BillMapper {

    public abstract Bill BillDTOToBill(BillDTO billDTO);
    public abstract BillDTO BillTOBillDTO(Bill bill);
}
