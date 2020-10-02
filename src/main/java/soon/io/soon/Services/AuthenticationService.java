package soon.io.soon.Services;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import soon.io.soon.DTO.authentication.RegisterDTO;
import soon.io.soon.Services.user.UserService;
import soon.io.soon.Utils.Errorhandler.EmailDuplicationException;
import soon.io.soon.Utils.Errorhandler.NumberPhoneDuplicationException;

@Service
@AllArgsConstructor
public class AuthenticationService {

    private final UserService userService;

    /**
     * To Register new User {Owner | Client}
     *
     * @param registerDTO
     * @return
     */
    public RegisterDTO register(RegisterDTO registerDTO) {
        if (checkEmailDuplication(registerDTO)) {
            throw new EmailDuplicationException("error.email.duplication");
        } else if (checkNumberPhoneDuplication(registerDTO)) {
            throw new NumberPhoneDuplicationException("error.number_phone.duplication");
        }
        return null;
    }

    private boolean checkNumberPhoneDuplication(RegisterDTO registerDTO) {
        return userService.checkNumberPhoneDuplication(registerDTO.getNumberPhone());
    }


    private boolean checkEmailDuplication(RegisterDTO registerDTO) {
        return userService.checkEmailDuplication(registerDTO.getEmail());
    }

}
