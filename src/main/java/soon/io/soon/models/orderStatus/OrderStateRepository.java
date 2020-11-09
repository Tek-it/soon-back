package soon.io.soon.models.orderStatus;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderStateRepository extends CrudRepository<OrderState, Long> {
}
