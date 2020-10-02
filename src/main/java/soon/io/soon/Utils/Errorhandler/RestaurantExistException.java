package soon.io.soon.Utils.Errorhandler;

public class RestaurantExistException extends RuntimeException {
    public RestaurantExistException(String message) {
        super(message);
    }
}
