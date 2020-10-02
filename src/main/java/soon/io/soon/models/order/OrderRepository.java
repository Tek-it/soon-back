package soon.io.soon.models.order;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import soon.io.soon.models.orderStatus.OrderStatus;

import java.util.Optional;

@Repository
public interface OrderRepository extends CrudRepository<Order, String> {

}
