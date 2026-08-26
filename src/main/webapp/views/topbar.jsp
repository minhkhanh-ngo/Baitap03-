<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<style>
  .topbar {
    background-color: #343a40;
    padding: 15px 30px;
    color: white;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
  }
  .topbar-logo {
    font-size: 24px;
    font-weight: bold;
  }
  .topbar-logo a {
    color: white;
    text-decoration: none;
  }
  .topbar-menu a {
    color: white;
    text-decoration: none;
    margin-left: 20px;
    font-size: 16px;
  }
  .topbar-menu a:hover {
    color: #17a2b8;
  }
  .user-info {
    color: #ffc107;
    margin-right: 15px;
    font-weight: bold;
  }
</style>

<div class="topbar">
  <div class="topbar-logo">
    <a href="${pageContext.request.contextPath}/home">IOTSTAR MVC</a>
  </div>
  <div class="topbar-menu">
    <!-- Kiểm tra session 'account' (đã được lưu ở LoginController) -->
    <c:choose>
      <c:when test="${not empty sessionScope.account}">
        <span class="user-info">Xin chào, ${sessionScope.account.fullName} !</span>
        <a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
      </c:when>
      <c:otherwise>
        <a href="${pageContext.request.contextPath}/login">Đăng nhập</a>
        <a href="${pageContext.request.contextPath}/register">Đăng ký</a>
      </c:otherwise>
    </c:choose>
  </div>
</div>