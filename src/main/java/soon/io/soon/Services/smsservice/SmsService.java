package soon.io.soon.Services.smsservice;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;
import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;


@AllArgsConstructor
@Service
public class SmsService implements SmsProvider {
    private final SmsConfiguration configuration;
    private final Logger logger = LoggerFactory.getLogger(SmsService.class);

    @Override
    public void sendSMS(SmsEntity smsEntity, String token, String accountSid) {
        Twilio.init(accountSid, token);
        Message message = Message.creator(
                new PhoneNumber(smsEntity.getTo()),
                new PhoneNumber(smsEntity.getFrom()),
                smsEntity.getBody()).create();
        logger.debug("SERVICE::SMS REQUEST TO SEND SMS {}", message.getBody());
    }
}
