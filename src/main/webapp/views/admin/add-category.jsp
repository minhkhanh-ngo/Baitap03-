<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm mới Danh mục</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
<div class="row justify-content-center">
    <div class="col-md-6">
        <div class="card shadow">
            <div class="card-header bg-primary text-white">
                <h4 class="mb-0">Thêm mới Danh mục</h4>
            </div>
            <div class="card-body">

                <form action="${pageContext.request.contextPath}/admin/category/add" method="post" enctype="multipart/form-data">

                    <div class="mb-3">
                        <label for="categoryname" class="form-label">Tên danh mục:</label>
                        <!-- Sửa name="name" thành name="categoryname" cho khớp với Entity -->
                        <input type="text" class="form-control" id="categoryname" name="categoryname" required placeholder="Nhập tên danh mục...">
                    </div>

                    <div class="mb-3">
                        <label for="images" class="form-label">Hình ảnh / Icon:</label>
                        <!-- Sửa name="icon" thành name="images" cho khớp với thuộc tính images trong Entity và Controller -->
                        <input type="file" class="form-control" id="images" name="images">
                    </div>

                    <div class="d-flex justify-content-between">
                        <a href="${pageContext.request.contextPath}/admin/category/list" class="btn btn-secondary">Quay lại</a>
                        <button type="submit" class="btn btn-success">Lưu danh mục</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>