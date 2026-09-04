<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cập Nhật Sản Phẩm - UTE SHOP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-4">
    <h3 class="fw-bold mb-4">Cập nhật sản phẩm</h3>
    <div class="card shadow-sm border-0 p-4">
        <form action="${pageContext.request.contextPath}/admin/product/update" method="post" enctype="multipart/form-data">

            <input type="hidden" name="productId" value="${product.productId}">
            <input type="hidden" name="oldImages" value="${product.imageUrl}">

            <div class="mb-3">
                <label class="form-label fw-bold">Tên sản phẩm:</label>
                <input type="text" class="form-control" name="productName" value="${product.productName}" required>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label fw-bold">Giá (VNĐ):</label>
                    <input type="number" class="form-control" name="price" value="${product.price}" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label class="form-label fw-bold">Số lượng:</label>
                    <input type="number" class="form-control" name="quantity" value="${product.quantity}" required>
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold">Danh mục:</label>
                <select class="form-select" name="categoryId" required>
                    <c:forEach items="${listCategories}" var="c">
                        <option value="${c.categoryid}" ${product.category.categoryid == c.categoryid ? 'selected' : ''}>
                                ${c.cateName}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold">Hình ảnh hiện tại:</label><br>
                <img src="${product.imageUrl}" width="120" class="mb-2 shadow-sm rounded border">
                <input type="file" class="form-control" name="imageUrl">
                <small class="text-muted">Bỏ trống nếu không muốn thay đổi hình ảnh.</small>
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold">Mô tả:</label>
                <textarea class="form-control" name="description" rows="4">${product.description}</textarea>
            </div>

            <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
            <a href="${pageContext.request.contextPath}/admin/product/list" class="btn btn-secondary">Hủy</a>
        </form>
    </div>
</div>
</body>
</html>