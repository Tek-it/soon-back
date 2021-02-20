package soon.io.soon.DTO.bill;

import lombok.*;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class BillDTO {

    private Long id;
    private double total;
    private double tax;
}
