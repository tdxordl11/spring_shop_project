<%@page import="java.text.DecimalFormat"%>
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
</script>
</head>
<body>
	<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">오늘 매출 없음</div>
	<div>0 원</div><br>
	<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">최근 7일간 총 매출액</div>
	<%
		int origin = (Integer)request.getAttribute("weektotalincome");
		DecimalFormat dc = new DecimalFormat("###,###,###,###");
		String ch = dc.format(origin);
	%>
	<div><%=ch %>원</div><br>

</body>
</html>