<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<style>

#nav {
	text-align: center;
}

#nav li {
	display: inline;
}

#nav a {
	display: inline-block;
}

</style>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <script src=<%= request.getContextPath() + "/resources/jquery-3.2.1.min.js" %>></script> --%>
<script src="https://code.jquery.com/jquery-3.4.1.js"   
   integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="   
   crossorigin="anonymous">
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
$(document).ready(function() {

	
});
</script>
</head>
<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">관리자 페이지</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav" id="nav">

        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">계정 관리 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">관리자계정관리</a></li>
             <li class="divider"></li>
            <li><a href="#">유저계정관리</a></li>
          </ul>
        </li>
        
         <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">상품 관리 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">상품등록</a></li>
             <li class="divider"></li>
            <li><a href="#">상품현황</a></li>
          </ul>
        </li>
        
         <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">결제 관리 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">결제현황</a></li>
             <li class="divider"></li>
            <li><a href="#">제품 배송현황</a></li>
          </ul>
        </li>
        
         <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">cs 관리 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">FAQ 리스트 관리</a></li>
             <li class="divider"></li>
            <li><a href="#">1:1 문의</a></li>
            <li class="divider"></li>
            <li><a href="#">이용후기 관리</a></li>
          </ul>
        </li>
        
         <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">통계 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="/incomechart">기간별 판매금액 추이</a></li>
             <li class="divider"></li>
            <li><a href="#">이달의 호구</a></li>
            <li class="divider"></li>
            <li><a href="#">TOP5 인기 상품</a></li>
          </ul>
        </li>
        
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">기타 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">미정</a></li>
             <li class="divider"></li>
            <li><a href="#">미정</a></li>
          </ul>
        </li>
      </ul>
      
      <form class="navbar-form navbar-right" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
</body>
</html>