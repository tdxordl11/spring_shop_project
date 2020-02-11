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
	var year;
	var month;
	var str;
	
	 /* if(month == undefined) {
		var today = new Date();
		var month = today.getMonth()+1; */
		
	/* 	$.ajax({
			url:'piechart',
			data:{ 'month' : $("#month option:selected").val() } ,
			type:'get'    ,
 			datatype:'json'   ,
			success:function(data){
				drawChart();
				//month=1;
			},
			error: function(err) {
				alert(err);
			}
			
		}); */ // ajax end
		
	//}  
	
	//change
	$("#year").change(function(){
		$("#month").change(function(){
			var month = $("#month option:selected").val();
			var year = $("#year option:selected").val();
			location.replace("/shop_project/piechart?month="+month+"&year="+year);
			
			$.ajax({
				url:'piechart',
				data:{ 'month' : $("#month option:selected").val(), 'year' : $("#year option:selected").val()} ,
				type:'get'    ,
	 			datatype:'json'   ,
				success:function(){
					drawChart();
				},
				error: function(err) {
					alert(err);
				}
				
			}); // ajax end
			 
		}); // month change 함수 end
		
	});//  year change 함수 end
	
	
	
	//구글 파이 차트
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	
	
    function drawChart() {

      var data = google.visualization.arrayToDataTable([
    	  
    	  <%
			List<OrderVO> list =  (List<OrderVO>)request.getAttribute("monthshare");
		  	int chk = 0;
		  	
		  	out.print("['product_id' , 'Monthincomeperproduct'] ,");
			for(OrderVO vo : list) {
			  	
				out.print("['" + vo.getProduct_id() + "', "  + vo.getMonthincomeperproduct()+ "]");

				if(chk!=list.size()-1) {
					out.print(",");
				} 
				chk++;
				
			}  
		%>
		
      ]);

      if( <%= "'"+request.getParameter("month")+"'" %> == null || <%= "'"+request.getParameter("month")+"'" %> == 'null' ) {
 			str = new Date().getMonth()+1 +' 월' ;
 		} else {
 			str =  <%= "'"+request.getParameter("month")+"'" %> ;
 		}
      
	      var options = {
	        title: '[ ' +str+ ' 인기 상품의 매출 비율 ]' ,
	        is3D: true,
	        sliceVisibilityThreshold: .2 // 20% 이하는 기타로 묶어주는 용도
	      };
	
	      var chart = new google.visualization.PieChart(document.getElementById('piechart'));
	
	      chart.draw(data, options);
    }
		  
	
});
</script>
</head>
<body>
<form>
<%-- <select id=year name=year>
	<option selected>년도 선택</option>
	<c:forEach begin="2010" end="2030" step="1" var = i items="${2010-2030 }">
		<option value="${i }"></option>
	</c:forEach>

</select> --%>
<select id=year name=year>
	<option selected>년도선택</option>
	<option>2019</option>
	<option>2020</option>
</select>
	

<select id=month name=month>
	<option selected>월선택</option>
	<option>1월</option>
	<option>2월</option>
	<option>3월</option>
	<option>4월</option>
	<option>5월</option>
	<option>6월</option>
	<option>7월</option>
	<option>8월</option>
	<option>9월</option>
	<option>10월</option>
	<option>11월</option>
	<option>12월</option>
</select>
</form>
    <div id="piechart" style="width: 900px; height: 500px;"></div>
    <div>총액: ${monthtotal} 원</div>
</body>
</html>