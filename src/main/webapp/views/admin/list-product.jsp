<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý Sản Phẩm - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-light">

<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="fw-bold"><i class="fa-solid fa-box-open me-2"></i>Quản lý Sản phẩm</h3>
        <div>
            <a href="${pageContext.request.contextPath}/admin/home" class="btn btn-secondary me-2">Về Dashboard</a>
            <a href="${pageContext.request.contextPath}/admin/product-add" class="btn btn-success"><i class="fa-solid fa-plus me-1"></i> Thêm sản phẩm mới</a>
        </div>
    </div>

    <div class="card shadow-sm border-0">
        <div class="card-body p-0">
            <table class="table table-hover table-bordered mb-0 align-middle">
                <thead class="table-dark text-center">
                <tr>
                    <th width="5%">ID</th>
                    <th width="12%">Hình ảnh</th>
                    <th width="25%">Tên sản phẩm</th>
                    <th width="15%">Danh mục</th>
                    <th width="15%">Giá bán</th>
                    <th width="10%">Tồn kho</th>
                    <th width="18%">Hành động</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listProducts}" var="p">
                    <tr>
                        <td class="text-center">${p.productId}</td>
                        <td class="text-center">
                            <img src="${p.imageUrl}" alt="img" class="img-thumbnail" style="width: 80px; height: 80px; object-fit: cover;">
                        </td>
                        <td class="fw-bold">${p.productName}</td>
                        <td><span class="badge bg-info text-dark">${p.category.cateName}</span></td>
                        <td class="text-danger fw-bold text-end">
                            <fmt:formatNumber value="${p.price}" type="number" groupingUsed="true"/> đ
                        </td>
                        <td class="text-center">${p.quantity}</td>
                        <td class="text-center">
                            <a href="${pageContext.request.contextPath}/admin/product/edit?id=${p.productId}" class="btn btn-warning btn-sm">
                                <i class="fa-solid fa-pen-to-square"></i> Sửa
                            </a>
                            <a href="${pageContext.request.contextPath}/admin/product/delete?id=${p.productId}" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc muốn xóa sản phẩm: ${p.productName}?');">
                                <i class="fa-solid fa-trash"></i> Xóa
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>