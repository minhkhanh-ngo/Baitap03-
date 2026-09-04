<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chi Tiết Sản Phẩm - UTE SHOP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg px-4 shadow-sm mb-4" style="background-color: #bce3ff;">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold text-primary" href="${pageContext.request.contextPath}/home">UTE SHOP</a>
        <div class="ms-auto d-flex align-items-center">
            <a href="${pageContext.request.contextPath}/product" class="btn btn-outline-secondary btn-sm me-3">Quay lại danh sách</a>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger btn-sm">Đăng xuất</a>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <div class="card shadow-sm border-0 p-4">
        <div class="row">
            <div class="col-md-5">
                <img src="${product.imageUrl}" class="img-fluid rounded shadow-sm" alt="..." style="max-height: 400px; width: 100%; object-fit: cover;">
            </div>
            <div class="col-md-7 d-flex flex-column">
                <h2 class="fw-bold mb-3">${product.productName}</h2>

                <p class="text-danger fs-3 fw-bold mb-3">
                    <fmt:formatNumber value="${product.price}" type="number" groupingUsed="true"/> đ
                </p>

                <p class="mb-2"><strong>Danh mục:</strong> <span class="badge bg-secondary">${product.category.cateName}</span></p>
                <p class="mb-2"><strong>Số lượng trong kho:</strong> ${product.quantity}</p>
                <p class="mt-3 mb-4"><strong>Mô tả:</strong><br>${product.description}</p>
                <div class="mt-auto">
                    <a href="${pageContext.request.contextPath}/product" class="btn btn-secondary">Quay lại danh sách sản phẩm</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>