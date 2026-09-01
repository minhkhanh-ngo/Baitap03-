<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex align-items-center justify-content-center vh-100">
<div class="card shadow p-4" style="width: 400px;">
    <h3 class="text-center mb-3 fw-bold">Đăng nhập hệ thống</h3>

    <c:if test="${not empty alert}">
        <div class="alert alert-danger" role="alert">
                ${alert}
        </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="mb-3">
            <label for="username" class="form-label">Tài khoản</label>
            <input type="text" class="form-control" id="username" name="username"
                   value="${cookie.username.value}" placeholder="Nhập tài khoản..." required>
        </div>

        <div class="mb-3">
            <label for="password" class="form-label">Mật khẩu</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Nhập mật khẩu..." required>
        </div>

        <div class="d-flex justify-content-between align-items-center mb-3">
            <div class="form-check mb-0">
                <input type="checkbox" class="form-check-input" id="remember" name="remember">
                <label class="form-check-label" for="remember">Nhớ tài khoản</label>
            </div>
            <a href="${pageContext.request.contextPath}/forgot-password" class="text-decoration-none">Quên mật khẩu?</a>
        </div>

        <button type="submit" class="btn btn-primary w-100 py-2 fw-semibold mb-3">Đăng nhập</button>

        <div class="text-center">
            <span>Chưa có tài khoản? </span>
            <a href="${pageContext.request.contextPath}/register" class="text-decoration-none">Đăng ký ngay</a>
        </div>
    </form>
</div>
</body>
</html>