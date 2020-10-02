package soon.io.soon.Controllers.authentication;

import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import soon.io.soon.DTO.authentication.LoginDTO;
import soon.io.soon.DTO.authentication.RegisterDTO;
import soon.io.soon.Services.AuthenticationService;

@RestController
@RequestMapping("/api")
@AllArgsConstructor
public class AuthenticationController {

    private final AuthenticationService authenticationService;

    @PostMapping("/register")
    public ResponseEntity<RegisterDTO> register(@RequestBody RegisterDTO registerDTO) {
        RegisterDTO register = authenticationService.register(registerDTO);
        return ResponseEntity.ok().body(register);
    }

}
