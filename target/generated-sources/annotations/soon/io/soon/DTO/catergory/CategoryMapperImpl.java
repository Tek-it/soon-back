package soon.io.soon.DTO.catergory;

import javax.annotation.Generated;
import org.springframework.stereotype.Component;
import soon.io.soon.models.category.Category;
import soon.io.soon.models.category.Category.CategoryBuilder;
import soon.io.soon.models.restaurant.Restaurant;
import soon.io.soon.models.restaurant.Restaurant.RestaurantBuilder;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2020-10-15T22:57:04+0200",
    comments = "version: 1.3.0.Final, compiler: javac, environment: Java 11.0.8 (JetBrains s.r.o.)"
)
@Component
public class CategoryMapperImpl extends CategoryMapper {

    @Override
    public Category toModel(CategoryDTO categoryDTO) {
        if ( categoryDTO == null ) {
            return null;
        }

        CategoryBuilder category = Category.builder();

        category.restaurant( categoryDTOToRestaurant( categoryDTO ) );
        category.id( categoryDTO.getId() );
        category.name( categoryDTO.getName() );
        category.image( categoryDTO.getImage() );

        return category.build();
    }

    @Override
    public CategoryDTO toDTO(Category category) {
        if ( category == null ) {
            return null;
        }

        CategoryDTO categoryDTO = new CategoryDTO();

        categoryDTO.setRestaurant( categoryRestaurantId( category ) );
        categoryDTO.setId( category.getId() );
        categoryDTO.setName( category.getName() );
        categoryDTO.setImage( category.getImage() );

        categoryDTO.setDishes( getDishes(category) );

        return categoryDTO;
    }

    protected Restaurant categoryDTOToRestaurant(CategoryDTO categoryDTO) {
        if ( categoryDTO == null ) {
            return null;
        }

        RestaurantBuilder restaurant = Restaurant.builder();

        restaurant.id( categoryDTO.getRestaurant() );

        return restaurant.build();
    }

    private Long categoryRestaurantId(Category category) {
        if ( category == null ) {
            return null;
        }
        Restaurant restaurant = category.getRestaurant();
        if ( restaurant == null ) {
            return null;
        }
        Long id = restaurant.getId();
        if ( id == null ) {
            return null;
        }
        return id;
    }
}
