<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.study.common.util.CookieUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <title>회원가입</title>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>

<header class="bg-dark py-5">
    <div class="container px-4 px-lg-2 my-2">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">회원가입</h1>
            <%--            <p class="lead fw-normal text-white-50 mb-0">With this shop hompeage template</p>--%>
        </div>
    </div>
</header>


<div class="container" style="max-width: 1500px; margin-top: 50px">
    <div class="input-form-backgroud row">
        <div class="input-form col-md-6 mx-auto">
            <form class="validation-form" novalidate>
                <table class="table table-bordered">
                    <tbody>
                    <tr>
                        <th>아이디</th>
                        <td><input type="text" name="userId" class="form-control input-sm" required></td>
                        <button>중복 확인</button>
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td><input type="password" name="userPass" class="form-control input-sm" required></td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td><input type="text" name="userName" class="form-control input-sm" required></td>
                    </tr>
                    <tr>
                        <th>휴대폰 번호</th>
                        <td><input type="text" name="userHP" class="form-control input-sm" required></td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td><input type="email" name="userEmail" class="form-control input-sm" required></td>
                    </tr>
                    </tbody>
                </table>
                <button type="submit" class="btn btn-secondary btn-sm pull-right">회원가입</button>
            </form>
        </div>
    </div>

</div>

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Core theme JS-->
<script src="/resource/js/jquery1.11.2.js"></script>

</body>
</html>