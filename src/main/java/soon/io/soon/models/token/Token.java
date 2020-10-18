package soon.io.soon.models.token;

import lombok.*;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Objects;

@Setter
@Getter
@Builder
@ToString
@Entity
@Table(name = "token")
@AllArgsConstructor
@NoArgsConstructor
public class Token {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false)
    private Long id;

    private String value;

    private LocalDateTime expiration;

    private boolean valid;

    private String holder;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Token token = (Token) o;
        return valid == token.valid &&
                Objects.equals(id, token.id) &&
                Objects.equals(value, token.value) &&
                Objects.equals(expiration, token.expiration);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, value, expiration, valid);
    }
}
