package soon.io.soon.models.orderDetails;


import lombok.*;
import soon.io.soon.models.dish.Dish;
import soon.io.soon.models.order.Order;

import javax.persistence.*;


@ToString
@Builder
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "order_details")
public class OrderDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false, updatable = false)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "order_id_fk", referencedColumnName = "id")
    private Order order;

    @ManyToOne
    @JoinColumn(name = "dish_id_fk", referencedColumnName = "id")
    private Dish dish;

    @Column(name = "quantity")
    private double quantity;

    @Column(name = "price")
    private double price;

}
