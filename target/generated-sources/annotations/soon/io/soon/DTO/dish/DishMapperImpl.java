package soon.io.soon.DTO.dish;

import javax.annotation.processing.Generated;
import org.springframework.stereotype.Component;
import soon.io.soon.models.category.Category;
import soon.io.soon.models.dish.Dish;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2020-11-08T18:31:14+0100",
    comments = "version: 1.3.0.Final, compiler: javac, environment: Java 15 (Oracle Corporation)"
)
@Component
public class DishMapperImpl extends DishMapper {

    @Override
    public Dish toModel(DishDTO dishDTO) {
        if ( dishDTO == null ) {
            return null;
        }

        Dish dish = new Dish();

        dish.setCategory( dishDTOToCategory( dishDTO ) );
        dish.setId( dishDTO.getId() );
        dish.setName( dishDTO.getName() );
        dish.setDescription( dishDTO.getDescription() );
        dish.setBasePrice( dishDTO.getBasePrice() );
        dish.setPreparationTime( dishDTO.getPreparationTime() );
        dish.setAvatar( dishDTO.getAvatar() );
        dish.setAvailable( dishDTO.isAvailable() );

        return dish;
    }

    @Override
    public DishDTO toDTO(Dish dish) {
        if ( dish == null ) {
            return null;
        }

        DishDTO dishDTO = new DishDTO();

        dishDTO.setCategoryId( dishCategoryId( dish ) );
        if ( dish.getId() != null ) {
            dishDTO.setId( dish.getId() );
        }
        dishDTO.setName( dish.getName() );
        dishDTO.setDescription( dish.getDescription() );
        dishDTO.setBasePrice( dish.getBasePrice() );
        dishDTO.setPreparationTime( dish.getPreparationTime() );
        dishDTO.setAvailable( dish.isAvailable() );
        dishDTO.setAvatar( dish.getAvatar() );

        return dishDTO;
    }

    protected Category dishDTOToCategory(DishDTO dishDTO) {
        if ( dishDTO == null ) {
            return null;
        }

        Category category = new Category();

        category.setId( dishDTO.getCategoryId() );

        return category;
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
