package soon.io.soon.models.authentication;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ResetPasswordRepository extends CrudRepository<ResetPassword, Long> {
}
