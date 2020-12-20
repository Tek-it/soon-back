package soon.io.soon.DTO.catergory;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import java.util.Set;

@Getter
@Setter
public class CategoryDTO {
    private Long id;
    @NotBlank(message = "error.name.required")
    private String name;
    private String description;
    private String image;
    private Set<Long> dishes;
}
