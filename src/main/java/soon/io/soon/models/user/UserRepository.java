package soon.io.soon.models.user;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends CrudRepository<User, String> {

    Optional<User> findByNumberPhone(String numberPhone);

    Optional<User> findByEmail(String email);

    boolean existsByNumberPhone(String numberPhone);

    boolean existsByEmail(String email);

    Optional<User> findById(Long id);

}
