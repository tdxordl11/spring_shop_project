<%@page import="java.text.DecimalFormat"%>
<%@page import="com.spring.shop_project.OrderVO"%>
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
</head>
<body>
	
	<%
		int origin = (Integer)request.getAttribute("todaytotalincome");
		int origin2 = (Integer)request.getAttribute("weektotalincome");
		
		DecimalFormat dc = new DecimalFormat("###,###,###,###");
		String ch = dc.format(origin);
		String ch2 = dc.format(origin2);
	%>
	<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">오늘 총 매출액</div>
	<div><%=ch %>원</div><br>
	
	<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">최근 7일간 총 매출액</div>
	<div><%=ch2 %>원</div><br>
</body>
</html>