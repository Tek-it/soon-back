package soon.io.soon.Services.filestorage;

import java.io.InputStream;

public interface FileStorage {

     String upload(String fileName, String path, InputStream file);

     byte[] download(String fileName, String path);

     void delete(String fileName, String path);
}
