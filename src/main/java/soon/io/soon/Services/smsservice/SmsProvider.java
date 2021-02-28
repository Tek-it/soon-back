package soon.io.soon.Services.smsservice;

public interface SmsProvider {
    public void sendSMS(SmsEntity smsEntity, String token, String accountSid);
}
