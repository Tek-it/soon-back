package soon.io.soon.Services.smsservice;

import lombok.*;

@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SmsEntity {
    private String to;
    private String from;
    private String body;
}
