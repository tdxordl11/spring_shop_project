<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns:th="https://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<!-- <meta http-equiv="refresh" content="1; url=http://localhost:8081/shop_project/user_login">  -->
<title>Insert title here</title>
<style>
  pre{
    overflow: scroll;
  }
</style>
</head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" ></script>
<script>
$(document).ready(function(){
	$(opener.location).attr('href','http://localhost:8081/shop_project/main');
	window.close();
});
</script>
<body>
  <h1>콜백 페이지</h1>
  ${res}
  <a href="http://localhost:8081/shop_project/main">go to main page</a>
</body>
</html>