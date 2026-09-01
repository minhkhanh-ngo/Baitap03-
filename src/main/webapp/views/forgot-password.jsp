<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quên mật khẩu</title>
</head>
<body>
<h2>Khôi phục mật khẩu</h2>
<c:if test="${not empty alert}">
    <p style="color: red;">${alert}</p>
</c:if>
<form action="${pageContext.request.contextPath}/forgot-password" method="post">
    <label>Nhập email đăng ký của bạn:</label><br>
    <input type="email" name="email" required style="width: 300px; padding: 5px;"><br><br>
    <button type="submit">Gửi mã OTP</button>
</form>
<br>
<a href="${pageContext.request.contextPath}/login">Quay lại đăng nhập</a>
</body>
</html>