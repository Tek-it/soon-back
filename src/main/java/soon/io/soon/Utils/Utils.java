package soon.io.soon.Utils;

import org.springframework.web.multipart.MultipartFile;
import soon.io.soon.Services.filestorage.FileStorage;
import soon.io.soon.Utils.Errorhandler.FileStorageException;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

public class Utils {

    public static String createReference(String prefix) {
        return prefix + Timestamp.valueOf(LocalDateTime.now());
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
