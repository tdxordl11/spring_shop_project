<%@page import="java.util.List"%>
<%@page import="com.spring.shop_project.OrderVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String contextpath = request.getContextPath();
%>
<jsp:useBean id="nowdate" class="java.util.Date"/>
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
	var chart_view_cnt = 0;
	var year;
	var month;
	var gumun ="";
	var str = "";
	
	if(chart_view_cnt == 0) {
		$.ajax({
			url:'<%=contextpath%>/admin/piechart1',
			data:{'month' : '13월', 'year' : $("#year option:selected").val()}, 
			type:'get',
			dataType:'json',
			success:function(vo_data){

				// 구글 차트
				google.charts.load('current', {'packages':['corechart']});
				google.charts.setOnLoadCallback(drawChart);
	
			    function drawChart() {
		
						for(var i=0;i<vo_data.length;i++) {
							str += "['" +vo_data[i].product_name +"',"+ vo_data[i].monthincomeperproduct+"]";
							if(i!=vo_data.length-1) {
								str += ",";
							}
						}
						  //alert(str);
						  /* var data = google.visualization.arrayToDataTable([ ['product_name' , 'monthincomeperproduct'],
								eval(str)
					        ]);  */
						  
						var data = eval("google.visualization.arrayToDataTable([ ['product_name' , 'monthincomeperproduct']," + str + " ]);");

					// 차트 옵션부분
			      if( <%= "'"+request.getParameter("month")+"'" %> == null || <%= "'"+request.getParameter("month")+"'" %> == 'null' ) {
			 			str2 = new Date().getMonth()+1 +' 월' ;
			 		} else {
			 			str2 =  <%= "'"+request.getParameter("month")+"'" %> ;
			 		}
			      
				      var options = {
				        title: '[ ' +str2+ ' 인기 상품의 매출 비율 ]' ,
				        is3D: true,
				        sliceVisibilityThreshold: .05 // 20% 이하는 기타로 묶어주는 용도
				      };
				
				      var chart = new google.visualization.PieChart(document.getElementById('piechart'));
				
				      chart.draw(data, options);
					  chart_view_cnt++;
					  str="";
			    }
				
			},
			error: function(err) {
				alert(err);
			}
				
		}); // ajax end
		
	}
	
	
	//change
	$("#year").change(function(){
		$("#month").change(function(){
			var month = $("#month option:selected").val();
			var year = $("#year option:selected").val();
			
			$.ajax({
				url:'<%=contextpath%>/admin/piechart1',
				data:{ 'month' : $("#month option:selected").val(), 'year' : $("#year option:selected").val()} ,
				type:'get'    ,
	 			datatype:'json'   ,
				success:function(vo_data){
					//alert(vo_data);
					// 구글 차트
					google.charts.load('current', {'packages':['corechart']});
					google.charts.setOnLoadCallback(drawChart);

				    function drawChart() {
			
							for(var i=0;i<vo_data.length;i++) {
								str += "['" +vo_data[i].product_name +"',"+ vo_data[i].monthincomeperproduct+"]";
								if(i!=vo_data.length-1) {
									str += ",";
								}
							}
							var data = eval("google.visualization.arrayToDataTable([ ['product_name' , 'monthincomeperproduct']," + str + " ]);");

						// 차트 옵션부분
				      if( <%= "'"+request.getParameter("month")+"'" %> == null || <%= "'"+request.getParameter("month")+"'" %> == 'null' ) {
				 			str2 = new Date().getMonth()+1 +' 월' ;
				 		} else {
				 			str2 =  <%= "'"+request.getParameter("month")+"'" %> ;
				 		}
				      
					      var options = {
					        title: '[ ' +str2+ ' 인기 상품의 매출 비율 ]' ,
					        is3D: true,
					        sliceVisibilityThreshold: .05 // 20% 이하는 기타로 묶어주는 용도
					      };
					
					      var chart = new google.visualization.PieChart(document.getElementById('piechart'));
					
					      chart.draw(data, options);
					      str="";
				    }
				},
				error: function(err) {
					alert(err);
				}
				
			}); // ajax end
			 
		}); // month change 함수 end
		
	});//  year change 함수 end
	
		  
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
	<option>2016</option>
	<option>2017</option>
	<option>2018</option>
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
    <div id="piechart" style="width: auto; height: 250px;"></div>
</body>
</html>