<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Xác thực OTP</title>
</head>
<body>
<h2>Nhập mã OTP</h2>
<c:if test="${not empty alert}">
    <p style="color: red;">${alert}</p>
</c:if>
<form action="verify" method="post">
    <label>Mã OTP (đã gửi về email):</label>
    <input type="text" name="otp" required />
    <button type="submit">Xác nhận</button>
</form>
</body>
</html>