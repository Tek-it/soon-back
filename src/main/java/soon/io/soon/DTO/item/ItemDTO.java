package soon.io.soon.DTO.item;

import lombok.*;

@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ItemDTO {
    private int id;
    private Long dish;
    private Long quantity;
}
