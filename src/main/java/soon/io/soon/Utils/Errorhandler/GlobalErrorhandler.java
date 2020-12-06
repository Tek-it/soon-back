package soon.io.soon.Utils.Errorhandler;

import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import static org.springframework.http.HttpStatus.BAD_REQUEST;

@ControllerAdvice
@Order(Ordered.HIGHEST_PRECEDENCE)
public class GlobalErrorhandler extends ResponseEntityExceptionHandler {


    @ExceptionHandler(value = {RestaurantExistException.class})
    protected ResponseEntity<Object> handlerRestaurantExistException(RestaurantExistException e) {
        return error(e);
    }

    @ExceptionHandler(value = {TokenException.class})
    public ResponseEntity<Object> handleInvalidInputException(TokenException ex) {
        return error(ex);
    }

    private ResponseEntity<Object> error(Exception e) {
        ErrorBuilder response = ErrorBuilder.builder()
                .error(e.getMessage())
                .status(BAD_REQUEST.value())
                .build();
        return ResponseEntity.status(BAD_REQUEST).body(response);
    }
}
