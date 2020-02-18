<%@page import="com.spring.shop_project.SessionVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String contextpath = request.getContextPath();
	String respath = request.getContextPath() + "/resources/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${productModifyPage.product_id }-${productModifyPage.product_name }</title>
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
<link
	href="<%=respath%>vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="card shadow mb-4">
		<form action='<%=contextpath + "/admin/admin_product_modify"%>'
			method="post">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">상품정보수정</h6>
			</div>
			<br>
			<div class="col mr-2">
				<div
					class="text-xs font-weight-bold text-primary text-uppercase mb-1">상품
					코드</div>
				<input type="text" id="product_id" name="product_id"
					class="form-control" value="${productModifyPage.product_id }"
					readonly="readonly"><br>
			</div>
			<div class="col mr-2">
				<div
					class="text-xs font-weight-bold text-primary text-uppercase mb-1">상품
					이름</div>
				<input type="text" id="product_name" name="product_name"
					class="form-control" value="${productModifyPage.product_name }"><br>
			</div>
			<div class="col mr-2">
				<div
					class="text-xs font-weight-bold text-primary text-uppercase mb-1">상품
					가격</div>
				<input type="text" id="product_price" name="product_price"
					class="form-control" value="${productModifyPage.product_price }"><br>
			</div>
			<div class="col mr-2">
				<div
					class="text-xs font-weight-bold text-primary text-uppercase mb-1">브랜드</div>
				<input type="text" id="product_brand" name="product_brand"
					class="form-control" value="${productModifyPage.product_brand }"><br>
			</div>
			<div class="col mr-2">
				<div
					class="text-xs font-weight-bold text-primary text-uppercase mb-1">카테고리</div>
				<input type="text" id="product_category" name="product_category"
					class="form-control" value="${productModifyPage.product_category }"><br>
			</div>
			<div class="col mr-2">
				<div
					class="text-xs font-weight-bold text-primary text-uppercase mb-1">재고</div>
				<input type="text" id="product_balance" name="product_balance"
					class="form-control" value="${productModifyPage.product_balance }"><br>
			</div>
			<div class="col mr-2">
				<div
					class="text-xs font-weight-bold text-primary text-uppercase mb-1">출시일</div>
				<input type="text" id="product_release" name="product_release"
					class="form-control" value="${productModifyPage.product_release }"><br>
			</div>
			<div class="col mr-2">
				<div
					class="text-xs font-weight-bold text-primary text-uppercase mb-1">할인율</div>
				<input type="text" id="sales_persent" name="sales_persent"
					class="form-control" value="${productModifyPage.sales_persent }"><br>
			</div>
			
			<!-- 이미지 출력 라벨 -->
			<div
				class="text-xs font-weight-bold text-primary text-uppercase mb-1">상품
				이미지</div>
			<div class="inputArea">
				<label for="product_image"></label> 
				<input type="file" id="product_image" name="product_image"> <br>
				<div class="select_img">
					<img src="" />
				</div>
				<script>
				${"#product_image"}.change(function(){
					if(this.files && this.files[0]){
						var reader =new FileReader;
						reader.onload = function(data){
							$(".select_img img").attr("src", data.target.result).width(500);
							}
						reader.readAsDataURL(this.files[0]);
						}
					});
				</script>
				<!-- 실제 저장 경로 / 서버에 업로드시 체크-->
				<%=request.getRealPath("/")%>
			</div>

			<div
				class="text-xs font-weight-bold text-primary text-uppercase mb-1">상세 설명 이미지</div>
			<div class="inputArea">
				<label for="product_detail"></label> 
				<input type="file" id="product_detail" name="product_detail"> <br>
				<div class="select_img">
					<img src="" />
				</div>
				<script>
				${"#product_detail"}.change(function(){
					if(this.files && this.files[0]){
						var reader =new FileReader;
						reader.onload = function(data){
							$(".select_img img").attr("src", data.target.result).width(500);
							}
						reader.readAsDataURL(this.files[0]);
						}
					});
				</script>
				<!-- 실제 저장 경로 -->
				<%=request.getRealPath("/")%>
			</div>
			
			<div class="col mr-2">
				<div
					class="text-xs font-weight-bold text-primary text-uppercase mb-1"></div>
				<div style="text-align: center;">
					<input type="submit" id="modifying" name="modifying"
						class="btn btn-primary" value="저장"><br>
				</div>
			</div>
		</form>
	</div>
</body>
</html>