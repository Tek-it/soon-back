package soon.io.soon.Controllers.authentication;

import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import soon.io.soon.Controllers.profile.ProfileResource;
import soon.io.soon.DTO.user.UserDTO;
import soon.io.soon.Services.AuthenticationService;
import soon.io.soon.models.authentication.ResetPasswordModel;

@RestController
@RequestMapping("/api")
@AllArgsConstructor
public class AuthenticationController {

    private final Logger logger = LoggerFactory.getLogger(ProfileResource.class);
    private final AuthenticationService authenticationService;

    @PostMapping("/register")
    public ResponseEntity<UserDTO> register(@RequestBody UserDTO userDTO) {
        logger.info("RESOURCE::Request to register new user {}", userDTO);
        UserDTO result = authenticationService.register(userDTO);
        return ResponseEntity.ok().body(result);
    }

    @PostMapping("/logout")
    public ResponseEntity logout() {
        logger.debug("RESOURCE::Request to logout user");
        this.authenticationService.logout();
        return ResponseEntity.status(HttpStatus.OK).build();
    }

    @PostMapping("/forgot-password")
    public ResponseEntity forgotPassword(@RequestParam("email") String email) {
        this.authenticationService.forgotPassword(email);
        return ResponseEntity.status(HttpStatus.OK).build();
    }

    @PostMapping("/reset-password")
    public ResponseEntity forgotPassword(@RequestBody ResetPasswordModel model) {
        this.authenticationService.resetPassword(model);
        return ResponseEntity.status(HttpStatus.OK).build();
    }
}
