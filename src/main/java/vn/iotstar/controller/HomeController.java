package vn.iotstar.controller;

import java.io.IOException;
import java.io.Serial;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iotstar.entity.Category;
import vn.iotstar.entity.Product;
import vn.iotstar.entity.User;
import vn.iotstar.service.CategoryService;
import vn.iotstar.service.ProductService;
import vn.iotstar.service.impl.CategoryServiceImpl;
import vn.iotstar.service.impl.ProductServiceImpl;

@WebServlet(urlPatterns = {"/home", ""})
public class HomeController extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    private ProductService productService = new ProductServiceImpl();
    private CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User account = (session != null) ? (User) session.getAttribute("account") : null;

        if (account == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
        } else {
            if (account.getRoleid() == 1) {
                resp.sendRedirect(req.getContextPath() + "/admin/categories");
            } else {
                List<Product> listNew = productService.findTop10Newest();
                req.setAttribute("listNewProducts", listNew);

                List<Category> listCategories = categoryService.findAll();
                req.setAttribute("listCategories", listCategories);

                req.getRequestDispatcher("/views/home.jsp").forward(req, resp);
            }
        }
    }
}