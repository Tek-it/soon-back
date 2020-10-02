package soon.io.soon.models.restaurant;


import lombok.*;
import soon.io.soon.models.category.Category;
import soon.io.soon.models.user.Address;

import javax.persistence.*;
import java.util.List;
import java.util.Objects;


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

    @OneToOne
    private Address address;

    @Column(name = "restaurant_phone_number")
    private String numberPhone;

    @Column(name = "restaurant_image_profile")
    private String imageProfile;

    @OneToOne
    @JoinColumn(name = "coordinate_id")
    private Coordinate coordinate;

    @Column(name = "restaurant_availability")
    private boolean available;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "restaurant")
    private List<Category> categories;


    @OneToMany
    private List<RestaurantConfiguration> restaurantConfigurations;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Restaurant that = (Restaurant) o;
        return available == that.available &&
                Objects.equals(id, that.id) &&
                Objects.equals(name, that.name) &&
                Objects.equals(description, that.description) &&
                Objects.equals(address, that.address) &&
                Objects.equals(numberPhone, that.numberPhone) &&
                Objects.equals(imageProfile, that.imageProfile) &&
                Objects.equals(coordinate, that.coordinate) &&
                Objects.equals(categories, that.categories) &&
                Objects.equals(restaurantConfigurations, that.restaurantConfigurations);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, description, address, numberPhone, imageProfile, coordinate, available, categories, restaurantConfigurations);
    }
}
