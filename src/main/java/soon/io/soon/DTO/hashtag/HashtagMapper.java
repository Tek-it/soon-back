package soon.io.soon.DTO.hashtag;

import org.mapstruct.Mapper;
import soon.io.soon.models.hashtag.Hashtag;

@Mapper(componentModel = "spring")
public abstract class HashtagMapper {

    public abstract HashtagDTO hashtagToDTO(Hashtag hashtag);
}
