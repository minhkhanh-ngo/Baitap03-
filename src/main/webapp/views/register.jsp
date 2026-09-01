<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng ký tài khoản</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex align-items-center justify-content-center py-5">
<div class="card shadow p-4" style="width: 450px;">
    <h3 class="text-center mb-3 fw-bold">Đăng ký tài khoản</h3>

    <c:if test="${not empty alert}">
        <div class="alert alert-danger" role="alert">
                ${alert}
        </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/register" method="post">
        <div class="mb-3">
            <label for="username" class="form-label">Tài khoản</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="Nhập tài khoản..." required>
        </div>

        <div class="mb-3">
            <label for="password" class="form-label">Mật khẩu</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Nhập mật khẩu..." required>
        </div>

        <div class="mb-3">
            <label for="email" class="form-label">Email (nhận mã OTP)</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Nhập email của bạn..." required>
        </div>

        <div class="mb-3">
            <label for="fullname" class="form-label">Họ và tên</label>
            <input type="text" class="form-control" id="fullname" name="fullname" placeholder="Nhập họ và tên..." required>
        </div>

        <div class="mb-3">
            <label for="phone" class="form-label">Số điện thoại</label>
            <input type="tel" class="form-control" id="phone" name="phone" placeholder="Nhập số điện thoại...">
        </div>

        <button type="submit" class="btn btn-primary w-100 py-2 fw-semibold mb-3">Đăng ký</button>

        <div class="text-center">
            <span>Đã có tài khoản? </span>
            <a href="${pageContext.request.contextPath}/login" class="text-decoration-none">Đăng nhập ngay</a>
        </div>
    </form>
</div>
</body>
</html>