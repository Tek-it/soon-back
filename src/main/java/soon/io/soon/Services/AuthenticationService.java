package soon.io.soon.Services;

import lombok.AllArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import soon.io.soon.DTO.authentication.RegisterNbrDTO;
import soon.io.soon.DTO.user.UserDTO;
import soon.io.soon.DTO.user.UserMapper;
import soon.io.soon.Services.mailservice.MailService;
import soon.io.soon.Services.smsservice.SmsEntity;
import soon.io.soon.Services.smsservice.SmsService;
import soon.io.soon.Services.token.TokenService;
import soon.io.soon.Services.user.UserService;
import soon.io.soon.Utils.Errorhandler.EmailException;
import soon.io.soon.Utils.Errorhandler.NumberPhoneException;
import soon.io.soon.Utils.Errorhandler.TokenException;
import soon.io.soon.Utils.Errorhandler.UserException;
import soon.io.soon.models.authentication.ResetPassword;
import soon.io.soon.models.authentication.ResetPasswordModel;
import soon.io.soon.models.authentication.ResetPasswordRepository;
import soon.io.soon.models.restaurant.ConfigurationType;
import soon.io.soon.models.restaurant.RestaurantConfiguration;
import soon.io.soon.models.restaurant.RestaurantConfigurationRepository;
import soon.io.soon.models.token.Token;
import soon.io.soon.models.user.User;
import soon.io.soon.models.user.UserRepository;

import java.util.Optional;
import java.util.Random;

@Service
@AllArgsConstructor
public class AuthenticationService {
    private final UserService userService;
    private final UserMapper userMapper;
    private final UserRepository userRepository;
    private final TokenService tokenService;
    private final ResetPasswordRepository resetPasswordRepository;
    private final MailService mailService;
    private final SmsService smsService;
    private final RestaurantConfigurationRepository restaurantConfigurationRepository;

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

    public void registerWithNumberPhone(RegisterNbrDTO registerNbrDTO) {

        if (registerNbrDTO.getStep().equalsIgnoreCase("STEP_1")) {
            if (userService.checkNumberPhoneDuplication(registerNbrDTO.getNumberPhone())) {
                throw new NumberPhoneException("error.number-phone.duplication");
            }
            // todo this is the simple solution i need to apply another solution

            // TODO: 23/02/2021 change the exception to another type
            RestaurantConfiguration restaurantConfigurationToken = restaurantConfigurationRepository.findByAttribute(ConfigurationType.TWILIO_AUTH_TOKEN.name())
                    .orElseThrow(() -> new RuntimeException("error.configuration.sms.not_configured"));
            RestaurantConfiguration restaurantConfigurationSid = restaurantConfigurationRepository.findByAttribute(ConfigurationType.TWILIO_ACCOUNT_SID.name())
                    .orElseThrow(() -> new RuntimeException("error.configuration.sms.not_configured"));
            RestaurantConfiguration restaurantConfigurationSmsBody = restaurantConfigurationRepository.findByAttribute(ConfigurationType.SMS_BODY.name())
                    .orElseThrow(() -> new RuntimeException("error.configuration.sms.not_configured"));
            RestaurantConfiguration restaurantConfigurationPhoneNumber = restaurantConfigurationRepository.findByAttribute(ConfigurationType.TWILIO_NUMBER_PHONE.name())
                    .orElseThrow(() -> new RuntimeException("error.configuration.sms.not_configured"));

            Random rnd = new Random();
            int SmsCode = 1000 + rnd.nextInt(9000);

            // save the code into the data base
            // todo don't forget the resend sms code method
            User savedUser = userRepository.save(User.builder()
                    .code(String.valueOf(SmsCode))
                    .numberPhone(registerNbrDTO.getNumberPhone())
                    .build());

            // todo tyr catch in case of problem you need to delete the row
            smsService.sendSMS(SmsEntity.builder()
                    .to("+" + registerNbrDTO.getNumberPhone().trim())
                    .from(restaurantConfigurationPhoneNumber.getValue())
                    .body(restaurantConfigurationSmsBody.getValue() + SmsCode)
                    .build(), restaurantConfigurationToken.getValue(), restaurantConfigurationSid.getValue());
        }


        if (registerNbrDTO.getStep().equalsIgnoreCase("STEP_2")) {
            userRepository.findByNumberPhone(registerNbrDTO.getNumberPhone())
                    .map(user -> {
                        if (!registerNbrDTO.getCode().equals(user.getCode())) {
                            throw new RuntimeException("error.code.not-correct");
                        }
                        return user;
                    }).orElseThrow(() -> new UserException("error.user.notfound"));
        }

        if (registerNbrDTO.getStep().equalsIgnoreCase("STEP_3")) {
            userRepository.findByNumberPhone(registerNbrDTO.getUserDTO().getNumberPhone())
                    .map(user -> {
                        registerNbrDTO.getUserDTO().setId(user.getId());
                        return userMapper.toModel(registerNbrDTO.getUserDTO());
                    })
                    .map(userRepository::save)
                    .map(userMapper::toDTO)
                    .orElseThrow(() -> new UserException("error.user.notfound"));
        }

    }
}
