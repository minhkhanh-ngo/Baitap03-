<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng ký tài khoản</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f7f6; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .register-container { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); width: 350px; }
        .register-container h2 { text-align: center; margin-bottom: 20px; color: #333; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; color: #666; font-size: 14px; }
        .form-group input { width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        .btn { width: 100%; padding: 10px; background: #28a745; border: none; color: white; border-radius: 4px; font-size: 16px; cursor: pointer; }
        .btn:hover { background: #218838; }
        .error { color: #dc3545; font-size: 14px; margin-bottom: 15px; text-align: center; }
        .login-link { text-align: center; margin-top: 15px; font-size: 14px; }
        .login-link a { color: #007bff; text-decoration: none; }
        .login-link a:hover { text-decoration: underline; }
    </style>
</head>
<body>
<div class="register-container">
    <h2>Đăng Ký Tài Khoản</h2>

    <c:if test="${not empty alert}">
        <div class="error">${alert}</div>
    </c:if>

    <form action="register" method="post">
        <div class="form-group">
            <label>Tài khoản (Username)</label>
            <input type="text" name="username" required>
        </div>
        <div class="form-group">
            <label>Mật khẩu (Password)</label>
            <input type="password" name="password" required>
        </div>
        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" required>
        </div>
        <div class="form-group">
            <label>Họ và tên</label>
            <input type="text" name="fullname" required>
        </div>
        <div class="form-group">
            <label>Số điện thoại</label>
            <input type="text" name="phone">
        </div>
        <button type="submit" class="btn">Đăng Ký</button>
    </form>

    <div class="login-link">
        Đã có tài khoản? <a href="login">Đăng nhập ngay</a>
    </div>
</div>
</body>
</html>