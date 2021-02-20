package soon.io.soon.Controllers.bill;

import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import soon.io.soon.Services.bill.BillService;

@RestController
@RequestMapping("/api/bill")
@AllArgsConstructor
public class BillController {

    private final BillService billService;

    @DeleteMapping("delete/{id}")
    public ResponseEntity<Void> deleteBill(@PathVariable("id") Long id){
        billService.delete(id);
        return ResponseEntity.status(HttpStatus.OK).build();
    }
}
