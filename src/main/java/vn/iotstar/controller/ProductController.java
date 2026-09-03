package vn.iotstar.controller;

import java.io.IOException;
import java.io.Serial;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.entity.Product;
import vn.iotstar.service.ProductService;
import vn.iotstar.service.impl.ProductServiceImpl;

@WebServlet(urlPatterns = {"/product"})
public class ProductController extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    private ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String indexPage = req.getParameter("page");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);

        int pageSize = 6;
        int totalProducts = productService.countAll();
        int endPage = totalProducts / pageSize;
        if (totalProducts % pageSize != 0) {
            endPage++;
        }
        if (endPage == 0) {
            endPage = 1;
        }

        List<Product> list = productService.findAllPaginated((index - 1) * pageSize, pageSize);

        req.setAttribute("listProducts", list);
        req.setAttribute("endPage", endPage);
        req.setAttribute("tag", index);
        req.getRequestDispatcher("/views/product-list.jsp").forward(req, resp);
    }
}