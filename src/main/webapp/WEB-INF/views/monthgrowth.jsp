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
<script type="text/javascript">


$(document).ready(function() {
	
		  
	
});
</script>
</head>
<body>
	<%
		int origin1 = (Integer)request.getAttribute("prevmonthtotal");
		int origin2 = (Integer)request.getAttribute("monthtotal");
	
		DecimalFormat dc = new DecimalFormat("###,###,###,###");
		String ch1 = dc.format(origin1);
		String ch2 = dc.format(origin2);
	%>
	<div class="text-xs font-weight-bold text-info text-uppercase mb-1">저번달 총 매출액</div>
	<div><%=ch1 %> 원</div><br>
	<div class="text-xs font-weight-bold text-info text-uppercase mb-1">이번달 총 매출액</div>
	<div><%=ch2 %> 원</div><br>
	<div class="text-xs font-weight-bold text-info text-uppercase mb-1">전월대비 증가율</div>
    <div>${Math.round((monthtotal-prevmonthtotal)/prevmonthtotal *10000)/100 } %</div> 
</body>
</html>