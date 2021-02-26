package soon.io.soon.Controllers.hashtag;

import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import soon.io.soon.DTO.hashtag.HashtagDTO;
import soon.io.soon.DTO.restaurant.RestaurantDTO;
import soon.io.soon.Services.hashtag.HashtagService;
import soon.io.soon.models.hashtag.Hashtag;

import java.util.Set;

@RestController
@RequestMapping("/api")
@AllArgsConstructor
public class HashtagController {

    private final HashtagService hashtagService;

    @GetMapping("/hashtags")
    public ResponseEntity<Set<HashtagDTO>> getHashtags() {
        Set<HashtagDTO> hashtagSet = hashtagService.getHashtags();
        return ResponseEntity.status(HttpStatus.OK).body(hashtagSet);
    }

    @GetMapping("/restaurant/hashtags")
    public ResponseEntity<Set<HashtagDTO>> getRestaurantHashtags() {
        Set<HashtagDTO> hashtagSet = hashtagService.getRestaurantHashtag();
        return ResponseEntity.status(HttpStatus.OK).body(hashtagSet);
    }
}
