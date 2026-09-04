package vn.iotstar.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import vn.iotstar.entity.Category;
import vn.iotstar.entity.Product;
import vn.iotstar.service.CategoryService;
import vn.iotstar.service.ProductService;
import vn.iotstar.service.impl.CategoryServiceImpl;
import vn.iotstar.service.impl.ProductServiceImpl;
import vn.iotstar.util.CloudinaryUtil;
import vn.iotstar.config.CloudinaryConfig;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
@WebServlet(urlPatterns = "/admin/product-add")
public class ProductAddController extends HttpServlet {
    private final ProductService productService = new ProductServiceImpl();
    private final CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        List<Category> categories = categoryService.findAll();
        req.setAttribute("listCategories", categories);

        req.getRequestDispatcher("/views/admin/product-add.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String productName = req.getParameter("productName");
        double price = Double.parseDouble(req.getParameter("price"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));

        String description = req.getParameter("description");
        String imageLink = req.getParameter("imageLink");

        Part filePart = req.getPart("imageFile");
        String imageUrl = "";

        if (filePart != null && filePart.getSize() > 0) {
            imageUrl = CloudinaryUtil.uploadImage(filePart);
        }
        else if (imageLink != null && imageLink.startsWith("http")) {
            try {
                Cloudinary cloudinary = CloudinaryConfig.getCloudinary();
                Map uploadResult = cloudinary.uploader().upload(imageLink, ObjectUtils.emptyMap());
                imageUrl = (String) uploadResult.get("secure_url");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        Product product = new Product();
        product.setProductName(productName);
        product.setPrice(price);
        product.setQuantity(quantity);
        product.setDescription(description);

        product.setImageUrl(imageUrl);

        Category category = new Category();
        category.setCategoryid(categoryId);
        product.setCategory(category);

        productService.insert(product);

        resp.sendRedirect(req.getContextPath() + "/admin/product/list");
    }
}