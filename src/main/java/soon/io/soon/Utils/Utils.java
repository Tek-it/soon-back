package soon.io.soon.Utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.web.multipart.MultipartFile;
import soon.io.soon.Services.filestorage.FileStorage;
import soon.io.soon.Utils.Errorhandler.FileStorageException;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

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

    public static String createReference(String prefix){
        return prefix+Timestamp.valueOf(LocalDateTime.now());
    }

    public static void saveFile(MultipartFile image, FileStorage fileStorage) {
        try {
            fileStorage.upload(image.getOriginalFilename(), "soon-files", image.getInputStream());
        } catch (IOException e) {
            e.printStackTrace();
            throw new FileStorageException("error.file.upload");
        }

    }
}
