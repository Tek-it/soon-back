package soon.io.soon.Services.filestorage;

import com.dropbox.core.DbxException;
import com.dropbox.core.DbxRequestConfig;
import com.dropbox.core.v2.DbxClientV2;
import com.dropbox.core.v2.files.FileMetadata;
import com.dropbox.core.v2.files.ListFolderResult;
import com.dropbox.core.v2.files.Metadata;
import lombok.AllArgsConstructor;
import org.apache.commons.io.IOUtils;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Service;
import soon.io.soon.DTO.restaurant.RestaurantDTO;
import soon.io.soon.DTO.restaurant.RestaurantMapper;
import soon.io.soon.Utils.Errorhandler.UserException;
import soon.io.soon.models.TicketType;
import soon.io.soon.models.restaurant.ConfigurationType;
import soon.io.soon.models.restaurant.RestaurantConfiguration;
import soon.io.soon.models.restaurant.RestaurantConfigurationRepository;
import soon.io.soon.models.restaurant.RestaurantRepository;
import soon.io.soon.models.user.User;
import soon.io.soon.security.SecurityUtils;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashSet;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
@Profile({"prod"})
public class DropBoxStorage implements FileStorage {

    private final RestaurantConfigurationRepository restaurantConfigurationRepository;
    private final SecurityUtils securityUtils;
    private final RestaurantRepository restaurantRepository;
    private final RestaurantMapper restaurantMapper;

    private void setupDropBox() {
        DbxClientV2 instance = getInstance();
        String path = getPath();
        try {
            if (!listFolders().contains("/" + path)) {
                instance.files().createFolderV2("/" + path);
            }
        } catch (DbxException e) {
            System.out.println(e.getMessage());
            throw new RuntimeException("error.dropbox.creation.folder");
        }
    }

    private Set<String> listFolders() throws DbxException {
        DbxClientV2 instance = getInstance();
        Set<String> listFolders = new HashSet<>();
        ListFolderResult result = instance.files().listFolder("");
        while (true) {
            listFolders.addAll(
                    result.getEntries()
                            .stream()
                            .map(Metadata::getPathLower)
                            .collect(Collectors.toSet()));
            if (!result.getHasMore()) {
                break;
            }
            result = instance.files().listFolderContinue(result.getCursor());
        }
        return listFolders;
    }

    private DbxClientV2 getInstance() {
        //todo check this again next time don't forgot the exception to fix it
        RestaurantConfiguration ACCESS_TOKEN = restaurantConfigurationRepository
                .findByAttributeAndRestaurantId(ConfigurationType.DROPBOX_TOKEN.name(), getCurrentConnectedRestaurant().getId())
                .orElseThrow(() -> new RuntimeException("error.dropbox.token.notfound"));
        DbxRequestConfig config = DbxRequestConfig.newBuilder("dropbox/java-tutorial").build();
        return new DbxClientV2(config, ACCESS_TOKEN.getValue());
    }

    @Override
    public String upload(String fileName, String path, InputStream file) {
        // init
        setupDropBox();
        try {
            DbxClientV2 instance = getInstance();
            String folderPath = getPath();
            FileMetadata metadata = instance.files().uploadBuilder("/" + folderPath + "/" + fileName)
                    .uploadAndFinish(file);
        } catch (IOException | DbxException e) {
            e.printStackTrace();
        }
        return fileName;
    }

    @Override
    public byte[] download(String fileName, String path) {
        try {
            String folderPath = getPath();
            DbxClientV2 instance = getInstance();
            InputStream inputStream = instance.files().download("/" + folderPath.concat("/").concat(fileName)).getInputStream();
            return IOUtils.toByteArray(inputStream);
        } catch (DbxException | IOException e) {
            e.printStackTrace();
        }
        return new byte[0];
    }

    @Override
    public void delete(String fileName, String path) {
    }

    private String getPath() {
        return restaurantConfigurationRepository
                .findByAttributeAndRestaurantId(ConfigurationType.ROOT_FOLDER_NAME.name(), getCurrentConnectedRestaurant().getId())
                .orElseThrow(() -> new RuntimeException("error.storage.root_folder_name")).getValue();
    }


    public RestaurantDTO getCurrentConnectedRestaurant() {
        User currentConnectedUser = securityUtils.getCurrentConnectedUser();
        Optional.ofNullable(currentConnectedUser)
                .filter(user -> user.getTicket() == TicketType.RESTAURANT)
                .orElseThrow(() -> new UserException("user.not_connected"));
        return restaurantRepository.findByOwnerId(currentConnectedUser.getId())
                .map(restaurantMapper::restaurantToDTO)
                .orElseThrow(() -> new UserException("error.user.notfound"));
    }
}
