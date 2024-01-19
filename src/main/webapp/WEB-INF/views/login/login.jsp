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
    <title>Insert title here</title>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<%
    String msg = request.getParameter("msg");
    String id = "";
    String checked = "";

    CookieUtils cookieUtils = new CookieUtils(request);
    if (cookieUtils.exists("SAVE_ID")) {
        id = cookieUtils.getValue("SAVE_ID");
        checked = "checked='checked'";
    }
%>

<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">로그인</h1>
            <%--            <p class="lead fw-normal text-white-50 mb-0">With this shop hompeage template</p>--%>
        </div>
    </div>
</header>

<div class="container" style="max-width: 400px; margin-top: 50px">
    <form action="login.wow" class="loginForm" method="post">
        <table class="table table-bordered">
            <tbody>
            <tr>
                <th>아이디</th>
                <td><input type="text" name="userId" class="form-control input-sm" value="<%=id%>"></td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td><input type="password" name="userPass" class="form-control input-sm"></td>
            </tr>
            <tr>
                <td colspan="2"><label><input type="checkbox" name="rememberMe" value="Y" <%=checked %>> 아이디
                    기억하기</label></td>
            </tr>
            <tr>
                <td colspan="2">
                    <% if (msg != null) { %>
                    <div class="alert alert-danger small" role="alert" >
                        <%=msg%>
                    </div>
                    <% } %>
                    <button type="submit" class="btn btn-secondary btn-sm pull-right">로그인</button>
                    <button type="button" onclick="" class="btn btn-secondary btn-sm pull-right">회원가입</button>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
</div>
<!-- container -->


<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Core theme JS-->
<script src="/resource/js/scripts.js"></script>

</body>
</html>