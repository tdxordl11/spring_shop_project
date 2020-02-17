<%@page import="com.spring.shop_project.AdminVO"%>
<%@page import="java.util.List"%>
<%@page import="com.spring.shop_project.SessionVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	String contextpath = request.getContextPath();
	String respath = request.getContextPath() +"/resources/"; 
%>
<script src="https://code.jquery.com/jquery-3.4.1.js"   
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="   
	crossorigin="anonymous">
</script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

$(document).ready(function () {
	
	
	
	
});

		
</script>

<!-- contents start -->
<h1 class="h3 mb-2 text-gray-800">계정관리</h1>
<p class="mb-4"></p>
<!-- DataTales Example -->
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">사용자 계정관리</h6>
	</div>
	<form
		action='<%=contextpath + "/admin/main?menu=user_manage_update"%>'
		method="post">
		<br>
		<div class="col mr-2">
			<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">아이디</div>
			<input type="text" id="user_id" name="user_id" class="form-control" value="${userdetail.user_id }" readonly="readonly"><br>
		</div>
		<div class="col mr-2">
			<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">이메일</div>
			<input type="text" id="user_email" name="user_email" class="form-control" value="${userdetail.user_email }"><br>
		</div>
		<div class="col mr-2">
			<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">주소</div>
			<textarea id="user_address" name="user_address" style="height: 170px" class="form-control">${userdetail.user_name }</textarea>
			<br>
		</div>
		<div class="col mr-2">
			<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">이름</div>
			<textarea id="user_name" name="user_name"  class="form-control">${userdetail.user_name }</textarea>
			<br>
		</div>
		<div class="col mr-2">
			<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">전화번호</div>
			<input type="text" id="user_phone" name="user_phone" class="form-control" value="${userdetail.user_phone}"><br>
		</div>
		<div class="col mr-2">
			<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">등급</div>
			<input type="text" id="user_grade" name="user_grade" class="form-control" value="${userdetail.user_grade}"><br>
		</div>
		<div style="text-align: center;">
			<input type="submit" class="btn btn-primary" value="수정">
		</div>
	</form>
	<br>
</div>


<!-- contents end -->