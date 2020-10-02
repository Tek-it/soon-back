package soon.io.soon.models.bill;


import lombok.*;
import soon.io.soon.models.order.Order;

import javax.persistence.*;
import java.time.LocalDateTime;


@ToString
@Builder
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "billing")
public class Billing {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false, updatable = false)
    private Long id;

    @OneToOne
    private Order order;

    private double total;

    private double tax;


    private LocalDateTime currentTime;


}
