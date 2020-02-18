<%@page import="com.spring.shop_project.SessionVO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String contextpath = request.getContextPath();
	String respath = request.getContextPath() + "/resources/";
%>
<%!public static String getrndnum(int loopcount) {
		String str = "";
		int d = 0;
		for (int i = 1; i <= loopcount; i++) {
			Random r = new Random();
			d = r.nextInt(9);
			str = str + Integer.toString(d);
		}
		return str;
	}%>
<%
	String num = getrndnum(5);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 추가</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<!-- Custom fonts for this template -->
<link href="<%=respath%>vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<%=respath%>css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="<%=respath%>vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js" integrity="sha384-FzT3vTVGXqf7wRfy8k4BiyzvbNfeYjK+frTVqZeNDFl8woCbF0CYG6g2fMEFFo/i" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function() {
  $('#modifying').click(function(e) {
	 //alert('test');
	  $("#product_input").submit();
  });
	
  $('#btn-upload1').click(function(e) {
    var formData = new FormData($("#uploadForm1")[0]);
    	
    // Ajax call for file uploaling
    var ajaxReq = $.ajax({
      url : '<%=contextpath+ "/upload" %>',
      type : 'POST',
      data : formData,
      cache : false,
      contentType : false,
      processData : false,
      xhr: function(){
        //Get XmlHttpRequest object
         var xhr = $.ajaxSettings.xhr() ;
        
        //Set onprogress event handler 
         xhr.upload.onprogress = function(event){
          	var perc = Math.round((event.loaded / event.total) * 100);
          	$('#progressBar1').text(perc + '%');
          	$('#progressBar1').css('width',perc + '%');
         };
         return xhr ;
    	},
    	beforeSend: function( xhr ) {
    		//Reset alert message and progress bar
    		$('#alertMsg1').text('');
    		$('#progressBar1').text('');
    		$('#progressBar1').css('width','0%');
              }
    });
  
    // Called on success of file upload
    ajaxReq.done(function(msg) {
      $('#alertMsg1').text(msg);
      $('#product_image').val(msg);

    });
    
    // Called on failure of file upload
    ajaxReq.fail(function(jqXHR) {
      $('#alertMsg1').text(jqXHR.responseText+'('+jqXHR.status+
        		' - '+jqXHR.statusText+')');
    });
  });
  
  $('#btn-upload2').click(function(e) {
	    var formData = new FormData($("#uploadForm2")[0]);
	    	
	    // Ajax call for file uploaling
	    var ajaxReq = $.ajax({
	      url : '<%=contextpath+ "/upload" %>',
	      type : 'POST',
	      data : formData,
	      cache : false,
	      contentType : false,
	      processData : false,
	      xhr: function(){
	        //Get XmlHttpRequest object
	         var xhr = $.ajaxSettings.xhr() ;
	        
	        //Set onprogress event handler 
	         xhr.upload.onprogress = function(event){
	          	var perc = Math.round((event.loaded / event.total) * 100);
	          	$('#progressBar2').text(perc + '%');
	          	$('#progressBar2').css('width',perc + '%');
	         };
	         return xhr ;
	    	},
	    	beforeSend: function( xhr ) {
	    		//Reset alert message and progress bar
	    		$('#alertMsg2').text('');
	    		$('#progressBar2').text('');
	    		$('#progressBar2').css('width','0%');
	              }
	    });
	  
	    // Called on success of file upload
	    ajaxReq.done(function(msg) {
	      $('#alertMsg2').text(msg);
	      $('#product_detail').val(msg);

	    });
	    
	    // Called on failure of file upload
	    ajaxReq.fail(function(jqXHR) {
	      $('#alertMsg2').text(jqXHR.responseText+'('+jqXHR.status+
	        		' - '+jqXHR.statusText+')');
	    });
	  });
});
</script>

<style>
.inputArea {
	margin: 20px
}
</style>
</head>
<body>
	<div class="card shadow mb-4">
		<form id=product_input action='<%=contextpath + "/admin/admin_product_insert"%>'
			method="post">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">상품 추가</h6>
			</div>
			<br>
			<div class="col mr-2">
				<div
					class="text-xs font-weight-bold text-primary text-uppercase mb-1">상품코드</div>
				<input type="text" id="product_id" name="product_id"
					class="form-control" value="<%=num%>"><br>
			</div>
			<div class="col mr-2">
				<div
					class="text-xs font-weight-bold text-primary text-uppercase mb-1">상품이름</div>
				<input type="text" id="product_name" name="product_name"
					class="form-control"><br>
			</div>
			<div class="col mr-2">
				<div
					class="text-xs font-weight-bold text-primary text-uppercase mb-1">상품가격</div>
				<input type="text" id="product_price" name="product_price"
					class="form-control"><br>
			</div>
			<div class="col mr-2">
				<div
					class="text-xs font-weight-bold text-primary text-uppercase mb-1">브랜드</div>
				<input type="text" id="product_brand" name="product_brand"
					class="form-control"><br>
			</div>
			<div class="col mr-2">
				<div
					class="text-xs font-weight-bold text-primary text-uppercase mb-1">카테고리</div>
				<input type="text" id="product_category" name="product_category"
					class="form-control"><br>
			</div>
			<div class="col mr-2">
				<div
					class="text-xs font-weight-bold text-primary text-uppercase mb-1">재고</div>
				<input type="text" id="product_balance" name="product_balance"
					class="form-control"><br>
			</div>
			<div class="col mr-2">
				<div
					class="text-xs font-weight-bold text-primary text-uppercase mb-1">판매량</div>
				<input type="text" id="product_sellcount" name="product_sellcount"
					value="0" class="form-control"><br>
			</div>
			<div class="col mr-2">
				<div
					class="text-xs font-weight-bold text-primary text-uppercase mb-1">출시일</div>
				<input type="text" id="product_release" name="product_release"
					class="form-control"><br>
			</div>
			<!-- <div class="col mr-2">
				<div
					class="text-xs font-weight-bold text-primary text-uppercase mb-1">할인율</div>
				<input type="text" id="sales_persent" name="sales_persent"
					class="form-control"><br>
			</div> -->
			<input type="hidden" id="product_image" name="product_image">
			<input type="hidden" id="product_detail" name="product_detail">
			
	</form>
		<div class="col mr-2">
			<!-- 이미지 출력 라벨 -->
			<div
				class="text-xs font-weight-bold text-primary text-uppercase mb-1">상품 이미지</div>
			<div class="inputArea">
				<form id="uploadForm1" enctype="multipart/form-data" method="POST" action='<%=contextpath + "/upload" %>'>
					<label for="files"></label> 
					<input multiple="multiple" type="file" id="files" name="files"> <br>
				</form>
					<div><input type="button" id="btn-upload1" value="파일 업로드 (복수 선택 가능)"></div>
					    <!-- Bootstrap Progress bar -->
			    <div class="progress">
			      <div id="progressBar1" class="progress-bar progress-bar-success" role="progressbar"
			        aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">0%</div>
			    </div>
			
			    <!-- Alert -->
			    <div id="alertMsg1" style="color: red;font-size: 18px;"></div>
			  </div>
								
				<!--  업로드 완료 후 DB에 경로 삽입 -->
				<div class="select_img1">
					<img src="" />
				</div>			
		
		<div class="col mr-2">
			<div
				class="text-xs font-weight-bold text-primary text-uppercase mb-1">상세 설명 이미지</div>
			<div class="inputArea">
				<form id="uploadForm2" enctype="multipart/form-data" method="POST" action='<%=contextpath + "/upload" %>'>
					<label for="files"></label> 
					<input multiple="multiple" type="file" id="files" name="files"> <br>

				</form>
					<div><input type="button" id="btn-upload2" value="파일 업로드 (복수 선택 가능)"></div>
					    <!-- Bootstrap Progress bar -->
			    <div class="progress">
			      <div id="progressBar2" class="progress-bar progress-bar-success" role="progressbar"
			        aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">0%</div>
			    </div>
			
			    <!-- Alert -->
			    <div id="alertMsg2" style="color: red;font-size: 18px;"></div>
			  </div>
				<div class="select_img2">
					<img src="" />
				</div>
			</div>
			<div class="col mr-2">
				<div
					class="text-xs font-weight-bold text-primary text-uppercase mb-1"></div>
				<div style="text-align: center;">
					<input type="button" id="modifying" name="modifying"
						class="btn btn-primary" value="저장">
				</div>
			</div>
	</div>
</body>
</html>