package soon.io.soon.Utils;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ResponseBuilder<T> {
    private int status;
    private T response;
}
