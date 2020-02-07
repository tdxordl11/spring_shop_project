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
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	var chart_view_cnt = 0;
	
	if(chart_view_cnt == 0) {
		 $.ajax({
				url:'incomechart2',
				data:{ 'startdate' : $("#startDate").val() , 'enddate' : $("#endDate").val() } ,
				type:'get',
	 			dataType:'json',
				success:function(vo_data){
					//alert(vo_data[0].totaldayincome);
					// 구글 차트	  
					google.charts.load('current', {'packages':['corechart']});
					google.charts.setOnLoadCallback(drawChart);
							
					function drawChart() {
						var data = new google.visualization.DataTable();
						  data.addColumn('date', 'X');
						  data.addColumn('number', '총 판매금');
						  
						  
						var str = "";
						
						for(var i=0, count = 0;i<vo_data.length;i++,count++) {
							var before = vo_data[i].order_date.split(",");
							var after = before[0] + ","+ (before[1]-1)  + "," + before[2];
							str += "[new Date("+after+"),"+vo_data[i].totaldayincome+"]";
							if(i!=vo_data.length-1) {
								str += ",";
							}
						}
						
						eval("data.addRows(["+str+"])");
						  var options = {
						    hAxis: { //x축 이름
						      title: '날짜',
						     format: 'YYYY-MM-dd'
						      
						      
						    },
						    vAxis: { //y축 이름
						      title: '판매금',
						      format: '#,###원'
						    }
						  };

						  var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

						  chart.draw(data, options);
					}
				},
				error: function(err) {
					alert(err);
				}
				
			}); // ajax end
			
			chart_view_cnt++;
	}
	
	
	$("#searchbtn").on("click",function() {
		 $.ajax({
				url:'incomechart1',
				data:{ 'startdate' : $("#startDate").val() , 'enddate' : $("#endDate").val() } ,
				type:'post',
	 			dataType:'json',
				success:function(vo_data){
					//alert(vo_data[0].totaldayincome);
					// 구글 차트	  
					google.charts.load('current', {'packages':['corechart']});
					google.charts.setOnLoadCallback(drawChart);
							
					function drawChart() {
						var data = new google.visualization.DataTable();
						  data.addColumn('date', 'X');
						  data.addColumn('number', '총 판매금');
						  
						  
						var str = "";
						
						for(var i=0, count = 0;i<vo_data.length;i++,count++) {
							var before = vo_data[i].order_date.split(",");
							var after = before[0] + ","+ (before[1]-1)  + "," + before[2];
							str += "[new Date("+after+"),"+vo_data[i].totaldayincome+"]";
							if(i!=vo_data.length-1) {
								str += ",";
							}
						}
						eval("data.addRows(["+str+"])");
						  var options = {
						    hAxis: { //x축 이름
						      title: '날짜',
						     format: 'YYYY-MM-dd'
						      
						      
						    },
						    vAxis: { //y축 이름
						      title: '판매금',
						      format: '#,###원'
						    }
						  };

						  var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

						  chart.draw(data, options);
					}
				},
				error: function(err) {
					alert(err);
				}
				
			}); // ajax end
	});
		 
	// 달력
	 $.datepicker.setDefaults({
		    dateFormat: 'yy/mm/dd',
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		    showMonthAfterYear: true,
		    changeMonth: true,
		    changeYear: true,
		    showOn: "button",
		    buttonImage: "./images/calendar.gif",
		    buttonImageOnly: true,
		    showAnim:"slide",
		    yearSuffix: '년'
		  });

		  $(function() {
		    $("#startDate, #endDate").datepicker();
		  });
	
});
</script>
</head>
<body>
	<form autocomplete=off action="incomechart1" method="post">
	조회기간 :<input type="text" id="startDate" name="startdate"> ~
	<input type="text" id="endDate" name="enddate">
	<input type="button" value="조회" id="searchbtn"> 

    <div id="chart_div" style="width: 900px; height: 500px"></div>
</body>
</html>