<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang Chủ</title>
</head>
<body>
<h2>Chào mừng bạn đã đăng nhập thành công!</h2>
<p>Xin chào: <strong>${sessionScope.account.fullName}</strong></p>
<a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
</body>
</html>