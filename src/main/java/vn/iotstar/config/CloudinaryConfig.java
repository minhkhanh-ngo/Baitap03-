package vn.iotstar.config;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

public class CloudinaryConfig {
    private static final Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
            "cloud_name", "yc31bvxm",
            "api_key", "421882174339857",
            "api_secret", "j8C8lFhkB-c-WuB7xzPQMUnSHyY",
            "secure", true
    ));

    public static Cloudinary getCloudinary() {
        return cloudinary;
    }
}