package soon.io.soon.Utils.Errorhandler;

public class OrderNotFoundException extends RuntimeException {
    public OrderNotFoundException(String s) {
        super(s);
    }

}
