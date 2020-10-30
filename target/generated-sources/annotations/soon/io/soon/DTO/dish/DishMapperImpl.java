package soon.io.soon.DTO.dish;

import java.util.HashSet;
import java.util.Set;
import javax.annotation.Generated;
import org.springframework.stereotype.Component;
import soon.io.soon.DTO.dish.DishDTO.DishDTOBuilder;
import soon.io.soon.models.category.Category;
import soon.io.soon.models.category.Category.CategoryBuilder;
import soon.io.soon.models.dish.Dish;
import soon.io.soon.models.dish.Dish.DishBuilder;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2020-10-26T18:37:50+0100",
    comments = "version: 1.3.0.Final, compiler: javac, environment: Java 11.0.8 (JetBrains s.r.o.)"
)
@Component
public class DishMapperImpl extends DishMapper {

    @Override
    public Dish toModel(DishDTO dishDTO) {
        if ( dishDTO == null ) {
            return null;
        }

        DishBuilder dish = Dish.builder();

        dish.category( dishDTOToCategory( dishDTO ) );
        dish.id( dishDTO.getId() );
        dish.name( dishDTO.getName() );
        dish.description( dishDTO.getDescription() );
        dish.basePrice( dishDTO.getBasePrice() );
        dish.preparationTime( dishDTO.getPreparationTime() );
        Set<String> set = dishDTO.getDishImages();
        if ( set != null ) {
            dish.dishImages( new HashSet<String>( set ) );
        }
        dish.avatar( dishDTO.getAvatar() );
        dish.available( dishDTO.isAvailable() );

        return dish.build();
    }

    @Override
    public DishDTO toDTO(Dish dish) {
        if ( dish == null ) {
            return null;
        }

        DishDTOBuilder dishDTO = DishDTO.builder();

        dishDTO.categoryId( dishCategoryId( dish ) );
        if ( dish.getId() != null ) {
            dishDTO.id( dish.getId() );
        }
        dishDTO.name( dish.getName() );
        dishDTO.description( dish.getDescription() );
        dishDTO.basePrice( dish.getBasePrice() );
        dishDTO.preparationTime( dish.getPreparationTime() );
        Set<String> set = dish.getDishImages();
        if ( set != null ) {
            dishDTO.dishImages( new HashSet<String>( set ) );
        }
        dishDTO.available( dish.isAvailable() );
        dishDTO.avatar( dish.getAvatar() );

        return dishDTO.build();
    }

    protected Category dishDTOToCategory(DishDTO dishDTO) {
        if ( dishDTO == null ) {
            return null;
        }

        CategoryBuilder category = Category.builder();

        category.id( dishDTO.getCategoryId() );

        return category.build();
    }

    private Long dishCategoryId(Dish dish) {
        if ( dish == null ) {
            return null;
        }
        Category category = dish.getCategory();
        if ( category == null ) {
            return null;
        }
        Long id = category.getId();
        if ( id == null ) {
            return null;
        }
        return id;
    }
}
