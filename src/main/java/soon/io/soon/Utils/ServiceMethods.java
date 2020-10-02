package soon.io.soon.Utils;

import java.util.List;
import java.util.Optional;

public interface ServiceMethods<T> {

    public T findOne(String id);

    public List<T> findAll();

    public Optional<T> save(T model);

    public T update(String id, T t);
}
