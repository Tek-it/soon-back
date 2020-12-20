package soon.io.soon.DTO.catergory;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import soon.io.soon.models.category.Category;
import soon.io.soon.models.dish.Dish;

import java.util.Collections;
import java.util.Set;
import java.util.stream.Collectors;

@Mapper(componentModel = "spring")
public abstract class CategoryMapper {

    @Mapping(target = "dishes", ignore = true)
    public abstract Category toModel(CategoryDTO categoryDTO);

    @Mapping(target = "dishes", expression = "java(getDishes(category))")
    public abstract CategoryDTO toDTO(Category category);

    public Set<Long> getDishes(Category category) {
        if (category.getDishes() == null)
            return Collections.emptySet();
        return category.getDishes().stream()
                .map(Dish::getId)
                .collect(Collectors.toSet());
    }

}
