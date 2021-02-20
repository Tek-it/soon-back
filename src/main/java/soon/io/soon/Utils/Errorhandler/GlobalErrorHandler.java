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
public class GlobalErrorHandler extends ResponseEntityExceptionHandler {
    private final Logger logger = LoggerFactory.getLogger(JWTAuthorizationFilter.class);

    @ExceptionHandler({ApplicationException.class})
    public ResponseEntity<Object> handleGlobalException(ApplicationException e) {
        Map<String, String> errorBuilder = new ErrorBuilder().addError(e.getMessage());
        logger.error("Error happened: {}", e.getMessage());
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorBuilder);
    }

    @ExceptionHandler({UserException.class})
    public ResponseEntity<Object> handleUserException(UserException e) {
        Map<String, String> errorBuilder = new ErrorBuilder().addError(e.getMessage());
        logger.error("Error happened: {}", e.getMessage());
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorBuilder);
    }

    @ExceptionHandler({CustomException.class})
    public ResponseEntity<Object> handleBadCredentials(CustomException e) {
        Map<String, String> errorBuilder = new ErrorBuilder().addError(e.getMessage());
        logger.error("Error happened: {}", e.getMessage());
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorBuilder);
    }

    @ExceptionHandler({EmailException.class})
    public ResponseEntity<Object> handleBadCredentials(EmailException e) {
        Map<String, String> errorBuilder = new ErrorBuilder().addError(e.getMessage());
        logger.error("Error happened: {}", e.getMessage());
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(errorBuilder);
    }

    @ExceptionHandler({CategoryExeption.class})
    public ResponseEntity<Object> handleCategoryException(CategoryExeption e) {
        Map<String, String> errorBuilder = new ErrorBuilder().addError(e.getMessage());
        logger.error("Error happened: {}", e.getMessage());
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(errorBuilder);
    }

    @ExceptionHandler({DishException.class})
    public ResponseEntity<Object> handleDishException(DishException e) {
        Map<String, String> errorBuilder = new ErrorBuilder().addError(e.getMessage());
        logger.error("Error happened: {}", e.getMessage());
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(errorBuilder);
    }

    @ExceptionHandler({FileStorageException.class})
    public ResponseEntity<Object> handleFileStorageException(FileStorageException e) {
        Map<String, String> errorBuilder = new ErrorBuilder().addError(e.getMessage());
        logger.error("Error happened: {}", e.getMessage());
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(errorBuilder);
    }

    @ExceptionHandler({MenuException.class})
    public ResponseEntity<Object> handleMenuException(MenuException e) {
        Map<String, String> errorBuilder = new ErrorBuilder().addError(e.getMessage());
        logger.error("Error happened: {}", e.getMessage());
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(errorBuilder);
    }

    @ExceptionHandler({NumberPhoneException.class})
    public ResponseEntity<Object> handleNumberPhoneException(NumberPhoneException e) {
        Map<String, String> errorBuilder = new ErrorBuilder().addError(e.getMessage());
        logger.error("Error happened: {}", e.getMessage());
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(errorBuilder);
    }

    @ExceptionHandler({OrderException.class})
    public ResponseEntity<Object> handleOrderException(OrderException e) {
        Map<String, String> errorBuilder = new ErrorBuilder().addError(e.getMessage());
        logger.error("Error happened: {}", e.getMessage());
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(errorBuilder);
    }

    @ExceptionHandler({RestaurantException.class})
    public ResponseEntity<Object> handleRestaurantException(RestaurantException e) {
        Map<String, String> errorBuilder = new ErrorBuilder().addError(e.getMessage());
        logger.error("Error happened: {}", e.getMessage());
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(errorBuilder);
    }

    @ExceptionHandler({TokenException.class})
    public ResponseEntity<Object> handleTokenException(TokenException e) {
        Map<String, String> errorBuilder = new ErrorBuilder().addError(e.getMessage());
        logger.error("Error happened: {}", e.getMessage());
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(errorBuilder);
    }


    @ExceptionHandler({BillException.class})
    public ResponseEntity<Object> handleBillException(BillException e) {
        Map<String, String> errorBuilder = new ErrorBuilder().addError(e.getMessage());
        logger.error("Error happened: {}", e.getMessage());
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(errorBuilder);
    }




}
