package soon.io.soon.models.hashtag;
import org.springframework.data.repository.CrudRepository;

import java.util.Set;

public interface HashtagRepository extends CrudRepository<Hashtag, Long> {
    Set<Hashtag> findByRestaurantsId(Long id);

    Set<Hashtag> findAll();

}
