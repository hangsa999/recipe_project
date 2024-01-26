<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: pc33
  Date: 24. 1. 9.
  Time: 오후 12:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%-- /WEB-INF/wiew/freeBoard/replyList.jsp --%>
<c:forEach items="${replyList}" var="reply">
<div class="row" data-re-no=${reply.reNo}>
    <div class="col-sm-2 text-right">${reply.reMemId}</div>
    <div class="col-sm-6">
        <pre>${reply.reContent}</pre>
    </div>
    <div class="col-sm-2">${reply.reRegDate}</div>
    <div class="col-sm-2">
        <c:if test="${reply.reMemId == USER_INFO.userId}">
            <button name="btn_reply_edit" type="button"
                    class=" btn btn-sm btn-info">수정
            </button>
            <button name="btn_reply_delete" type="button"
                    class="btn btn-sm btn-danger">삭제
            </button>
        </c:if>
    </div>
</div>
</c:forEach>

</body>
</html>
