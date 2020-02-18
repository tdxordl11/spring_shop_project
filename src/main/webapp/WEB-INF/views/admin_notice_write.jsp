<%@page import="com.spring.shop_project.SessionVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	String contextpath = request.getContextPath();
	String respath = request.getContextPath() +"/resources/"; 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<!-- Custom fonts for this template -->
<link href="<%=respath %>vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<%=respath %>css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="<%=respath %>vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<script>
//달력
$.datepicker.setDefaults({
	    dateFormat: 'yy/mm/dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    showMonthAfterYear: true,
	    changeYear: true,
	    changeMonth: true,
	    showAnim:"slide",
	    yearSuffix: '년'
	  });

	  $(function() {
	    $("#startDate, #endDate").datepicker();
	  });
</script>

</head>
<body>
      <div class="card shadow mb-4">
        <div class="card-header py-3">
          <h6 class="m-0 font-weight-bold text-primary">이용후기 관리</h6>
        </div>
        <br>
          <form action='<%=contextpath + "/admin/admin_notice_write"%>' method="post">
          <div class="col mr-2">
             <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">작성자</div>
             <% 
             	SessionVO sessionVO = (SessionVO)session.getAttribute("session"); 
             %>
             <div class="h5 mb-0 font-weight-bold text-gray-800"><%=sessionVO.getId() %></div><br>
          </div>
          <div class="col mr-2">
             <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">공지사항 제목</div>
             <input type="text" id="notice_title" name="notice_title" class="form-control" value="${noticedetail.notice_title }"><br>
          </div>
           <div class="col mr-2">
             <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">공지사항 내용</div>
             <textarea id="notice_contents" name="notice_contents" style="height: 170px" class="form-control">${noticedetail.notice_contents }</textarea><br>
          </div>
          <div class="col mr-2">
             <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">공지사항 시작일</div>
              <input type="text" autocomplete=off id="startDate" name="start_date" class="form-control"><br>
          </div>
          <div class="col mr-2">
             <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">공지사항 종료일</div>
              <input type="text" autocomplete=off id="endDate" name="end_date" class="form-control"><br>
          </div>
          <div style="text-align: center;">
          <input type="submit" class="btn btn-primary" value="저장">
          </div>
          <br>
          </form>
        </div>
</body>
</html>