package soon.io.soon.models.restaurant;


import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;


@Repository
public interface RestaurantRepository extends CrudRepository<Restaurant, String> {

    Optional<Restaurant> findByOwnerId(long userId);

    Optional<Restaurant> findById(Long id);

    List<Restaurant> findRestaurantsByHashtagsId(Long hashtagId);

    @Query( value = " SELECT\n" +
            "  *, ( \n" +
            "    3959 * acos (\n" +
            "      cos ( radians(:latitude) )\n" +
            "      * cos( radians( coordinate.latitude ) )\n" +
            "      * cos( radians( coordinate.longitude ) - radians(:longitude) )\n" +
            "      + sin ( radians(:latitude) )\n" +
            "      * sin( radians( coordinate.latitude ) )\n" +
            "    )\n" +
            "  ) AS distance\n" +
            "FROM restaurant , coordinate where coordinate.id = restaurant.coordinate_id\n" +
            "HAVING distance < :distance\n" +
            "ORDER BY distance\n" , nativeQuery = true)
    List<Restaurant> findRestaurantAround(@Param("latitude") double latitude, @Param("longitude") double longitude, @Param("distance") double distance, Pageable pageable);
}
