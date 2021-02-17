package soon.io.soon.Services;

import lombok.AllArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import soon.io.soon.DTO.user.UserDTO;
import soon.io.soon.DTO.user.UserMapper;
import soon.io.soon.Services.mailservice.MailService;
import soon.io.soon.Services.token.TokenService;
import soon.io.soon.Services.user.UserService;
import soon.io.soon.Utils.Errorhandler.EmailException;
import soon.io.soon.Utils.Errorhandler.NumberPhoneException;
import soon.io.soon.Utils.Errorhandler.TokenException;
import soon.io.soon.Utils.Errorhandler.UserException;
import soon.io.soon.models.authentication.ResetPassword;
import soon.io.soon.models.authentication.ResetPasswordModel;
import soon.io.soon.models.authentication.ResetPasswordRepository;
import soon.io.soon.models.token.Token;
import soon.io.soon.models.user.User;
import soon.io.soon.models.user.UserRepository;

import java.util.Optional;

@Service
@AllArgsConstructor
public class AuthenticationService {
    private final UserService userService;
    private final UserMapper userMapper;
    private final UserRepository userRepository;
    private final TokenService tokenService;
    private final ResetPasswordRepository resetPasswordRepository;
    private final MailService mailService;

    public UserDTO register(UserDTO userDTO) {
        if (checkEmailDuplication(userDTO)) {
            throw new EmailException("error.email.duplication");
        }
        if (checkNumberPhoneDuplication(userDTO)) {
            throw new NumberPhoneException("error.number_phone.duplication");
        }
        return Optional.of(userDTO)
                .map(userMapper::toModel)
                .map(userService::create)
                .map(userMapper::toDTO)
                .orElse(null);
    }

    private boolean checkNumberPhoneDuplication(UserDTO userDTO) {
        return userService.checkNumberPhoneDuplication(userDTO.getNumberPhone());
    }

    private boolean checkEmailDuplication(UserDTO userDTO) {
        return userService.checkEmailDuplication(userDTO.getEmail());
    }

    public void logout() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            SecurityContextHolder.getContext().setAuthentication(null);
        }
    }

    public void forgotPassword(String email) {
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new UserException("error.user.notfound"));
        Token token = tokenService.create(email);
        ResetPassword build = ResetPassword.builder()
                .user(user)
                .token(token)
                .build();
        resetPasswordRepository.save(build);
        mailService.send(user.getEmail(),
                "Reset Password",
                "http://localhost:4200/reset-password?token=" + token.getValue());
    }

    public UserDTO resetPassword(ResetPasswordModel model) {
        boolean valid = tokenService.isValid(model.getToken());
        if (valid) {
            Token token = tokenService.find(model.getToken());
            String holder = token.getHolder();
            return userService.update(holder, model.getPassword());
        } else {
            throw new TokenException("error.token.not-valid");
        }
    }

    public void registerWithNumberPhone(String numberPhone) {
        // check if the number existe
        if (userService.checkNumberPhoneDuplication(numberPhone)) {
            throw new NumberPhoneException("error.number-phone.duplication");
        }
        // first is to sent an sms to this person
        // save the sms code with number phone in DB
    }

    public void registerWithNumberPhoneStep2(String numberPhone, String code) {
        // verify the code if the same from DB using the numberPhone
        // if same code return true else false
    }

    public void registerWithNumberPhoneStep3(UserDTO userDTO) {
        // update the user and return it
    }

}
