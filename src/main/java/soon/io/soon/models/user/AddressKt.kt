package soon.io.soon.models.user

import javax.persistence.*

@Entity
@Table(name = "address")
data class AddressKt(
        @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
        val id: Long = 0,
        val houseNumber: Int = 0,
        val rue: String = "",
        val city: String = "",
        val zipCode: Long = 0
)
