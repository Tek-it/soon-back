package soon.io.soon.models.user;

import lombok.*;
import soon.io.soon.models.TicketType;
import soon.io.soon.models.restaurant.Restaurant;
import soon.io.soon.models.roles.Roles;

import javax.persistence.*;
import java.util.Objects;
import java.util.Set;

@ToString
@Builder
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false, name = "id", unique = true)
    private Long id;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "number_phone")
    private String numberPhone;

    @Column(name = "age")
    private int age;

    @Column(name = "email")
    private String email;

    @Column(name = "password")
    private String password;

    @Column(name = "user_avatar")
    private String profilePicture;

    @OneToOne(cascade = CascadeType.ALL)
    private Address address;

    @ManyToMany(fetch = FetchType.EAGER, targetEntity = Roles.class)
    @JoinTable(name = "user_roles",
            joinColumns = @JoinColumn(name = "user_id_fk"),
            inverseJoinColumns = @JoinColumn(name = "role_id_key"))
    private Set<Roles> roles;

    @Enumerated(EnumType.STRING)
    private TicketType ticket;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return age == user.age &&
                Objects.equals(id, user.id) &&
                Objects.equals(firstName, user.firstName) &&
                Objects.equals(lastName, user.lastName) &&
                Objects.equals(numberPhone, user.numberPhone) &&
                Objects.equals(email, user.email) &&
                Objects.equals(password, user.password) &&
                Objects.equals(profilePicture, user.profilePicture) &&
                Objects.equals(address, user.address) &&
                Objects.equals(roles, user.roles);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, firstName, lastName, numberPhone, age, email, password, profilePicture, address, roles);
    }
}
