package soon.io.soon.models.order;

import lombok.*;
import soon.io.soon.models.bill.Billing;
import soon.io.soon.models.client.Client;
import soon.io.soon.models.dish.Dish;
import soon.io.soon.models.orderDetails.OrderDetails;
import soon.io.soon.models.orderStatus.OrderState;
import soon.io.soon.models.orderStatus.OrderStatus;
import soon.io.soon.models.restaurant.Restaurant;
import soon.io.soon.models.user.User;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.Set;


@ToString
@Builder
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "order")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false, updatable = false)
    private Long id;

    private LocalDateTime createAt;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "restaurant_id", nullable = false)
    private Restaurant restaurant;

    @OneToOne(cascade = CascadeType.ALL)
    private OrderState orderState;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "bill_id")
    private Billing bill;

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL)
    @ElementCollection(targetClass = OrderDetails.class)
    private Set<OrderDetails> orderDetails;


}
