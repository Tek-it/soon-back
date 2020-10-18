package soon.io.soon.Services.roles;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import soon.io.soon.models.roles.Roles;
import soon.io.soon.models.roles.RolesRepository;

@Service
@AllArgsConstructor
public class RolesService {

    private final RolesRepository rolesRepository;

    public Roles create(Roles roles) {
        return rolesRepository.save(roles);
    }
}
