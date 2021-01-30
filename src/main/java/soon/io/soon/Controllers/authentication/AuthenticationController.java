package soon.io.soon.Controllers.authentication;

import com.sendgrid.Response;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import soon.io.soon.DTO.user.UserDTO;
import soon.io.soon.Services.AuthenticationService;
import soon.io.soon.models.authentication.ResetPasswordModel;

@RestController
@RequestMapping("/api")
@AllArgsConstructor
public class AuthenticationController {

    private final AuthenticationService authenticationService;

    @PostMapping("/register")
    public ResponseEntity<UserDTO> register(@RequestBody UserDTO userDTO) {
        UserDTO result = authenticationService.register(userDTO);
        return ResponseEntity.ok().body(result);
    }

    @PostMapping("/register-with-number-phone")
    public ResponseEntity<Void> registerWithNumberPhone(@RequestParam("number-phone") String numberPhone) {
        this.authenticationService.registerWithNumberPhone(numberPhone);
        return ResponseEntity.status(HttpStatus.OK).build();
    }

    @PostMapping("/logout")
    public ResponseEntity<Void> logout() {
        this.authenticationService.logout();
        return ResponseEntity.status(HttpStatus.OK).build();
    }

    @PostMapping("/forgot-password")
    public ResponseEntity<Void> forgotPassword(@RequestParam("email") String email) {
        this.authenticationService.forgotPassword(email);
        return ResponseEntity.status(HttpStatus.OK).build();
    }

    @PostMapping("/reset-password")
    public ResponseEntity<Void> forgotPassword(@RequestBody ResetPasswordModel model) {
        this.authenticationService.resetPassword(model);
        return ResponseEntity.status(HttpStatus.OK).build();
    }
}
