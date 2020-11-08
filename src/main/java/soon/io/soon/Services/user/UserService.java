package soon.io.soon.Services.user;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import soon.io.soon.DTO.user.UserDTO;
import soon.io.soon.DTO.user.UserMapper;
import soon.io.soon.Services.roles.RolesService;
import soon.io.soon.Utils.Errorhandler.UserNotFoundException;
import soon.io.soon.models.TicketType;
import soon.io.soon.models.roles.RoleContext;
import soon.io.soon.models.roles.Roles;
import soon.io.soon.models.user.User;
import soon.io.soon.models.user.UserRepository;

import java.util.Collections;
import java.util.Optional;

@AllArgsConstructor
@Service
public class UserService {

    private final UserRepository userRepository;
    private final RolesService rolesService;
    private final UserMapper userMapper;

    public boolean checkNumberPhoneDuplication(String numberPhone) {
        return userRepository.existsByNumberPhone(numberPhone);
    }

    public boolean checkEmailDuplication(String email) {
        return userRepository.existsByEmail(email);
    }

    public Optional<User> findUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public User create(User user) {
        Roles roles = rolesService.create(Roles.builder().roleContext(RoleContext.USER).build());
        user.setRoles(Collections.singleton(roles));
        user.setTicket(TicketType.SIMPLE_USER);
        return userRepository.save(user);
    }

    public UserDTO update(String holder, String password) {
        return userRepository.findByEmail(holder)
                .map(user -> {
                    user.setPassword(password);
                    return user;
                })
                .map(userRepository::save)
                .map(userMapper::toDTO)
                .orElseThrow(() -> new UserNotFoundException("error.user.notfound"));
    }

    public UserDTO findUserById(Long id) {
        return userRepository.findById(id)
                .map(userMapper::toDTO)
                .orElseThrow(() -> new UserNotFoundException("error.user.notfoud"));
    }
}


