package soon.io.soon.Services.user;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import soon.io.soon.models.user.User;
import soon.io.soon.models.user.UserRepository;

import java.util.Optional;

@AllArgsConstructor
@Service
public class UserService {

    private final UserRepository userRepository;


    public boolean checkNumberPhoneDuplication(String numberPhone) {
        return userRepository.existsByNumberPhone(numberPhone);
    }

    public boolean checkEmailDuplication(String email) {
        return userRepository.existsByEmail(email);
    }

    public Optional<User> findUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

}


