package soon.io.soon.models.dish;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface DishRepository extends CrudRepository<Dish, String> {

}
