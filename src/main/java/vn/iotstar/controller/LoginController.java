package vn.iotstar.controller;

import com.example.baitap1.model.User;
import com.example.baitap1.service.UserService;
import com.example.baitap1.service.impl.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        // Khởi tạo Service
        this.userService = new UserServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        // Gọi service kiểm tra thông tin trong SQL Server
        User user = userService.login(username, password);

        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("currentUser", user);
            resp.sendRedirect(req.getContextPath() + "/home");
        } else {
            req.setAttribute("errorMessage", "Tài khoản hoặc mật khẩu không chính xác!");
            req.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(req, resp);
        }
    }
}