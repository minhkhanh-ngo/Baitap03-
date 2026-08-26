<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Danh mục</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .sidebar {
            min-height: 100vh;
            background: #343a40;
            color: #fff;
        }
        .sidebar a {
            color: #adb5bd;
            text-decoration: none;
            padding: 10px 20px;
            display: block;
            transition: 0.2s;
        }
        .sidebar a:hover, .sidebar a.active {
            color: #fff;
            background: #495057;
            border-left: 4px solid #0d6efd;
        }
        .table-image {
            width: 45px;
            height: 45px;
            object-fit: cover;
            border-radius: 6px;
            border: 1px solid #dee2e6;
        }
    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-3 col-lg-2 d-md-block sidebar collapse p-0">
            <div class="position-sticky pt-3">
                <h5 class="text-center text-white pb-3 border-bottom border-secondary">ADMIN PANEL</h5>
                <ul class="nav flex-column mt-2">
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/admin/home">
                            <i class="fa-solid fa-house me-2"></i> Trang chủ
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="active" href="${pageContext.request.contextPath}/admin/category/list">
                            <i class="fa-solid fa-list me-2"></i> Quản lý Danh mục
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/logout">
                            <i class="fa-solid fa-right-from-bracket me-2"></i> Đăng xuất
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 py-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h3 fw-bold text-dark">Quản lý Danh mục sản phẩm</h1>
                <a href="${pageContext.request.contextPath}/admin/category/add" class="btn btn-primary shadow-sm">
                    <i class="fa-solid fa-plus me-1"></i> Thêm danh mục mới
                </a>
            </div>

            <div class="card shadow-sm border-0 mb-4 p-3 bg-white rounded-3">
                <form action="${pageContext.request.contextPath}/admin/category/search" method="get" class="row g-3 align-items-center">
                    <div class="col-md-10">
                        <div class="input-group">
                            <span class="input-group-text bg-light border-end-0"><i class="fa-solid fa-magnifying-glass text-muted"></i></span>
                            <input type="text" class="form-control bg-light border-start-0" name="keyword" value="${keyword}" placeholder="Nhập tên danh mục cần tìm kiếm...">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <button type="submit" class="btn btn-dark w-100 fw-semibold">Tìm kiếm</button>
                    </div>
                </form>
            </div>

            <div class="card shadow-sm border-0 rounded-3 overflow-hidden">
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="table-dark text-uppercase small">
                            <tr>
                                <th class="py-3 ps-4" style="width: 8%;">ID</th>
                                <th class="py-3" style="width: 15%;">Hình ảnh</th>
                                <th class="py-3" style="width: 55%;">Tên danh mục</th>
                                <th class="py-3 text-center" style="width: 22%;">Hành động</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:choose>
                                <c:when test="${not empty cateList}">
                                    <c:forEach items="${cateList}" var="cate">
                                        <tr>
                                            <td class="ps-4 fw-semibold text-secondary">#${cate.id}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty cate.icon}">
                                                        <img src="${pageContext.request.contextPath}/image?fname=${cate.icon}" alt="Icon" class="table-image">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="text-muted small fst-italic">Không có ảnh</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td><span class="fw-bold text-dark">${cate.name}</span></td>
                                            <td class="text-center">
                                                <a href="${pageContext.request.contextPath}/admin/category/edit?id=${cate.id}" class="btn btn-sm btn-outline-warning me-2 px-3 fw-semibold">
                                                    <i class="fa-solid fa-pen-to-square me-1"></i> Sửa
                                                </a>
                                                <a href="${pageContext.request.contextPath}/admin/category/delete?id=${cate.id}"
                                                   onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục [${cate.name}] này không?');"
                                                   class="btn btn-sm btn-outline-danger px-3 fw-semibold">
                                                    <i class="fa-solid fa-trash me-1"></i> Xóa
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="4" class="text-center py-4 text-muted">
                                            <i class="fa-solid fa-box-open fa-2x mb-2 d-block opacity-50"></i>
                                            Không tìm thấy danh mục nào trong hệ thống!
                                        </td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>