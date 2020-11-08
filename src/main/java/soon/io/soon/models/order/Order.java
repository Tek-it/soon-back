package soon.io.soon.models.order;

import lombok.*;
import soon.io.soon.models.bill.Billing;
import soon.io.soon.models.orderDetails.OrderDetails;
import soon.io.soon.models.orderStatus.OrderState;
import soon.io.soon.models.restaurant.Restaurant;
import soon.io.soon.models.user.User;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Set;

@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "orders")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false, updatable = false)
    private Long id;

    @JoinColumn(name = "create_at")
    private LocalDateTime createAt;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "restaurant_id", nullable = false)
    private Restaurant restaurant;

    @OneToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "order_state")
    private OrderState orderState;

    @OneToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "bill_id")
    private Billing bill;

    @OneToMany(mappedBy = "order", fetch = FetchType.EAGER)
    private Set<OrderDetails> orderDetails;

}
