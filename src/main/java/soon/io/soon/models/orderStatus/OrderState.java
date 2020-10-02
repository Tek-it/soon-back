package soon.io.soon.models.orderStatus;

import lombok.*;
import soon.io.soon.models.order.Order;

import javax.persistence.*;


@ToString
@Builder
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "order_state")
public class OrderState {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false, updatable = false)
    private Long id;
    private boolean newOrder = false;
    private boolean accepted = false;
    private boolean rejected = false;
    private boolean delivered = false;
    private boolean processing = false;

    @OneToOne(fetch = FetchType.LAZY)
    private Order order;

}
