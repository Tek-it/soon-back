package soon.io.soon.Controllers.bill;

import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import soon.io.soon.DTO.bill.BillDTO;
import soon.io.soon.DTO.order.OrderDTO;
import soon.io.soon.Services.bill.BillService;

import java.util.List;

@RestController
@RequestMapping("/api/bill")
@AllArgsConstructor
public class BillController {

    private final BillService billService;


    @GetMapping("/current-restaurant")
    public ResponseEntity<List<BillDTO>> getCurrentRestaurantOrders() {
        List<BillDTO> result = billService.getBillsByRestaurantId();
        return ResponseEntity.status(HttpStatus.OK).body(result);
    }

    @DeleteMapping("delete/{id}")
    public ResponseEntity<Void> deleteBill(@PathVariable("id") Long id){
        billService.delete(id);
        return ResponseEntity.status(HttpStatus.OK).build();
    }
}
