package soon.io.soon.Services.external.geoLocation;

import org.springframework.stereotype.Service;
import soon.io.soon.models.restaurant.Coordinate;
import soon.io.soon.models.user.Address;

@Service
public class GeoLocationResolver {

    public Address getAddress(Coordinate coordinate) {
        // TODO: 15/11/2020 this is a dummy address just for testing
        return Address.builder()
                .houseNumber(7)
                .rue("rue pierre curie")
                .city("Aubervillier")
                .zipCode(93300L)
                .build();
    }
}
