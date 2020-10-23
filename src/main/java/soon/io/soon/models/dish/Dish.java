package soon.io.soon.models.dish;

import lombok.*;

import soon.io.soon.models.category.Category;
import soon.io.soon.models.order.Order;
import soon.io.soon.models.orderDetails.OrderDetails;
import soon.io.soon.models.rating.Rating;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Set;


@ToString
@Builder
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "dish")
public class Dish {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false)
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "base_price")
    private double basePrice;

    @Column(name = "preparation_time")
    private int preparationTime;

    @OneToMany(mappedBy = "dish", fetch = FetchType.LAZY)
    @ElementCollection(targetClass = Rating.class)
    private Set<Rating> rating;

    @ManyToOne(fetch = FetchType.LAZY)
    private Category category;

    @Column(name = "avg_delivery")
    private int avgDelivery;

    @Column(name = "dish_images")
    @ElementCollection(targetClass = String.class)
    private Set<String> dishImages;

    @Column(name = "create_at")
    private LocalDateTime createAt;

    @Column(name = "available")
    private boolean available;

    @OneToMany(mappedBy = "dish")
    @ElementCollection(targetClass = OrderDetails.class)
    private Set<OrderDetails> orderDetails;

}
