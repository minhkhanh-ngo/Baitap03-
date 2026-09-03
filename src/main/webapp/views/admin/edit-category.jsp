<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa Danh mục</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
<div class="row justify-content-center">
    <div class="col-md-6">
        <div class="card shadow">
            <div class="card-header bg-warning text-dark">
                <h4 class="mb-0">Cập nhật Danh mục</h4>
            </div>
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/admin/category/edit" method="post" enctype="multipart/form-data">

                    <input type="hidden" name="categoryid" value="${category.categoryid}">
                    <input type="hidden" name="oldImages" value="${category.images}">

                    <div class="mb-3">
                        <label for="cateName" class="form-label">Tên danh mục:</label>
                        <input type="text" class="form-control" id="cateName" name="cateName" value="${category.cateName}" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Ảnh hiện tại:</label><br>
                        <c:if test="${not empty category.images}">
                            <img src="${pageContext.request.contextPath}/image?fname=${category.images}" width="80" height="80" class="mb-2" style="object-fit: cover; border-radius: 5px;">
                        </c:if>
                        <c:if test="${empty category.images}">
                            <p class="text-muted">Chưa có ảnh</p>
                        </c:if>
                    </div>

                    <div class="mb-3">
                        <label for="images" class="form-label">Đổi hình ảnh mới (nếu muốn):</label>
                        <input type="file" class="form-control" id="images" name="images">
                    </div>

                    <div class="d-flex justify-content-between">
                        <a href="${pageContext.request.contextPath}/admin/category/list" class="btn btn-secondary">Quay lại</a>
                        <button type="submit" class="btn btn-warning">Cập nhật</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>