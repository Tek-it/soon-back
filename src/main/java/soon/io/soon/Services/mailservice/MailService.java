package soon.io.soon.Services.mailservice;

import com.sendgrid.*;
import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import soon.io.soon.models.restaurant.ConfigurationType;
import soon.io.soon.models.restaurant.RestaurantConfiguration;
import soon.io.soon.models.restaurant.RestaurantConfigurationRepository;

import java.io.IOException;

@Service
@AllArgsConstructor
public class MailService {
    private final Logger logger = LoggerFactory.getLogger(MailService.class);
    private final RestaurantConfigurationRepository restaurantConfigurationRepository;

    public void send(String receiver, String subject, String body) {
        String token = getEmailToken().getValue();
        String fromEmail = getFromEmail().getValue();
        String domainName = getDomainName().getValue().concat("/reset-password?token=");
        logger.debug("SERVICE::REQUEST TO SEND MAIL FROM {}, to {}", fromEmail, receiver);
        Email from = new Email(fromEmail);
        Email to = new Email(receiver);
        Content content = new Content("text/plain", domainName + body);
        Mail mail = new Mail(from, subject, to, content);
        SendGrid sg = new SendGrid(token);
        Request request = new Request();
        request.setMethod(Method.POST);
        request.setEndpoint("mail/send");
        try {
            request.setBody(mail.build());
            Response response = sg.api(request);
            System.out.println(response.getStatusCode());
            System.out.println(response.getBody());
            System.out.println(response.getHeaders());
        } catch (IOException e) {
            e.printStackTrace();
            // throw exception if any problem happen
        }
    }

    private RestaurantConfiguration getFromEmail() {
        return restaurantConfigurationRepository.findByAttribute(ConfigurationType.FROM_EMAIL.name())
                .orElseThrow(() -> new RuntimeException("error.configuration.from.email.notfound"));
    }

    private RestaurantConfiguration getEmailToken() {
        return restaurantConfigurationRepository.findByAttribute(ConfigurationType.TOKEN_EMAIL.name())
                .orElseThrow(() -> new RuntimeException("error.configuration.email.token.notfound"));
    }

    private RestaurantConfiguration getDomainName() {
        return restaurantConfigurationRepository.findByAttribute(ConfigurationType.DOMAIN_NAME.name())
                .orElseThrow(() -> new RuntimeException("error.configuration.domain.name.notfound"));
    }

}
