package vn.iotstar.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import vn.iotstar.entity.Category;
import vn.iotstar.service.CategoryService;
import vn.iotstar.service.impl.CategoryServiceImpl;


@WebServlet(urlPatterns = {"/admin/category","/admin/category/list", "/admin/category/search"})
public class CategoryListController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        String keyword = req.getParameter("keyword");
        List<Category> list;

        if (keyword != null && !keyword.trim().isEmpty()) {
            list = categoryService.searchByName(keyword);
        } else {
            list = categoryService.findAll();
        }

        req.setAttribute("cateList", list);
        req.setAttribute("keyword", keyword);
        req.getRequestDispatcher("/views/admin/list-category.jsp").forward(req, resp);
    }
}