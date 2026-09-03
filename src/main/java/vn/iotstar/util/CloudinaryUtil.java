package vn.iotstar.util;

import com.cloudinary.utils.ObjectUtils;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.util.Map;
import vn.iotstar.config.CloudinaryConfig;

public class CloudinaryUtil {

    public static String uploadImage(Part filePart) {
        if (filePart == null || filePart.getSize() == 0) {
            return null;
        }
        try {
            byte[] fileBytes = filePart.getInputStream().readAllBytes();
            Map uploadResult = CloudinaryConfig.getCloudinary().uploader().upload(fileBytes, ObjectUtils.emptyMap());
            return uploadResult.get("secure_url").toString();
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}