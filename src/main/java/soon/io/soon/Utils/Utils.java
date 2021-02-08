package soon.io.soon.Utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class Utils {
    public static final String ID_WILAYA = "id_wilaya";
    public static final String ID_COMMOM = "id_common";
    public static final String ID_INFECTION = "id_infection";


    public static String ObjetToJSON(Object object) {
        ObjectMapper mapper = new ObjectMapper();
        String response = "";
        try {
            response = mapper.writeValueAsString(object);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return response;
    }
}
