package soon.io.soon.DTO.dish;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import soon.io.soon.models.dish.Dish;

@Mapper(componentModel = "spring")
public abstract class DishMapper {

    @Mapping(target = "category.id", source = "categoryId")
    public abstract Dish toModel(DishDTO dishDTO);

    @Mapping(target = "categoryId", source = "category.id")
    public abstract DishDTO toDTO(Dish dish);
}
