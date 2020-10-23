package soon.io.soon.models.dish;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;


@Repository
public interface DishRepository extends CrudRepository<Dish, String> {

    List<Dish> findByCategoryId(long id);

    Optional<Dish> findById(long id);
}
