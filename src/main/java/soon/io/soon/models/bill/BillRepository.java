package soon.io.soon.models.bill;

import org.springframework.data.repository.CrudRepository;
import soon.io.soon.models.order.Order;

import java.util.List;

public interface BillRepository extends CrudRepository<Bill, Long> {
    List<Bill> findByRestaurantId(Long id);
}
