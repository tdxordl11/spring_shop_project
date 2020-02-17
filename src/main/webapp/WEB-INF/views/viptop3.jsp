<%@page import="java.util.List"%>
<%@page import="com.spring.shop_project.OrderVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"   
   integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="   
   crossorigin="anonymous">
</script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">


$(document).ready(function() {
	
		  
	
});
</script>
</head>
<body>
	<div>
	<table>
	<c:forEach items = "${viptop3}" var="vo">
		<tr>
			<td>TOP ${vo.rownum} 등</td>
			<td>호구명 : ${vo.user_id }</td>
			<%-- <td>${vo.totalincome } 원</td><br> --%>
		</tr>
	</c:forEach>
	</table>
	
	</div>
</body>
</html>