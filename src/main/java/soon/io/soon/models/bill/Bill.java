package soon.io.soon.models.bill;


import lombok.*;
import soon.io.soon.models.order.Order;
import soon.io.soon.models.restaurant.Restaurant;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.UUID;


@ToString
@Builder
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "bill")
public class Bill {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false, updatable = false)
    private Long id;

    @JoinColumn(name = "bill_reference")
    private String billReference;

    private double total;

    private double tax;

    @JoinColumn(name = "created_at")
    private LocalDateTime createdAt;

    @OneToOne
    @JoinColumn(name = "order_id")
    private Order order;

    @ManyToOne
    @JoinColumn(name = "restaurant_id", nullable = false)
    private Restaurant restaurant;
}
