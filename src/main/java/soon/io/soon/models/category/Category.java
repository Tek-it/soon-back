package soon.io.soon.models.category;

import lombok.*;
import soon.io.soon.models.dish.Dish;
import soon.io.soon.models.restaurant.Restaurant;

import javax.persistence.*;
import java.util.List;
import java.util.Objects;
import java.util.Set;

@ToString
@Builder
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "category")
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false, updatable = false)
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "image")
    private String image;

    @OneToMany(mappedBy = "category")
    @ElementCollection(targetClass = Dish.class)
    private Set<Dish> dishes;

    @ManyToOne
    @JoinColumn(name = "restaurant_id")
    private Restaurant restaurant;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Category category = (Category) o;
        return Objects.equals(id, category.id) &&
                Objects.equals(name, category.name) &&
                Objects.equals(image, category.image) &&
                Objects.equals(dishes, category.dishes);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, image, dishes);
    }
}
