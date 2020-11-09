package soon.io.soon.Controllers.user;

import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import soon.io.soon.DTO.user.UserDTO;
import soon.io.soon.Services.user.UserService;

@RestController
@RequestMapping("/api/user")
@AllArgsConstructor
public class UserController {

    private final UserService userService;

    @GetMapping("/{id}")
    public ResponseEntity<UserDTO> findUser(@PathVariable("id") Long id) {
        UserDTO result = userService.findUserById(id);
        return ResponseEntity.status(HttpStatus.OK).body(result);
    }
}
