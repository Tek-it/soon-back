package soon.io.soon.models.hashtag;

import lombok.*;
import soon.io.soon.models.restaurant.Restaurant;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@ToString
@Builder
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "hashtag")
public class Hashtag {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false, updatable = false)
    private Long id;

    private String description;

    @ManyToMany(mappedBy = "hashtags", fetch = FetchType.LAZY)
    private Set<Restaurant> restaurants = new HashSet<>();
}
