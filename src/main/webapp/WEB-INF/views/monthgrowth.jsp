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
	<div>저번달 총 매출액 : ${prevmonthtotal} 원</div>
	<div>이번달 총 매출액 : ${monthtotal} 원</div>
	<%-- 소수 셋째자리에서 반올림  전월대비 증가율: ${(prevmonthtotal-monthtotal)/monthtotal *100} % 35.33812949640288 % --%>
    <div>전월대비 증가율: ${Math.round((monthtotal-prevmonthtotal)/prevmonthtotal *10000)/100 } %</div> 
</body>
</html>