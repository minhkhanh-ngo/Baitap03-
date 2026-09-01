package vn.iotstar.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import vn.iotstar.entity.User;
import vn.iotstar.service.UserService;
import vn.iotstar.service.impl.UserServiceImpl;
import vn.iotstar.util.EmailUtil;

@WebServlet(urlPatterns = "/forgot-password")
public class ForgotPasswordController extends HttpServlet {
    private UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/forgot-password.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String email = req.getParameter("email");

        User user = userService.getByEmail(email);
        if (user == null) {
            req.setAttribute("alert", "Email này không tồn tại trong hệ thống!");
            req.getRequestDispatcher("/views/forgot-password.jsp").forward(req, resp);
            return;
        }

        String otp = String.format("%06d", new java.util.Random().nextInt(999999));

        userService.updateOtpByEmail(email, otp);

        EmailUtil.sendEmail(email, "Mã khôi phục mật khẩu", "Mã OTP khôi phục mật khẩu của bạn là: " + otp);

        req.getSession().setAttribute("reset_email", email);
        resp.sendRedirect(req.getContextPath() + "/reset-password");
    }
}