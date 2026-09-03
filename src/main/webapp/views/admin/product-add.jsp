<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm sản phẩm mới</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-light">

<div class="container mt-5 mb-5">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="card shadow border-0 rounded-4">
                <div class="card-header bg-dark text-white text-center py-3 rounded-top-4">
                    <h4 class="mb-0 fw-bold"><i class="fa-solid fa-cart-plus me-2"></i> Thêm Sản Phẩm Mới</h4>
                </div>
                <div class="card-body p-4">
                    <form action="${pageContext.request.contextPath}/admin/product-add" method="post" enctype="multipart/form-data">

                        <div class="mb-3">
                            <label class="form-label fw-bold">Tên sản phẩm:</label>
                            <input type="text" name="productName" class="form-control" placeholder="Nhập tên sản phẩm..." required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Giá (VNĐ):</label>
                            <input type="number" step="any" name="price" class="form-control" placeholder="Ví dụ: 150000" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Số lượng tồn kho:</label>
                            <input type="number" name="quantity" class="form-control" placeholder="Ví dụ: 50" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Hình ảnh sản phẩm:</label>
                            <input type="file" name="imageFile" class="form-control" accept="image/*" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Danh mục sản phẩm:</label>
                            <select name="categoryId" class="form-select" required>
                                <option value="" disabled selected>-- Chọn danh mục sản phẩm --</option>
                                <c:forEach items="${listCategories}" var="c">
                                    <option value="${c.categoryid}">${c.cateName}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="d-grid gap-2 mt-4">
                            <button type="submit" class="btn btn-primary fw-bold py-2">
                                <i class="fa-solid fa-check me-1"></i> Lưu sản phẩm
                            </button>
                            <a href="${pageContext.request.contextPath}/admin/home" class="btn btn-secondary fw-bold py-2">
                                <i class="fa-solid fa-arrow-left me-1"></i> Quay lại Dashboard
                            </a>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>