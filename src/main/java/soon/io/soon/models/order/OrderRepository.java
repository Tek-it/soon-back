package soon.io.soon.models.order;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Repository
public interface OrderRepository extends CrudRepository<Order, Long> {

    List<Order> findByRestaurantId(Long id);

    Optional<List<Order>> findByCreateAtBetweenAndRestaurantIdOrderByCreateAt(LocalDateTime firstDayOfWeek, LocalDateTime today, Long id);
}
