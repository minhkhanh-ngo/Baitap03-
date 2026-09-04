package vn.iotstar.controller;

import java.io.IOException;
import java.io.Serial;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.entity.Category;
import vn.iotstar.entity.Product;
import vn.iotstar.service.CategoryService;
import vn.iotstar.service.ProductService;
import vn.iotstar.service.impl.CategoryServiceImpl;
import vn.iotstar.service.impl.ProductServiceImpl;

@WebServlet(urlPatterns = {"/product"})
public class ProductController extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    private ProductService productService = new ProductServiceImpl();
    private CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyword = req.getParameter("keyword");
        String categoryIdStr = req.getParameter("categoryId");
        String sort = req.getParameter("sort");
        String indexPage = req.getParameter("page");

        if (indexPage == null || indexPage.isEmpty()) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);

        Integer categoryId = null;
        if (categoryIdStr != null && !categoryIdStr.isEmpty()) {
            try {
                categoryId = Integer.parseInt(categoryIdStr);
            } catch (NumberFormatException e) {
            }
        }

        int pageSize = 6;

        int totalProducts = productService.countSearchFilter(keyword, categoryId);

        int endPage = totalProducts / pageSize;
        if (totalProducts % pageSize != 0) {
            endPage++;
        }
        if (endPage == 0) {
            endPage = 1;
        }

        List<Product> list = productService.searchFilterAndSort(keyword, categoryId, sort, index, pageSize);

        List<Category> listCategories = categoryService.findAll();

        req.setAttribute("listProducts", list);
        req.setAttribute("listCategories", listCategories);
        req.setAttribute("endPage", endPage);
        req.setAttribute("tag", index);

        req.setAttribute("keyword", keyword != null ? keyword : "");
        req.setAttribute("categoryId", categoryId);
        req.setAttribute("sort", sort);

        req.getRequestDispatcher("/views/product-list.jsp").forward(req, resp);
    }
}