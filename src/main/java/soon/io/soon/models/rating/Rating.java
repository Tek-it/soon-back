package soon.io.soon.models.rating;

import lombok.*;
import soon.io.soon.models.dish.Dish;

import javax.persistence.*;
import java.util.Objects;

@ToString
@Builder
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "dish")
public class Rating {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false, updatable = false)
    private Long id;

    @Column(name = "value")
    private int value;

    @ManyToOne(fetch = FetchType.LAZY)
    private Dish dish;


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Rating rating = (Rating) o;
        return value == rating.value &&
                Objects.equals(id, rating.id) &&
                Objects.equals(dish, rating.dish);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, value, dish);
    }
}
