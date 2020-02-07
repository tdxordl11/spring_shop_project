<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String respath = request.getContextPath() +"/resources/"; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Register</title>

<!-- Custom fonts for this template-->
<link href="<%=respath %>vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="<%=respath %>css/sb-admin-2.min.css" rel="stylesheet">

<!-- admin signup logic -->
<script src="https://code.jquery.com/jquery-3.4.1.js"   
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="   
	crossorigin="anonymous">
</script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	//추가필요항목
	//1. 패스워드 체크 (2번)
	//2. 미입력항목 입력하도록 수정
	var count = 0;
	var id_check = false;
	$(document).ready(function () {
		
		$("#signup_btn").on("click",function(e) { 
			if(id_check == true) {
				e.preventDefault();
				alert("중복된 아이디 입니다.");
			}
		});
		
		$("#otp_qrgen").on("click",function() {
			$.ajax({
				url : '<%=request.getContextPath() + "/admin/otpqrGen" %>',
				data : {'admin_otpkey' : $("#admin_otpkey").val(), 'admin_id' : $("#admin_id").val(), 'admin_address' : $("#admin_address").val() },
				type : 'GET',
				dataType : 'json',
				cache: false,
				success : function(data) {
						if(count==0) {
							$("#qrcode").append("<iframe style='width:210px; height:210px' src=" + data.qrcode +  "'></iframe><hr>");
							count++;
						}
				},
				beforeSend:function(){
					 $('#wrap-loading').css("display", "block");
			    },complete:function(){
			    	 $('#wrap-loading').css("display", "none");
			    },
				error:function(err) {
					alert(err);
				}
			});
			$("#qrcode").show( "fold", 1000 );
		});
		
		$("#admin_id").keyup(function() {
			$.ajax({
				url : '<%=request.getContextPath() + "/admin/adminidcheck" %>',
				data : {'admin_id' : $("#admin_id").val() },
				type : 'GET',
				dataType : 'json',
				success : function(data) {
					if( data.check == 0 ) {
						id_check = false;
						$("#id_check").html("존재하지 않는 아이디입니다.").css("color", "green");
					} else {
						id_check = true;
						$("#id_check").html("존재하는 아이디 입니다").css("color", "red");
					}
				},
				error:function(err) {
					alert(err);
				}
			});
		});
	});
</script>
</head>
<body class="bg-gradient-primary">
  <div class="container">
    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">관리자 회원가입</h1>
              </div>
               <form action=<%=request.getContextPath() + "/admin/signup" %> method="POST" class="user">
	                <div class="form-group">
	                   <input type="text" class="form-control form-control-user" id="admin_id" name="admin_id" placeholder="아이디">
	                </div>
	                <div id='id_check' style="font-size: 5px; padding-bottom: 7px; padding-left: 10px"></div>
	                 <div class="form-group">
	                   <input type="password" class="form-control form-control-user" id="admin_password" name="admin_password" placeholder="비밀번호">
	                </div>
	                 <div class="form-group">
	                   <input type="text" class="form-control form-control-user" id="admin_name" name="admin_name" placeholder="이름">
	                </div>
	                 <div class="form-group">
	                   <input type="phone" class="form-control form-control-user" id="admin_phone" name="admin_phone" placeholder="연락처">
	                </div>
	                 <div class="form-group">
	                   <input type="email" class="form-control form-control-user" id="admin_address" name="admin_address" placeholder="이메일">
	                </div>
	                <hr>
	                <label for="admin_otpkey" style='width: 150px' >GOOGLE OTP KEY</label>
	                	<div style="display: inline-block">
	                		<input type="button" id="otp_qrgen" value="QR 코드 생성" class="btn-sm btn-info pull-right">
	                	</div>
	                <div class="form-group">
	                 	<input type="text" class="form-control form-control-user" id="admin_otpkey" name="admin_otpkey" value='<%=request.getAttribute("otpkey") %>'>
	                </div>
	                <div id="qrcode" style='display:none'>
			         	 <div id="wrap-loading">
			         	 	<img src='<%=request.getContextPath() + "/resources/loadingimg.gif" %>' />
			         	 </div>
		             </div>
		             
	         	<input type="submit" id="signup_btn" class="btn btn-primary btn-user btn-block" value="회원가입">
                </form>
          </div>
        </div>
      </div>
    </div>

  </div>

  <!-- Bootstrap core JavaScript-->
<%--   <script src="<%=respath %>vendor/jquery/jquery.min.js"></script> --%>
  <script src="<%=respath %>vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="<%=respath %>vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="<%=respath %>js/sb-admin-2.min.js"></script>

</body>

</html>
