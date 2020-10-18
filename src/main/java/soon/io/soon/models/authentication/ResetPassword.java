package soon.io.soon.models.authentication;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import soon.io.soon.models.token.Token;
import soon.io.soon.models.user.User;

import javax.persistence.*;

@Setter
@Getter
@ToString
@Builder
@Entity
@Table(name = "reset_password")
public class ResetPassword {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false)
    private Long id;

    @ManyToOne()
    @JoinColumn(name = "fk_user_id")
    private User user;

    @ManyToOne()
    @JoinColumn(name = "fk_token_id")
    private Token token;

}
