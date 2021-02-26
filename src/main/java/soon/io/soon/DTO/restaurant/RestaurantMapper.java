package soon.io.soon.DTO.restaurant;

import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import soon.io.soon.DTO.user.UserMapper;
import soon.io.soon.Services.hashtag.HashtagService;
import soon.io.soon.Utils.Errorhandler.RestaurantException;
import soon.io.soon.models.hashtag.Hashtag;
import soon.io.soon.models.restaurant.Restaurant;

import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

@Mapper(componentModel = "spring", injectionStrategy = InjectionStrategy.CONSTRUCTOR, uses = {UserMapper.class})
public abstract class RestaurantMapper {

    @Autowired
    @Lazy
    private HashtagService hashtagService;

    @Mapping(target = "hashtags", expression = "java(findHashtags(restaurantDTO.getHashtagsIds()))")
    public abstract Restaurant RestaurantDTOToRestaurant(RestaurantDTO restaurantDTO);

    @Mapping(target = "hashtagsIds", expression = "java(findHashtagsIds(restaurant.getHashtags()))")
    public abstract RestaurantDTO restaurantToDTO(Restaurant restaurant);


    public Set<Hashtag> findHashtags(Set<Long> hashtags) {
        Set<Hashtag> result = new HashSet<>();
        hashtags.forEach(value ->result.add(hashtagService.getHashtagById(value)));
        return result;
    }

    public Set<Long> findHashtagsIds(Set<Hashtag> hashtags) {
        Set<Long> result = new HashSet<>();
        hashtags.forEach(value ->result.add(value.getId()));
        return result;
    }
}
