<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ tablib prefix="sec" uri="http://www.springframework.org/security/tags" %> --%>
<% String respath = request.getContextPath() +"/resources/"; %>
<!DOCTYPE html>
<html>
<head>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Login</title>

<!-- Custom fonts for this template-->
<link href="<%=respath %>vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="<%=respath %>css/sb-admin-2.min.css" rel="stylesheet">
 
 <script src="https://code.jquery.com/jquery-3.4.1.js"   
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="   
	crossorigin="anonymous">
</script>
 
<!-- login logic -->
<script type="text/javascript">
	$(document).ready(function () {
		//추가필요항목
		//1.otpkey : 숫자만 입력가능하도록 수정
		
		if(<%=request.getAttribute("checked") %> == 1) { // signup에서 리턴
			alert("정상 등록되었습니다.");
		} else if (<%=request.getAttribute("checked") %> == 2) {
			alert("OTP 패스워드 틀림");
		} else if(<%=request.getAttribute("checked") %> == 3) {
			alert("비활성화 계정입니다. 관리자에게 문의바랍니다.");
		}
		
		$("#loginchk").on("click",function() {		
			if($("#admin_otpkey").val() == '' ) {
				$.ajax({
					url : '<%=request.getContextPath() + "/admin/loginchk" %>',
					data : {'admin_id' : $("#admin_id").val(), 'admin_password' : $("#admin_password").val() },
					type : 'POST',
					dataType : 'json',
					cache: false,
					success : function(data) {
							if(data.check == '0') {
								alert("아이디 또는 비밀번호가 잘못되었습니다.")
							} else {
								$("#otpcheck").css("display", "block").show( "fold", 1000 );
							}
					},
					error:function(err) {
						alert(err);
					}
				});
			} else {
				$("#form").submit();
			}
			
		});
	});
</script>
</head>

<body class="bg-gradient-primary">
  <div class="container">
    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">관리자 로그인</h1>
                  </div>
                  <form id="form" action='<%=request.getContextPath() + "/admin/login" %>' method="post" class="user">
                    <div class="form-group">
                      <input type="text" class="form-control form-control-user" id="admin_id" name="admin_id" aria-describedby="emailHelp" placeholder="아이디 입력">
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" id="admin_password" name="admin_password" placeholder="패스워드 입력">
                    </div>
					 <div class="form-group" id="otpcheck" style="display:none">
                      <input type="text" class="form-control form-control-user" id="admin_otpkey" name="admin_otpkey" placeholder="OTP 입력">
                    </div>
                    <input type="button" id="loginchk" class="btn btn-primary btn-user btn-block" value="로그인">
                    </form>
                    <hr>
                  <div class="text-center">
                    <a class="small" href='<%=request.getContextPath() + "/admin/signup" %>'>회원가입</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>

  </div>
  
  <!-- Bootstrap core JavaScript-->
  <script src="<%=respath %>vendor/jquery/jquery.min.js"></script>
  <script src="<%=respath %>vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="<%=respath %>vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="<%=respath %>js/sb-admin-2.min.js"></script>
  
</body>

</html>
