package soon.io.soon.models.restaurant;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface RestaurantConfigurationRepository extends CrudRepository<RestaurantConfiguration, Long> {

    Optional<RestaurantConfiguration> findByAttributeAndRestaurantId(String attribute, Long id);

    boolean existsByAttributeAndRestaurantId(String attribute, Long id);

    List<RestaurantConfiguration> findAllByRestaurantId(Long restaurantId);
}
