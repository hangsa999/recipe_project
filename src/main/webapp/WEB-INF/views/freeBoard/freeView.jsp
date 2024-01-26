<%@page import="com.study.freeBoard.vo.FreeBoardVO" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
<%@ page import="com.study.freeBoard.service.IFreeBoardService" %>
<%@ page import="com.study.freeBoard.service.FreeBoardServiceImpl" %>
<%@ page import="com.study.exception.BizNotFoundException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="/WEB-INF/inc/header.jsp" %>
    <title>자유게시판 - 글 보기</title>
</head>
<body>
<%@ include file="/WEB-INF/inc/top.jsp" %>


<div class="container">
    <div class="page-header">
        <h3>
            자유게시판 - <small>글 보기</small>
        </h3>
    </div>
    <table class="table table-bordered">
        <tbody>
        <tr>
            <th>글번호</th>
            <td>${freeBoard.boNo}</td>
        </tr>
        <tr>
            <th>글제목</th>
            <td>${freeBoard.boTitle}</td>
        </tr>
        <tr>
            <th>작성자명</th>
            <td>${freeBoard.boWriter}</td>
        </tr>
        <!-- 비밀번호는 보여주지 않음  -->
        <tr>
            <th>내용</th>
            <td>${freeBoard.boContent}</td>
        </tr>

        <tr>
            <th>조회수</th>
            <td>${freeBoard.boHit}</td>
        </tr>
        <tr>
            <th>최근수정일자</th>
            <td>${freeBoard.boRegDate}</td>
        </tr>
        <tr>
            <th>삭제여부</th>
            <td>${freeBoard.boDelYn}</td>
        </tr>

        <tr>
            <td colspan="2">
                <div class="pull-left">
                    <a href="freeList.wow" class="btn btn-default btn-sm"> <span class="glyphicon glyphicon-list"
                                                                                 aria-hidden="true"></span> &nbsp;&nbsp;목록
                    </a>
                </div>
                <div class="pull-right">
                    <a href="freeEdit.wow?boNo=${freeBoard.boNo}" class="btn btn-success btn-sm"> <span
                            class="glyphicon glyphicon-pencil" aria-hidden="true"></span> &nbsp;&nbsp;수정
                    </a>
                </div>
            </td>
        </tr>
        </tbody>
    </table>
</div>

<div class="container">
    <!-- reply container -->
    <!-- // START : 댓글 등록 영역  -->
    <div class="panel panel-default">
        <div class="panel-body form-horizontal">
            <form name="frm_reply" action="<c:url value='' />"
                  method="post" onclick="return false;">
                <input type="hidden" name="reParentNo" value="${freeBoard.boNo}">
                <input type="hidden" name="reCategory" value="FREE">
                <input type="hidden" name="reMemId" value="${USER_INFO.userId}">
                <input type="hidden" name="reIp" value="<%=request.getRemoteAddr()%>">
                <div class="form-group">
                    <label class="col-sm-2  control-label">댓글</label>
                    <div class="col-sm-8">
                        <textarea rows="3" name="reContent" class="form-control" readonly="readonly"></textarea>
                    </div>
                    <div class="col-sm-2">
                        <button id="btn_reply_regist" type="button"
                                class="btn btn-sm btn-info">등록
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- // END : 댓글 등록 영역  -->


    <!-- // START : 댓글 목록 영역  -->
    <div id="id_reply_list_area">
        <div data-page="1"></div>
    </div>
    <!-- // END : 댓글 목록 영역  -->

    <div class="row text-center" id="id_reply_list_more">
        <a id="btn_reply_list_more"
           class="btn btn-sm btn-default col-sm-10 col-sm-offset-1"> <span
                class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
            더보기
        </a>
    </div>

    <!-- START : 댓글 수정용 Modal -->
    <div class="modal fade" id="id_reply_edit_modal" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <form name="frm_reply_edit"
                      action="<c:url value='' />" method="post"
                      onclick="return false;">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                        <h4 class="modal-title">댓글수정</h4>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="reNo" value="">
                        <textarea rows="3" name="reContent" class="form-control"></textarea>
                        <input type="hidden" name="reMemId" value="${USER_INFO.userId}">
                    </div>
                    <div class="modal-footer">
                        <button id="btn_reply_modify" type="button"
                                class="btn btn-sm btn-info">저장
                        </button>
                        <button type="button" class="btn btn-default btn-sm"
                                data-dismiss="modal">닫기
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- END : 댓글 수정용 Modal -->

</div>
<!-- reply container -->

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Core theme JS-->
<script src="/resource/js/jquery1.11.2.js"></script>

</body>

<script>
    let param = {"curPage": 1, "reCategory": "FREE", "reParentNo": ${freeBoard.boNo}};

    <%--function replyList() {--%>
    <%--    $.ajax({--%>
    <%--        url: "/reply/replyList",--%>
    <%--        data: param,--%>
    <%--        success: function (replyList) {    // List<ReplyVO>--%>
    <%--            let str = '';--%>
    <%--            $.each(replyList, function (index, reply) {--%>
    <%--                str += '<div class="row" data-re-no="' + reply.reNo + '">'--%>
    <%--                    + '<div class="col-sm-2 text-right">' + reply.reMemName + '</div>'--%>
    <%--                    + '<div class="col-sm-6">'--%>
    <%--                    + '<pre>' + reply.reContent + '</pre>'--%>
    <%--                    + '</div>'--%>
    <%--                    + '<div class="col-sm-2">' + reply.reRegDate + '</div>'--%>
    <%--                    + '<div class="col-sm-2">';--%>
    <%--                if (reply.reMemId == '${USER_INFO.userId}') {--%>
    <%--                    str += '<button name="btn_reply_edit" type="button"'--%>
    <%--                        + 'class=" btn btn-sm btn-info">수정</button>'--%>
    <%--                        + '<button name="btn_reply_delete" type="button"'--%>
    <%--                        + 'class="btn btn-sm btn-danger">삭제</button>'--%>
    <%--                }--%>
    <%--                str += '</div></div>';--%>
    <%--            });  // each--%>
    <%--            $("#id_reply_list_area").append(str);--%>
    <%--        }--%>
    <%--    }); // ajax--%>
    <%--}--%>

    function replyListLoad() {
        let page = param.curPage;
        let $replyDiv = $("#id_reply_list_area").find("div[data-page='"+ page + "']");
        $replyDiv.load("/freeBoard/replyList", param);
        param.curPage += 1;
        $("#id_reply_list_area").append("<div data-page=" + param.curPage + " > </div>")
    }

    $(document).ready(function (e) {
        replyListLoad();
        let id = $("input[name='reMemId']").val()
        if (id != "") {
            $("textarea[name='reContent']").removeAttr("readonly");
        }
        console.log(id)
        // 더보기 버튼
        $("#id_reply_list_more").on("click", function (e) {
            replyListLoad();
        });

        // 등록버튼
        $("#btn_reply_regist").on("click", function (e) {
            // 가장가까운 form찾은 후 ajax 호출(data는 form.serialize(), )
            // 성공 : 등록 글 내용부분 지우기,  댓글영역초기화( param.curPage = 1, list_area.html(''),  replyList() )
            // 실패 : error : req.status==401이면 login으로   location.href
            let form = $("#btn_reply_regist").closest("form")

            $.ajax({
                url: "/reply/insertReply",
                data: form.serialize(),
                success: function () {
                    form.find("textarea").val("");
                    param.curPage = 1;
                    $("#id_reply_list_area").html("<div data-page=" + param.curPage + " > </div>");
                    replyListLoad();
                },
                error: function (request) {
                    console.log("code: " + request.status);
                    if (request.status === 401 || request.status === 500) {
                        location.href = "/login/login.wow";
                    }
                }
            })

        });// 등록버튼


        // 펑션 만들기
        //수정버튼 : 댓글 영역안에 있는 수정버튼만 이벤트 등록
        $("#id_reply_list_area").on("click", 'button[name="btn_reply_edit"]', function (e) {
            //현재 버튼의 상위 div(한개 댓글) 찾기
            //div에서 현재 댓글 내용을 modal에 있는 textarea에 복사
            //div태그의 data-re-no 값을 modal에 있는 input name="reNo" 태그의 value값에 복사
            //복사 후   .modal('show')
            let row = this.closest("div[class='row']");

            let text = $(row).find("pre").text();
            let textArea = $("div[class='modal-body']").find("textarea")
            textArea.val(text)

            let rowReno = $(row).data("reNo")
            let modalReNo = $("div[class='modal-body']").find("[name='reNo']")
            modalReNo.val(rowReno)

            $("#id_reply_edit_modal").modal('show');

        });// 수정버튼

        // 모달창 저장 버튼
        $("#btn_reply_modify").on("click", function (e) {
            //가장 가까운 form 찾기 , ajax 호출(  data:form.serialize()
            // 성공 :  modal 찾은 후 modal('hide')
            // 현재 모달에 있는 reNo, reContent 찾기
            // 댓글영역에서 re_no에 해당하는 댓글 찾은 후 안의 내용 re_content 로 변경
            let form = $("#btn_reply_modify").closest("form")

            $.ajax({
                url: "/reply/replyModify",
                data: form.serialize(),
                success: function () {
                    $("#id_reply_edit_modal").modal('hide');

                    let modalReno = $("div[class='modal-body']").find("[name='reNo']").val();
                    let modalContent = $("div[class='modal-body']").find("textarea").val();

                    // modalReno와 rowNo가 같을 때 (지금 연 modal이 어떤 댓글과 연결되있는지 체크)
                    $("div[class='row']").each(function (index, item) {
                        let rowNo = $(item).data("reNo")
                        if (modalReno == rowNo) {
                            $(item).find("pre").text(modalContent);
                        }
                    })
                }

            })

        });//모달창 저장버튼


        // 삭제버튼
        $("#id_reply_list_area").on("click", 'button[name="btn_reply_delete"]', function (e) {
            // 가장 가까운 div 찾기,
            // reNo,  reMemId(현재 로그인 한 사람의 id) 구하기
            // ajax 호출(reNo, reMemeId보내기) reMemId는 본인이 쓴 글인지 확인하는데 쓰임 (BizAccessFailException)
            // 성공  후 해당 div.remove
            const delDiv = this.closest("div");
            const delReNo = $(delDiv).closest("div[class='row']").data("reNo");
            const delReMemId = $("input[name='reMemId']").val();

            $.ajax({
                url: "/reply/replyDelete",
                data: {"reNo": delReNo, "reMemId": delReMemId},
                success: function () {
                    $(delDiv).closest("div[class='row']").remove();
                    console.log(delReNo);
                    console.log(delReMemId);
                    // param.curPage = 1;
                    // $("#id_reply_list_area").html('');
                    // replyList();
                },
                error: function () {
                    console.log("실패")
                }
            })

        }); // 삭제버튼

    }); // ready


</script>

</html>






