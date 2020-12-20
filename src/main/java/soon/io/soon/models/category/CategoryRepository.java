package soon.io.soon.models.category;

import org.jetbrains.annotations.NotNull;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CategoryRepository extends CrudRepository<Category, String> {

    void deleteById(Long id);

    Optional<Category> findById(Long id);

    @NotNull List<Category> findAll();
}
