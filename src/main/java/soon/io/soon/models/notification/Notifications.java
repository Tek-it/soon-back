package soon.io.soon.models.notification;

import lombok.*;
import soon.io.soon.models.restaurant.Restaurant;

import javax.persistence.*;
import java.time.LocalDateTime;

@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "notifications")
public class Notifications {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false, updatable = false)
    private Long id;
    private String title;
    private String body;
    private LocalDateTime createAt;
    private String status;
    @Enumerated(EnumType.STRING)
    private NotificationTypes notificationType;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "restaurant_id")
    private Restaurant restaurant;
}
