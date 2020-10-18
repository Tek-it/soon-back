package soon.io.soon.Services;

import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import soon.io.soon.DTO.user.UserDTO;
import soon.io.soon.DTO.user.UserMapper;
import soon.io.soon.Services.mailservice.MailService;
import soon.io.soon.Services.token.TokenService;
import soon.io.soon.Services.user.UserService;
import soon.io.soon.Utils.Errorhandler.EmailDuplicationException;
import soon.io.soon.Utils.Errorhandler.NumberPhoneDuplicationException;
import soon.io.soon.Utils.Errorhandler.TokenException;
import soon.io.soon.Utils.Errorhandler.UserNotFoundException;
import soon.io.soon.models.authentication.ResetPassword;
import soon.io.soon.models.authentication.ResetPasswordModel;
import soon.io.soon.models.authentication.ResetPasswordRepository;
import soon.io.soon.models.token.Token;
import soon.io.soon.models.token.TokenRepository;
import soon.io.soon.models.user.User;
import soon.io.soon.models.user.UserRepository;

import java.util.Optional;

@Service
@AllArgsConstructor
public class AuthenticationService {
    private final Logger logger = LoggerFactory.getLogger(AuthenticationService.class);
    private final UserService userService;
    private final UserMapper userMapper;
    private final UserRepository userRepository;
    private final TokenService tokenService;
    private final ResetPasswordRepository resetPasswordRepository;
    private final MailService mailService;

    public UserDTO register(UserDTO userDTO) {
        logger.info("SERVICE::Request to register new user {}", userDTO);
        if (checkEmailDuplication(userDTO)) {
            throw new EmailDuplicationException("error.email.duplication");
        }
        if (checkNumberPhoneDuplication(userDTO)) {
            throw new NumberPhoneDuplicationException("error.number_phone.duplication");
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
        logger.info("SERVICE::Request to logout current connected User");
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            SecurityContextHolder.getContext().setAuthentication(null);
        }
    }

    public void forgotPassword(String email) {
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new UserNotFoundException("error.user.notfound"));
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
}
