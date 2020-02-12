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
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<!-- Custom fonts for this template -->
<link href="<%=respath %>vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<%=respath %>css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="<%=respath %>vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>
<body>
      <div class="card shadow mb-4">
       <form action='<%=contextpath + "/admin/admin_qna_update" %>' method="post">
        <div class="card-header py-3">
          <h6 class="m-0 font-weight-bold text-primary">1:1문의 관리</h6>
        </div>
        <br>
          <div class="col mr-2">
             <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">SEQ</div>
             <input type="text" id="cs_seq" name="cs_seq" class="form-control" value="${qnalist.cs_seq }" readonly="readonly"><br>
          </div>
          <div class="col mr-2">
             <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">작성자</div>
             <input type="text" id="user_id" name="user_id" class="form-control" value="${qnalist.user_id }" disabled="disabled"><br>
          </div>
           <div class="col mr-2">
             <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">작성시간</div>
             <input type="text" id="cs_date" name="cs_date" class="form-control" value="${qnalist.cs_date }" disabled="disabled"><br>
          </div>
          <div class="col mr-2">
             <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">제품명</div>
             <input type="text" id="product_name" name="product_name" class="form-control" value="${qnalist.product_name }" disabled="disabled"><br>
          </div>
          <div class="col mr-2">
             <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">카테고리</div>
              <input type="text" id="cs_category" name="cs_category" class="form-control" value="${qnalist.cs_category }" disabled="disabled"><br>
          </div>
          <div class="col mr-2">
             <div class="text-xs font-weight-bold text-primary text-uppercase mb-1" >문의 제목</div>
              <input type="text" id="cs_title" name="cs_title" class="form-control" value="${qnalist.cs_title }" disabled="disabled"><br>
          </div>
           <div class="col mr-2">
             <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">문의 내용</div>
             <textarea id="cs_contents" name="cs_contents" style="height: 170px" class="form-control" disabled="disabled">${qnalist.cs_contents }</textarea><br>
          </div>         
		  <hr>
		   <div class="col mr-2">
             <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">답변작성</div>
             <textarea id="comments_contents" name="comments_contents" style="height: 170px" class="form-control">${qnalist.comments_contents }</textarea><br>
          </div>
           <% 
             	SessionVO sessionVO = (SessionVO)session.getAttribute("session"); 
           %>
          <input type="hidden" id="admin_id" name="admin_id" style="height: 170px" class="form-control" value="<%=sessionVO.getId() %>"><br>
          
           <div style="text-align: center;">
          <input type="submit" class="btn btn-primary" value="저장">
          </div>
          <br>
          </form>
        </div>
</body>
</html>