package soon.io.soon.models.restaurant;

import lombok.*;
import soon.io.soon.models.category.Category;
import soon.io.soon.models.hashtag.Hashtag;
import soon.io.soon.models.user.Address;
import soon.io.soon.models.user.User;

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
@Table(name = "restaurant")
public class Restaurant {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false)
    private Long id;

    @Column(name = "restaurant_name")
    private String name;

    @Column(name = "restaurant_description")
    private String description;

    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Address address;

    @Column(name = "restaurant_phone_number")
    private String numberPhone;

    @Column(name = "restaurant_image_profile")
    private String imageProfile;

    @OneToOne
    @JoinColumn(name = "coordinate_id")
    private Coordinate coordinate;

    @Column(name = "restaurant_availability")
    private boolean availability;

    @OneToMany(fetch = FetchType.LAZY)
    private Set<RestaurantConfiguration> restaurantConfigurations = new HashSet<>();

    @OneToOne
    @JoinColumn(name = "owner_id")
    private User owner;

    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.PERSIST)
    @JoinTable(name = "restaurants_hashtags",
            joinColumns = {
                    @JoinColumn(name = "restaurant_id", referencedColumnName = "id",
                            nullable = false, updatable = false)},
            inverseJoinColumns = {
                    @JoinColumn(name = "hashtag_id", referencedColumnName = "id",
                            nullable = false, updatable = false)})
    private Set<Hashtag> hashtags = new HashSet<>();

}
