package soon.io.soon.Utils.Errorhandler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;
import soon.io.soon.security.JWTAuthorizationFilter;

import java.util.Map;

@RestControllerAdvice
public class GlobalErrorhandler extends ResponseEntityExceptionHandler {
    private final Logger logger = LoggerFactory.getLogger(JWTAuthorizationFilter.class);

    @ExceptionHandler({ApplicationException.class})
    public ResponseEntity<Object> handleGlobalException(ApplicationException e) {
        Map<String, String> errorBuilder = new ErrorBuilder().addError(e.getMessage());
        logger.error("Error happened: {}", e.getMessage());
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorBuilder);
    }

    @ExceptionHandler({UserNotFoundException.class})
    public ResponseEntity<Object> handleUserNotFound(UserNotFoundException e) {
        Map<String, String> errorBuilder = new ErrorBuilder().addError(e.getMessage());
        logger.error("Error happened: {}", e.getMessage());
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorBuilder);
    }

    @ExceptionHandler({CustomBadCredentialsException.class})
    public ResponseEntity<Object> handleBadCredentials(CustomBadCredentialsException e) {
        Map<String, String> errorBuilder = new ErrorBuilder().addError(e.getMessage());
        logger.error("Error happened: {}", e.getMessage());
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorBuilder);
    }

    @ExceptionHandler({EmailDuplicationException.class})
    public ResponseEntity<Object> handleBadCredentials(EmailDuplicationException e) {
        Map<String, String> errorBuilder = new ErrorBuilder().addError(e.getMessage());
        logger.error("Error happened: {}", e.getMessage());
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(errorBuilder);
    }
}
