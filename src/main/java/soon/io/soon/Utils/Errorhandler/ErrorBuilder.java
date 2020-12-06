package soon.io.soon.Utils.Errorhandler;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ErrorBuilder {
    private String timestamp;
    private int status;
    private String error;
}

