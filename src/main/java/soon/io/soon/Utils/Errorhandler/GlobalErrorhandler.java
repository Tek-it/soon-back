package soon.io.soon.Utils.Errorhandler;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalErrorhandler {


    // TODO: 3/17/20 catch all the Error here and invoke Handlers

    @ExceptionHandler(value = { RestaurantExistException.class })
    protected ResponseEntity<Object> handlerRestaurantExistException(RestaurantExistException e) {
       return error(HttpStatus.BAD_REQUEST,e);
    }



    /**
     * A Generic method to return a custom Error Response
     *
     * @param status
     * @param e
     * @return
     */
    private ResponseEntity error(HttpStatus status, Exception e) {
        ErrorBuilder response = ErrorBuilder.builder()
                .error(e.getMessage())
                .status(status.value())
                .build();
        return ResponseEntity.status(status).body(response);
    }


}


