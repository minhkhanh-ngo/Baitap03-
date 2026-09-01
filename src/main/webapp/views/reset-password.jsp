<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Đặt lại mật khẩu</title>
</head>
<body>
<h2>Xác thực OTP và Đổi mật khẩu</h2>
<c:if test="${not empty alert}">
    <p style="color: red;">${alert}</p>
</c:if>
<form action="${pageContext.request.contextPath}/reset-password" method="post">
    <label>Mã OTP (6 chữ số):</label><br>
    <input type="text" name="otp" required style="width: 300px; padding: 5px;"><br><br>

    <label>Mật khẩu mới:</label><br>
    <input type="password" name="newPassword" required style="width: 300px; padding: 5px;"><br><br>

    <button type="submit">Xác nhận đổi mật khẩu</button>
</form>
</body>
</html>