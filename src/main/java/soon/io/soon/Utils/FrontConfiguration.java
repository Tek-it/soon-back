package soon.io.soon.Utils;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;


@ConfigurationProperties("app")
@Configuration
@Getter
@Setter
@Component
public class FrontConfiguration {

    private int port;
    private String token;

}
