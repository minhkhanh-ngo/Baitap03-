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

@WebServlet(urlPatterns = "/verify")
public class VerifyController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/verify.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String inputOtp = req.getParameter("otp");
        if (inputOtp != null) {
            inputOtp = inputOtp.trim();
        }

        HttpSession session = req.getSession(false);
        String username = (session != null) ? (String) session.getAttribute("verify_username") : null;

        if (username == null) {
            resp.sendRedirect(req.getContextPath() + "/register");
            return;
        }

        User user = userService.get(username);

        System.out.println("--- DEBUG OTP ---");
        System.out.println("Username đang xét: " + username);
        System.out.println("Mã user nhập vào: [" + inputOtp + "]");
        System.out.println("Mã trong Database: [" + (user != null ? user.getOtp() : "User null") + "]");

        if (user != null && user.getOtp() != null && user.getOtp().equals(inputOtp)) {
            userService.activateUser(username);
            session.removeAttribute("verify_username");
            resp.sendRedirect(req.getContextPath() + "/login?success=activated");
        } else {
            req.setAttribute("alert", "Mã OTP không chính xác!");
            req.getRequestDispatcher("/views/verify.jsp").forward(req, resp);
        }
    }
}