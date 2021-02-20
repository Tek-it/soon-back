package soon.io.soon.Services.bill;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import soon.io.soon.DTO.bill.BillDTO;
import soon.io.soon.DTO.bill.BillMapper;
import soon.io.soon.Utils.Errorhandler.BillException;
import soon.io.soon.Utils.Errorhandler.CategoryExeption;
import soon.io.soon.models.bill.Bill;
import soon.io.soon.models.bill.BillRepository;

import javax.transaction.Transactional;
import java.util.Optional;

@Service
@AllArgsConstructor
public class BillService {

    public final BillMapper billMapper;
    public final BillRepository billRepository;

    public BillDTO create(BillDTO bill) {
        return Optional.of(bill)
                .map(billMapper::BillDTOToBill)
                .map(billRepository::save)
                .map(billMapper::BillTOBillDTO)
                .orElseThrow(() -> new BillException("error.bill.creation"));


    }

    public BillDTO update(BillDTO billDTO) {
        return billRepository.findById(billDTO.getId())
                .map(bill -> {

                    bill.setTax(billDTO.getTax());
                    bill.setTotal(billDTO.getTotal());
                    return bill;
                })
                .map(billRepository::save)
                .map(billMapper::BillTOBillDTO)
                .orElseThrow(() -> new BillException("error.bill.update"));

    }

    @Transactional
    public void delete(Long billId) {
        billRepository.findById(billId)
                .map(Bill::getId)
                .ifPresent(billRepository::deleteById);


    }
}
