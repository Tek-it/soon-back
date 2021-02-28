package soon.io.soon.models.restaurant;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;


@Repository
public interface RestaurantRepository extends CrudRepository<Restaurant, String> {

    Optional<Restaurant> findByOwnerId(long userId);

    Optional<Restaurant> findById(Long id);

    List<Restaurant> findRestaurantsByHashtagsId(Long hashtagId);
}
