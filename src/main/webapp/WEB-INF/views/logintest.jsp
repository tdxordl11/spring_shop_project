<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" ></script>
<style type="text/css">
   html, body
{
    height: 100%;
}

body
{
    display: table;
    margin: 0 auto;
}

.container
{
    height: 100%;
    display: table-cell;
    vertical-align: middle;
}

.main
{
    height: 200px;
    width: 200px;     
}

</style>
<script>
   $(document).ready(function() {
// 	   $(location).attr('href', 'http://localhost:8081/shop_project/login');
var login = '${login_failed}';
if(login!=""){
	 alert(login);
	 login="";
}
   });
   
  
</script>
				 <script>
   function chk_login(){
     var ft=document.login2;
     if(ft.user_id.value==""){
       alert('아이디를 입력해 주세요');
       ft.user_id.focus();
       return false;
     }
     if(ft.user_password.value==""){
      alert('비밀번호를 입력해 주세요');
      ft.user_password.focus();
      return false;
     }

     ft.submit();
   }
   </script>
</head>
<body>
<!-- <body onload="document.login2.user_id.focus();"> -->
<table cellpadding="0" cellspacing="0" align="center" border="0" width="100%">
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" align="center" border="0" width="80%">
				<!--<form name=login2 method=get action="/member/member_login_ps.html">-->
				<form name=login2 method=post action='<%=request.getContextPath() + "/user_login" %>'>
				<tr>
					<td align="center" height="50"></td>
				</tr>
				<tr>
					<td align="center"><input name="user_id" type="text" style="border-top: #cccccc 1px solid; border-bottom: #cccccc 1px solid; border-left: #cccccc 1px solid; border-right: #cccccc 1px solid; max-width: 400px; width: 100%; height:50px; text-indent: 20;" placeholder="아이디"></td>
				</tr>
				<tr>
					<td align="center" height="20"></td>
				</tr>
				<tr>
					<td align="center"><input name="user_password" type="password" style="border-top: #cccccc 1px solid; border-bottom: #cccccc 1px solid; border-left: #cccccc 1px solid; border-right: #cccccc 1px solid; max-width: 400px; width: 100%; height:50px; text-indent: 20;" placeholder="비밀번호" autocomplete="on"></td>
				</tr>
				<tr>
					<td align="center" height="20"></td>
				</tr>
				<tr>
					<td align="center" height="50"><button type="button" style="border-top: #3f3f3f 1px solid; border-bottom: #3f3f3f 1px solid; border-left: #3f3f3f 1px solid; border-right: #3f3f3f 1px solid; background: #3f3f3f; max-width: 400px; width: 100%; height:50px;" onclick="chk_login()" ;=""><span style="font-family: Noto Sans KR, sans-serif; font-weight: 400; font-size: 11pt; color: #fff;">로그인</span></button></td>
				</tr>

				<tr>
					<td align="center" height="20"></td>
				</tr>
				<tr>
					<td align="center">
	
						<div id="naver_id_login"><a href="${naverURL}" onclick="window.open(this.href, 'naverloginpop', 'titlebar=1, resizable=1, scrollbars=yes, width=600, height=550'); return false" id="naver_id_login_anchor"><img src="http://static.nid.naver.com/oauth/big_g.PNG" border="0" title="네이버 아이디로 로그인" width="370px" height="80px"></a> </div>
 <a href="https://kauth.kakao.com/oauth/authorize?client_id=eb4186f5fb71a201dcbc9a8d9ae2a4ff&redirect_uri=http://localhost:8081/shop_project/kakao_login&response_type=code" onclick="window.open(this.href, 'naverloginpop', 'titlebar=1, resizable=1, scrollbars=yes, width=600, height=550'); return false">
            <img src="https://developers.kakao.com/assets/img/about/logos/kakaologin/kr/kakao_account_login_btn_medium_narrow.png">
        </a>
						
					</td>
				</tr>
				<tr>
					<td align="center" height="20"></td>
				</tr>
				<tr>
					<td align="center"><a href="/member/member_join.html"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">회원가입　ㅣ　</span></a>
<!---------------------소리샵처럼 팝업형식으로 처리------------------------->
					<a href="/member/search/search.html"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">ID/PW 찾기　ㅣ　</span></a>
<!---------------------소리샵처럼 팝업형식으로 처리------------------------->
					<a href="/order/delivery_search.html"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">주문조회</span></a>
					</td>
				</tr>
				<tr>
					<td align="center" height="50"></td>
				</tr>
				</form>
			</table>
		</td>
	</tr>
</table>


<!-- <div class="container"> -->
<!--     <div class="main"> -->
<!-- 			<form action="/shop_project/login" method=post> -->
<!-- 				<div id=loginform> -->
<!-- 					<h3 style="text-align: center;">로그인</h3> -->
<!-- 					<div class="form-group"> -->
<!-- 						<label for="exampleInputId1">ID</label> <input type="text" -->
<!-- 							class="form-control" placeholder="아이디" name="user_id" -->
<!-- 							maxlength="20"> -->
<!-- 					</div> -->
<!-- 					<div class="form-group"> -->
<!-- 						<label for="exampleInputPassword1">Password</label> <input -->
<!-- 							type="password" class="form-control" id="exampleInputPassword1" -->
<!-- 							placeholder="Password" name="user_password"> -->
<!-- 					</div> -->
<!-- 					<div class="checkbox"> -->
<!-- 						<label> <input type="checkbox"> 아이디 저장 -->
<!-- 						</label> -->
<!-- 					</div> -->
<!-- 					<button type="submit" class="btn btn-success btn-block">로그인</button> -->
<!-- 				</div> -->
<!-- 			</form> -->
<%-- <c:if test="${currentUser eq null or userId eq null}"> --%>
<!--  <div>  -->
<!--  <div></div> -->
<%--      <a href="${naverURL}"> --%>
<!--      <img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a> -->
     
<!--      <a href="https://kauth.kakao.com/oauth/authorize?client_id=eb4186f5fb71a201dcbc9a8d9ae2a4ff&redirect_uri=http://localhost:8081/shop_project/kakao_login&response_type=code"> -->
<!--             <img src="https://developers.kakao.com/assets/img/about/logos/kakaologin/kr/kakao_account_login_btn_medium_narrow.png"> -->
<!--         </a> -->
<!--   </div> -->
<%--   </c:if> --%>
  
  <c:if test="${currentUser ne null}">
  <div>
    <h3>이 부분은 로그인한 사용자한테만 보임</h3>
	  ${currentUser }<br>
	  for naver
    <a href="http://localhost:8081/shop_project/getProfile?accessToken=${currentAT}">Get User's Profile</a>
    <a href="http://localhost:8081/shop_project/refreshToken?refreshToken=${currentRT}">Refresh Token</a>
    <a href="http://localhost:8081/shop_project/deleteToken?accessToken=${currentAT}">Delete Token (연동해제)</a>
    <a href="http://localhost:8081/shop_project/invalidate">로그아웃 (Invalidate Session)</a>
    </div>
    </c:if>
    <c:if test="${userId ne null }">
    ${userId }로 연결되어있습니다.<br>
    <div>for kakao
<!--     <a href="https://accounts.kakao.com/logout?continue=https://accounts.kakao.com/weblogin/account"> -->
    <input type="button" value="카카오 로그아웃" onclick="location.href='/shop_project/kakao_logout'">
<!--     </a> -->
    <input type="button" value="카카오 연동해제" onclick="location.href='/shop_project/kakao_unlink'">
    <input type="button" value="카카오페이 테스트" onclick="window.open('/shop_project/kakao_pay', 'naverloginpop', 'titlebar=1, resizable=1, scrollbars=yes, width=600, height=550'); return false">
  </div>
  </c:if>
</body>
</html>