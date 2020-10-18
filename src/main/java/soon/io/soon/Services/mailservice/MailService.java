package soon.io.soon.Services.mailservice;

import com.sendgrid.*;
import org.springframework.stereotype.Service;

import java.io.IOException;

@Service
public class MailService {

    // TODO: 12/10/2020 You need to refactor this code and externalize the secret KEY
    public void send(String receiver, String subject, String body) {
        Email from = new Email("tekit.manager@gmail.com");
        Email to = new Email(receiver);
        Content content = new Content("text/plain", body);
        Mail mail = new Mail(from, subject, to, content);
        SendGrid sg = new SendGrid("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");
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
        }
    }

}
