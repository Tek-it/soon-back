package soon.io.soon.Services.smsservice;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Getter
@Setter
@Configuration
@ConfigurationProperties(prefix = "twilio")
@NoArgsConstructor
public class SmsConfiguration {
    private String accountSid;
    private String authToken;
}
