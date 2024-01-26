<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/inc/top.jsp" %>

<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-2">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">자유게시판</h1>
            <%--            <p class="lead fw-normal text-white-50 mb-0">With this shop hompeage template</p>--%>
        </div>
    </div>
</header>

<c:if test="${not empty USER_INFO}">
<div class="container">

    <form action="freeRegist.wow" method="post"
          style="margin-top: 5px; display: flex; justify-content: center;">
        <table class="table table-bordered" style="max-width: 80%;">
            <colgroup>
                <col width="20%"/>
                <col/>
            </colgroup>
            <tr>
                <th>제목</th>
                <td><input type="text" name="boTitle" value="" class="form-control input-sm" required="required"></td>
            </tr>
            <tr>
                <th>아이디</th>
                <td><input type="text" name="boWriter" value="${USER_INFO.userId}" class="form-control input-sm" readonly></td>
            </tr>

            <tr>
                <th>내용</th>
                <td><textarea rows="10" name="boContent" class="form-control"></textarea>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <div class="pull-right">
                        <button type="submit" class="btn btn-sm btn-primary">
                            <span class="glyphicon glyphicon-save" aria-hidden="true"></span>
                            &nbsp;&nbsp;저장
                        </button>
                    </div>
                </td>
            </tr>
        </table>
    </form>

</div><!-- container -->
</c:if>

<c:if test="${empty USER_INFO}">
    잘못된 접근
</c:if>

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Core theme JS-->
<script src="/resource/js/jquery1.11.2.js"></script>


</body>
<script>
    // $('#id_btn_new_file').click(function () {
    //     $('.file_area').append('<div class="form-inline">'
    //         + '<input type="file" name="boFiles" class="form-control">'
    //         + ' <button type="button" class="btn_delete btn btn-sm">삭제</button>' + '</div>');
    // });
    //
    // $('.file_area').on('click', '.btn_delete', function () {
    //     $(this).closest('div').remove();
    // });
</script>
</html>


