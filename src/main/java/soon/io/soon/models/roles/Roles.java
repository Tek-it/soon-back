package soon.io.soon.models.roles;


import lombok.*;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@ToString
@Builder
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "roles")
public class Roles {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false)
    private Long id;

    @Column(name = "role_context")
    @Enumerated(EnumType.STRING)
    private RoleContext roleContext;

    @OneToMany(mappedBy = "role")
    @ElementCollection(targetClass = Authorization.class)
    private Collection<Authorization> authorizations;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Roles roles = (Roles) o;
        return Objects.equals(id, roles.id) &&
                roleContext == roles.roleContext &&
                Objects.equals(authorizations, roles.authorizations);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, roleContext, authorizations);
    }
}
