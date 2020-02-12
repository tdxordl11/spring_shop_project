<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	String contextpath = request.getContextPath();
	String respath = request.getContextPath() +"/resources/"; 
%>
<script src="https://code.jquery.com/jquery-3.4.1.js"   
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="   
	crossorigin="anonymous">
</script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
var count = 0;
$(document).ready(function () {
	$("#otp_gen").on("click",function() {
		$.ajax({
			url : '<%=contextpath + "/admin/otpGen" %>',
			type : 'GET',
			dataType : 'json',
			cache: false,
			success : function(data) {
						$("#admin_otpkey").val(data.otpkey);
			},
			error:function(err) {
				alert(err);
			}
		});
	});


	$("#otp_qrgen").on("click",function() {
				$.ajax({
					url : '<%=contextpath + "/admin/otpqrGen" %>',
					data : {'admin_otpkey' : $("#admin_otpkey").val(), 'admin_id' : $("#admin_id").val(), 'admin_address' : $("#admin_address").val() },
					type : 'GET',
					dataType : 'json',
					cache: false,
					success : function(data) {
							if(count==0) {
								$("#qrcode").append("<iframe style='width:210px; height:210px' src=" + data.qrcode +  "'></iframe><br><br>");
								count++;
							}
					},
					error:function(err) {
						alert(err);
					}
				});
				$("#qrcode").show( "fold", 1000 );
			});
});

		
</script>

<!-- contents start -->
<h1 class="h3 mb-2 text-gray-800">계정관리</h1>
<p class="mb-4"></p>
<!-- DataTales Example -->
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">관리자 계정관리</h6>
	</div>
	<form
		action='<%=contextpath + "/admin/main?menu=admin_manage_update"%>'
		method="post">
		<br>
		<div class="col mr-2">
			<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">아이디</div>
			<input type="text" id="admin_id" name="admin_id" class="form-control" value="${admindetail.admin_id }" readonly="readonly"><br>
		</div>
		<div class="col mr-2">
			<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">권한레벨</div>
			<input type="text" id="admin_authlevel" name="admin_authlevel" class="form-control" value="${admindetail.admin_authlevel }"><br>
		</div>
		<div class="col mr-2">
			<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">핸드폰번호</div>
			<input type="text" id="admin_phone" name="admin_phone" class="form-control" value="${admindetail.admin_phone }"><br>
		</div>
		<div class="col mr-2">
			<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">이메일</div>
			<textarea id="admin_address" name="admin_address" style="height: 170px" class="form-control">${admindetail.admin_address }</textarea>
			<br>
		</div>
		<div class="col mr-2">
			<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">이름</div>
			<input type="text" id="admin_name" name="admin_name" class="form-control" value="${admindetail.admin_name}"><br>
		</div>
		<div class="col mr-2">
			<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
				<div style="display: inline-block; width: 120px">GOOGLE OTP KEY</div>
				<div style="display: inline-block;">
					<input type="button" id="otp_gen" value="OTP 재발급" class="btn-sm btn-info pull-right"> 
					<input type="button" id="otp_qrgen" value="QR 코드 생성" class="btn-sm btn-info pull-right">
				</div>
			</div>
			<input type="text" id="admin_otpkey" name="admin_otpkey" class="form-control" value="${admindetail.admin_otpkey}"><br>
			<div id="qrcode"></div>
		</div>
		<div class="col mr-2">
			<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">계정활성화 여부</div>
			<input type="text" id="admin_active" name="admin_active" class="form-control" value="${admindetail.admin_active}"><br>
		</div>
		<div style="text-align: center;">
			<input type="submit" class="btn btn-primary" value="수정">
		</div>
	</form>
	<br>
</div>


<!-- contents end -->