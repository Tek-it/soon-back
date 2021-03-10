package soon.io.soon.models.restaurant;


import org.springframework.data.domain.Page;
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

    Page<Restaurant> findRestaurantsByNameContaining(String name, Pageable page);



   /* @Query( value = " SELECT\n" +
            " *, st_distance_sphere(POINT( :latitude, :longitude) , POINT(coordinate.latitude, coordinate.longitude )) AS distance\n" +
            "FROM restaurant , coordinate where coordinate.id = restaurant.coordinate_id\n" +
            "HAVING distance < :distance\n" +
            "ORDER BY distance\n" , nativeQuery = true)*/

    @Query( value = " SELECT\n" +
            " *, st_distance(POINT( :latitude, :longitude) , POINT(coordinate.latitude, coordinate.longitude )) AS distance\n" +
            "FROM restaurant , coordinate where coordinate.id = restaurant.coordinate_id\n" +
            "HAVING distance < :distance\n" +
            "ORDER BY distance\n" , nativeQuery = true)
    List<Restaurant> findRestaurantAround(@Param("latitude") double latitude, @Param("longitude") double longitude, @Param("distance") double distance, Pageable pageable);
}
