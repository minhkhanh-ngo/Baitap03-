package vn.iotstar.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import vn.iotstar.entity.User;
import vn.iotstar.service.UserService;
import vn.iotstar.service.impl.UserServiceImpl;

@WebServlet(urlPatterns = "/reset-password")
public class ResetPasswordController extends HttpServlet {
    private UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String inputOtp = req.getParameter("otp");
        String newPassword = req.getParameter("newPassword");

        HttpSession session = req.getSession(false);
        String email = (session != null) ? (String) session.getAttribute("reset_email") : null;

        if (email == null) {
            resp.sendRedirect(req.getContextPath() + "/forgot-password");
            return;
        }

        User user = userService.getByEmail(email);
        if (user != null && user.getOtp() != null && user.getOtp().trim().equals(inputOtp.trim())) {
            userService.resetPasswordByEmail(email, newPassword);
            session.removeAttribute("reset_email");
            resp.sendRedirect(req.getContextPath() + "/login?success=reset");
        } else {
            req.setAttribute("alert", "Mã OTP không chính xác hoặc đã hết hạn!");
            req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
        }
    }
}