package soon.io.soon.models.order;

import lombok.*;
import soon.io.soon.models.bill.Billing;
import soon.io.soon.models.client.Client;
import soon.io.soon.models.dish.Dish;
import soon.io.soon.models.orderDetails.OrderDetails;
import soon.io.soon.models.orderStatus.OrderState;
import soon.io.soon.models.orderStatus.OrderStatus;
import soon.io.soon.models.restaurant.Restaurant;

import javax.persistence.*;
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

    @Temporal(TemporalType.TIMESTAMP)
    private Date timestamp;

    @OneToOne()
    private Client client;

    @OneToOne()
    private Restaurant restaurant;

    @OneToOne()
    private OrderState orderState;

    @OneToOne()
    private Billing billing;

    @OneToMany(mappedBy = "order")
    @ElementCollection(targetClass = OrderDetails.class)
    private Set<OrderDetails> orderDetails;


}
