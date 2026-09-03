package vn.iotstar.controller.admin;

import java.io.File;
import java.io.IOException;
import java.io.Serial;
import java.nio.charset.StandardCharsets;
import java.nio.file.Paths;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload2.core.DiskFileItem;
import org.apache.commons.fileupload2.jakarta.JakartaServletFileUpload;

import vn.iotstar.entity.Category;
import vn.iotstar.service.CategoryService;
import vn.iotstar.service.impl.CategoryServiceImpl;
import vn.iotstar.util.Constant;

@WebServlet(urlPatterns = { "/admin/category/edit", "/admin/category/update" })
public class CategoryEditController extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    public CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        if (id != null) {
            Category category = categoryService.findById(Integer.parseInt(id));
            req.setAttribute("category", category);
        }
        req.getRequestDispatcher("/views/admin/edit-category.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Category category = new Category();
        String oldImages = "";

        if (JakartaServletFileUpload.isMultipartContent(req)) {
            JakartaServletFileUpload<DiskFileItem, ? extends org.apache.commons.fileupload2.core.FileItemFactory<DiskFileItem>> upload =
                    new JakartaServletFileUpload<>(new org.apache.commons.fileupload2.core.DiskFileItemFactory.Builder().get());
            try {
                List<DiskFileItem> items = upload.parseRequest(req);
                for (DiskFileItem item : items) {
                    if (item.isFormField()) {
                        String fieldName = item.getFieldName();
                        String fieldValue = item.getString(StandardCharsets.UTF_8);
                        switch (fieldName) {
                            case "categoryid" -> {
                                if (fieldValue != null && !fieldValue.isEmpty()) {
                                    category.setCategoryid(Integer.parseInt(fieldValue));
                                }
                            }
                            case "cateName" -> category.setCateName(fieldValue);
                            case "status" -> {
                                if (fieldValue != null && !fieldValue.isEmpty()) {
                                    category.setStatus(Integer.parseInt(fieldValue));
                                } else {
                                    category.setStatus(1);
                                }
                            }
                            case "oldImages" -> oldImages = fieldValue;
                            default -> {}
                        }
                    } else {
                        if (item.getSize() > 0) {
                            String originalFileName = Paths.get(item.getName()).getFileName().toString();
                            int index = originalFileName.lastIndexOf(".");
                            String ext = originalFileName.substring(index + 1);
                            String fileName = System.currentTimeMillis() + "." + ext;

                            File uploadDir = new File(Constant.DIR);
                            if (!uploadDir.exists()) {
                                boolean dirCreated = uploadDir.mkdir();
                                if (!dirCreated) {
                                    System.out.println("Không thể tạo thư mục upload!");
                                }
                            }

                            File file = new File(Constant.DIR + File.separator + fileName);
                            item.write(file.toPath());
                            category.setImages(fileName);
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        if (category.getImages() == null || category.getImages().isEmpty()) {
            category.setImages(oldImages);
        }

        categoryService.update(category);
        resp.sendRedirect(req.getContextPath() + "/admin/category/list");
    }
}