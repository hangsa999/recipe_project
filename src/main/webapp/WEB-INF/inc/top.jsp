<%@page import="java.util.List" %>
<%@ page language="java"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Navigation-->

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="../">다이어트 레시피</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
                class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <%--                <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>--%>
                <%--                <li class="nav-item"><a class="nav-link" href="#!">About</a></li>--%>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">게시판</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">레시피게시판</a></li>
                        <%--                        <li><hr class="dropdown-divider" /></li>--%>
                        <li><a class="dropdown-item" href="/freeBoard/freeList.wow">자유게시판</a></li>
                        <li><a class="dropdown-item" href="#!">문의게시판</a></li>
                    </ul>
                </li>
            </ul>
            <form class="d-flex">
                <c:if test="${empty USER_INFO}">
                <a class="nav-link" href="/login/login.wow" role="button">로그인</a>
                </c:if>

                <c:if test="${not empty USER_INFO}">
                    ${USER_INFO.userId} 님, 환영합니다. &nbsp;
                <a class="nav-link" href="/login/logout.wow" role="button">로그아웃</a>
                </c:if>

            </form>
        </div>
    </div>
</nav>