package soon.io.soon.Utils.Errorhandler;

import lombok.Builder;
import lombok.Data;

import java.util.HashMap;
import java.util.Map;

@Data
@Builder
public class ErrorBuilder {

    private final Map<String, String> map = new HashMap<>();
    private final String ERROR = "error";

    public Map<String, String> addError(String s) {
        map.put(ERROR, s);
        return map;
    }
}

