package soon.io.soon.DTO.catergory;

import lombok.Getter;
import lombok.Setter;

import java.util.Set;

@Getter
@Setter
public class CategoryDTO {
    private Long id;
    private String name;
    private String description;
    private String image;
    private Long restaurant;
    private Set<Long> dishes;
}
