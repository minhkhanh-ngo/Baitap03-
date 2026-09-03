<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Sản Phẩm - UTE SHOP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg px-4 shadow-sm mb-4" style="background-color: #bce3ff;">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold text-primary" href="${pageContext.request.contextPath}/home">UTE SHOP</a>
        <div class="ms-auto d-flex align-items-center">
            <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-secondary btn-sm me-3">Về trang chủ</a>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger btn-sm">Đăng xuất</a>
        </div>
    </div>
</nav>

<div class="container">
    <h3 class="fw-bold mb-4">Danh sách sản phẩm</h3>

    <div class="row">
        <c:forEach items="${listProducts}" var="p">
            <div class="col-md-4 mb-4">
                <div class="card h-100 shadow-sm border-0">
                    <img src="${p.imageUrl}" class="card-img-top" alt="..." style="height: 200px; object-fit: cover;">
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title fs-6 fw-bold mb-2">${p.productName}</h5>
                        <p class="card-text text-danger fw-bold mb-1">${p.price} VNĐ</p>
                        <p class="card-text text-muted small mb-3">${p.category.cateName}</p>
                        <a href="${pageContext.request.contextPath}/product-detail?id=${p.productId}" class="btn btn-primary btn-sm mt-auto w-100">Xem chi tiết</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <nav aria-label="Page navigation" class="my-4">
        <ul class="pagination justify-content-center">
            <c:forEach begin="1" end="${endPage}" var="i">
                <li class="page-item ${tag == i ? 'active' : ''}">
                    <a class="page-link" href="${pageContext.request.contextPath}/product?page=${i}">${i}</a>
                </li>
            </c:forEach>
        </ul>
    </nav>
</div>
</body>
</html>