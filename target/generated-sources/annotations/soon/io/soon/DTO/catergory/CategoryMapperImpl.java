package soon.io.soon.DTO.catergory;

import javax.annotation.Generated;
import org.springframework.stereotype.Component;
import soon.io.soon.models.category.Category;
import soon.io.soon.models.restaurant.Restaurant;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2020-10-19T00:03:21+0200",
    comments = "version: 1.3.0.Final, compiler: javac, environment: Java 11.0.8 (JetBrains s.r.o.)"
)
@Component
public class CategoryMapperImpl extends CategoryMapper {

    @Override
    public Category toModel(CategoryDTO categoryDTO) {
        if ( categoryDTO == null ) {
            return null;
        }

        Category category = new Category();

        category.setRestaurant( categoryDTOToRestaurant( categoryDTO ) );
        category.setId( categoryDTO.getId() );
        category.setName( categoryDTO.getName() );
        category.setDescription( categoryDTO.getDescription() );
        category.setImage( categoryDTO.getImage() );

        return category;
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
        categoryDTO.setDescription( category.getDescription() );
        categoryDTO.setImage( category.getImage() );

        categoryDTO.setDishes( getDishes(category) );

        return categoryDTO;
    }

    protected Restaurant categoryDTOToRestaurant(CategoryDTO categoryDTO) {
        if ( categoryDTO == null ) {
            return null;
        }

        Restaurant restaurant = new Restaurant();

        restaurant.setId( categoryDTO.getRestaurant() );

        return restaurant;
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
