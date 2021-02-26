package soon.io.soon.Services.hashtag;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import soon.io.soon.DTO.hashtag.HashtagDTO;
import soon.io.soon.DTO.hashtag.HashtagMapper;
import soon.io.soon.Services.profile.ProfileService;
import soon.io.soon.Utils.Errorhandler.DishException;
import soon.io.soon.models.hashtag.Hashtag;
import soon.io.soon.models.hashtag.HashtagRepository;

import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;


@Service
@AllArgsConstructor
public class HashtagService {

    private final HashtagRepository hashtagRepository;
    private final HashtagMapper hashtagMapper;
    private final ProfileService profileService;

    public Set<HashtagDTO> getHashtags() {
        return hashtagRepository.findAll()
                .stream()
                .map(hashtagMapper::hashtagToDTO)
                .collect(Collectors.toSet());
    }

    public Set<HashtagDTO> getRestaurantHashtag() {
        Long restaurantId = profileService.getCurrentConnectedRestaurant().getId();
        return hashtagRepository.
                findByRestaurantsId(restaurantId).
                stream().
                map(hashtagMapper::hashtagToDTO).
                collect(Collectors.toSet());
    }

    public Hashtag getHashtagById(long id) {
        return hashtagRepository.findById(id)
                .orElseThrow(() -> new DishException("error.hashtag.notfound"));
    }



}
