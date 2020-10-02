package soon.io.soon.models.user;

import lombok.*;

import javax.persistence.*;
import java.util.Objects;

@ToString
@Builder
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "address")
public class Address {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false, name = "id", unique = true)
    private Long id;

    @Column(name = "house_number")
    private int houseNumber;

    @Column(name = "rue")
    private String rue;

    @Column(name = "city")
    private String city;

    @Column(name = "zip_code")
    private Long zipCode;


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Address address = (Address) o;
        return houseNumber == address.houseNumber &&
                Objects.equals(id, address.id) &&
                Objects.equals(rue, address.rue) &&
                Objects.equals(city, address.city) &&
                Objects.equals(zipCode, address.zipCode);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, houseNumber, rue, city, zipCode);
    }
}

