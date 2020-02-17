<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" ></script>
<script>


$(document).ready(function(){
	if(!'${kakaoId}'.isEmpty){
		$("#token").val('${kakaoId}');
	}
	
	if(!'${useremail}'.isEmpty){
		$("#mail1").val('${useremail}');
	}
	
	/*
	이메일 인증 버튼 클릭시 발생하는 이벤트
	*/
	$(document).on("click", "#emailBtn", function(){
	/* 이메일 중복 체크 후 메일 발송 비동기 처리 */
	if(!$("#mail1").val()){
		alert('email을 입력해 주세요');
		$("#mail1").focus();
		return false;
	
	}
	$("#emailAuth").attr('style', 'display: inline; background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 100px; width: 100%; height:30px;');
	$("#emailAuth").focus();
		$.ajax({
			beforeSend: function(){
// 	loadingBarStart();
			},
			type:"get",
			url : "<%=request.getContextPath() + "/emailcheck" %>",
			data : "userEmail=" + $("#mail1").val() + "&random=" + $("#random").val(),
	//data: "userEmail="+encodeURIComponent($('#userEmail').val()),
	/* encodeURIComponent
	예를들어, http://a.com?name=egoing&job=programmer 에서 &job=programmer
	중 '&'는 하나의 파라미터가 끝나고 다음 파라미터가 온다는 의미이다.
	그런데 다음과 같이 job의 값에 &가 포함된다면 시스템은 job의 값을 제대로 인식할수 없게 된다. */
			success : function(data){
				alert("요청한 이메일 주소로 인증번호를 보냈습니다. 인증번호를 입력해주세요.")
				},
			error: function(data){
			alert("에러가 발생했습니다.");
				return false;
				}
			})
		})
	/*
	이메일 인증번호 입력 후 인증 버튼 클릭 이벤트
	*/
	$(document).on("click", "#emailAuthBtn", function(){
		$.ajax({
			beforeSend: function(){
// 	loadingBarStart();
			},
			type:"get",
			url:"<%=request.getContextPath() + "/emailAuth" %>",
			data:"authCode=" + $('#emailAuth').val() + "&random=" + $("#random").val(),
			success:function(data){
				if(data=="complete"){
					alert("인증이 완료되었습니다.");
					
				}else if(data == "false"){
					alert("인증번호를 잘못 입력하셨습니다.")
					}
				},
			complete: function(){
// 	loadingBarEnd();
				},
			error:function(data){
			alert("에러가 발생했습니다.");
				}
			});
		});
	
	$("#id").keyup(function() {
		$.ajax({
			url : '<%=request.getContextPath() + "/useridcheck" %>',
			data : {'user_id' : $("#id").val() },
			type : 'GET',
			dataType : 'json',
			success : function(data) {
				if( data.check == 0 ) {
					id_check = false;
					$("#id_check").html("사용 가능한 아이디입니다.").css("color", "green");
				} else {
					id_check = true;
					$("#id_check").html("사용 불가능한 아이디 입니다").css("color", "red");
				}
			},
			error:function(err) {
				alert(err);
			}
		});
	});
	});
	
</script>
<script>
function chk_mail(mail) {
	  if ((mail.indexOf ('@', 0) == -1) || mail.indexOf('.') == -1)
	    return false;
	  else
	    return true;
	}

	function ckform2(){
		var f = document.register;
		f.phone.value = f.cellpager1.value + f.cellpager2.value + f.cellpager3.value;
		f.fulladdress.value = f.zipcode.value + "-" + f.address.value + "-" + f.address_ADD.value;
		if(!f.id.value){
			alert('아이디를 입력해 주세요');
			f.id.focus();
			return false;
		}
	  
	   if(f.id.value.length<4 || f.id.value.length>60) {
			alert('아이디는 4~60자의 영문,숫자로만 입력해 주세요');
			f.id.focus();
			return false;
		}

		if(!f.password.value){
			alert('비밀번호를 입력해 주세요');
			f.password.focus();
			return false;
		}

	    if(f.password.value.length<6 ||f.password.value.length>12) {
			alert('비밀번호는 6~12자로 입력해주세요');
			f.password.focus();
			return false;
		}

		if(!f.password2.value){
			alert('비밀번호확인 입력을 해주세요');
			f.password2.focus();
			return false;
		}

	    if(f.password.value!=f.password2.value){
			alert("입력하신 비밀번호가 일치하지 않습니다!");
			f.password2.focus();
			return false;
		}

		if(!f.address_ADD.value){
			alert('주소를 입력해 주세요');
			return false;
		}
		
		if(!f.cellpager1.value || !f.cellpager2.value || !f.cellpager3.value ){
			alert('연락처를 입력해 해주세요');
			return false;
		}
		
		

		
		//if(!f.mail1.value || !f.mail2.value){
		//	alert('이메일을 입력해 주세요');
		//	f.mail1.focus();
		//	return false;
	    //}
		/*
		/
		else{
		   if(!chk_mail(f.mail.value)){
			 alert('이메일 형식이 잘못 되었습니다.');
			 f.mail.focus();
			 return false;
		   }
	    }	
		*/
	   
	    //if(confirm('ok')){
		 f.submit();
	    //}
		
	}
	</script>


<body>
<table cellpadding="0" cellspacing="0" align="center" border="0" width="100%">
	<tr>
		<td height="50" align="center"></td>
	</tr>
	<tr>
		<td align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 20pt; color:#000;">회원 가입</span>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 13pt; color:#000;"><br>Create Account</span></td>
	</tr>
</table>
<div id="main" class="join">
      <div class="row">	
<table cellpadding="0" cellspacing="0" align="center" border="0" width="80%">
<form name="register" method="post" action=<%=request.getContextPath() + "/signup" %> >
<!-- <input type=hidden name="id_check_pass"> -->
<!-- <input type=hidden name="mem_mode" value="member_join"> -->
<!-- <input type="hidden" name=di value="MC0GCCqGSIb3DQIJAyEAtXyMObs8lKh421PLs+9A1Ks/oR4ziybY6MPLh/pAWX4="> -->
<!-- <input type="hidden" name=ssn1 value="생년월일"> -->
<!-- <input type="hidden" name=name value="이름"> -->
	 <input type="hidden" name="user_address" id="fulladdress" >
	 <input type="hidden" name="user_phone" id="phone" >
	 <input type="hidden" name="user_token" id="token" >
	<tr>
		<td height="50"></td>
	</tr>
	<tr>
		<td>
        <div class="grid_17">
			<table cellpadding="0" cellspacing="0" align="center" border="0" width="100%" height="50" bgcolor="f5f5f5">
				<tr>
					<td width="10%"></td>
					<td>
						<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">아이디 [필수]</span>
					</td>
				</tr>
			</table>
		</div>
        <div class="grid_18">
			<table cellpadding="0" cellspacing="0" width="100%" align="center" border="0" height="50" bgcolor="f9f9f9">
				<tr>
					<td width="10%"></td>
					<td>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input name="user_id" id="id" type="text" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 150px; width: 100%; height:30px;" placeholder="입력" maxlength=60></span>
<a href="javascript:id_check()"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 9pt; color:#ff0000;">　중복확인</span></a>
<div id='id_check' style="font-size: 4px; padding-bottom: 1px; padding-left: 10px"></div>

					</td>
				</tr>
			</table>
		</div>
		</td>
	</tr>
	<tr>
		<td height="20"></td>
	</tr>
	<tr>
		<td>
        <div class="grid_17">
			<table cellpadding="0" cellspacing="0" align="center" border="0" width="100%" height="50" bgcolor="f5f5f5">
				<tr>
					<td width="10%"></td>
					<td>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">비밀번호 [필수]</span>
					</td>
				</tr>
			</table>
		</div>
        <div class="grid_18">
			<table cellpadding="0" cellspacing="0" width="100%" align="center" border="0" height="50" bgcolor="f9f9f9">
				<tr>
					<td width="10%"></td>
					<td>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input name="user_password" id="password" type="password" maxlength=12 style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 200px; width: 100%; height:30px;" placeholder="입력"></span>
					</td>
				</tr>
			</table>
		</div>
		</td>
	</tr>
	<tr>
		<td height="20"></td>
	</tr>
	<tr>
		<td>
        <div class="grid_17">
			<table cellpadding="0" cellspacing="0" align="center" border="0" width="100%" height="50" bgcolor="f5f5f5">
				<tr>
					<td width="10%"></td>
					<td>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">비밀번호 확인 [필수]</span>
					</td>
				</tr>
			</table>
		</div>
        <div class="grid_18">
			<table cellpadding="0" cellspacing="0" width="100%" align="center" border="0" height="50" bgcolor="f9f9f9">
				<tr>
					<td width="10%"></td>
					<td>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input name="password2" type="password" maxlength=12  style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 200px; width: 100%; height:30px;" placeholder="입력"></span>
					</td>
				</tr>
			</table>
		</div>
		</td>
	</tr>
	<tr>
		<td height="20"></td>
	</tr>
	<tr>
		<td>
        <div class="grid_17">
			<table cellpadding="0" cellspacing="0" align="center" border="0" width="100%" height="50" bgcolor="f5f5f5">
				<tr>
					<td width="10%"></td>
					<td>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">이름</span>
					</td>
				</tr>
			</table>
		</div>
        <div class="grid_18">
			<table cellpadding="0" cellspacing="0" width="100%" align="center" border="0" height="50" bgcolor="f9f9f9">
				<tr>
					<td width="10%"></td>
					<td>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input name="user_name" type="text" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 150px; width: 100%; height:30px;" placeholder="입력" maxlength=60></span>						
				</td>
				</tr>
			</table>
		</div>
		</td>
	</tr>
	<tr>
		<td height="20"></td>
	</tr>
	<tr>
		<td>
		
		
		<div class="grid_17">
			<table cellpadding="0" cellspacing="0" align="center" border="0" width="100%" height="50" bgcolor="f5f5f5">
				<tr>
					<td width="10%"></td>
					<td>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">이메일 </span>
					</td>
				</tr>
			</table>
		</div>
        <div class="grid_18">
			<table cellpadding="0" cellspacing="0" width="100%" align="center" border="0" height="50" bgcolor="f9f9f9">
				<tr>
					<td width="10%"></td>
					<td>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input name="user_email" id="mail1" type="email" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 200px; width: 100%; height:30px;" placeholder=""></span>
<!-- &nbsp;@&nbsp; -->
<!-- <span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input name="mail2" id="mail2" type="text" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 100px; width: 100%; height:30px;" placeholder=""></span> -->
					<button type="button" class="btn btn-info" id="emailBtn">이메일 발송</button>
					<input type="text" path="emailAuth" id=emailAuth value="" style="display: none; background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 100px; width: 100%; height:30px;"/>
					<button type="button" class="btn btn-info" id="emailAuthBtn">이메일 인증</button>
					<input type="hidden" path="random" id="random" value="${random }" />
					</td>
				</tr>
			</table>
		</div>
		</td>
	</tr>
	<tr>
		<td height="20"></td>
	</tr>
	<tr>
		<td>
		
        <div class="grid_17">
			<table cellpadding="0" cellspacing="0" align="center" border="0" width="100%" height="50" bgcolor="f5f5f5">
				<tr>
					<td width="10%"></td>
					<td>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">주소 [필수]</span>
					</td>
				</tr>
			</table>
		</div>
        <div class="grid_18">
			<table cellpadding="0" cellspacing="0" width="100%" align="center" border="0" height="150" bgcolor="f9f9f9">
				<tr>
					<td width="10%"></td>
					<td>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input name="zipcode" id="zipcode" type="text" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 150px; width: 100%; height:30px;" placeholder="우편번호"></span><a href="javascript:openDaumPostcode('zipcode','address','address_ADD')" style="text-decoration:none"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 9pt; color:#ff0000;">주소 검색</span></a>
<div id="layer" style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>
					</td>
				</tr>
				<tr>
					<td width="10%"></td>
					<td>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input name="address" id="address" maxlength=200 type="text" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 200px; width: 100%; height:30px;" placeholder="주소"></span>
					</td>
				</tr>
				<tr>
					<td width="10%"></td>
					<td>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input  name="address_ADD" id="address_ADD"  maxlength=300 type="text" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 200px; width: 100%; height:30px;" placeholder="상세주소"></span>
					</td>
				</tr>
			</table>
		</div>
		</td>
	</tr>
	<tr>
		<td height="20"></td>
	</tr>
	<tr>
		<td>
        <div class="grid_17">
			<table cellpadding="0" cellspacing="0" align="center" border="0" width="100%" height="50" bgcolor="f5f5f5">
				<tr>
					<td width="10%"></td>
					<td>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">연락처 [필수]</span>
					</td>
				</tr>
			</table>
		</div>
        <div class="grid_18">
			<table cellpadding="0" cellspacing="0" width="100%" align="center" border="0" height="50" bgcolor="f9f9f9">
				<tr>
					<td width="10%"></td>
					<td>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input name="cellpager1"  maxlength=4 type="text" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 80px; width: 100%; height:30px;" placeholder="01X" onchange="comm_only_num(this)"></span>&nbsp;-&nbsp;
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input name="cellpager2"  maxlength=4 type="text" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 80px; width: 100%; height:30px;" placeholder="1234" onchange="comm_only_num(this)"></span>&nbsp;-&nbsp;
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input name="cellpager3"  maxlength=4 type="text" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 80px; width: 100%; height:30px;" placeholder="5678" onchange="comm_only_num(this)"></span>
					</td>
				</tr>
			</table>
		</div>
		</td>
	</tr>
	<tr>
		<td height="20"></td>
	</tr>
<!-- 	<tr> -->
<!-- 		<td> -->
<!--         <div class="grid_17"> -->
<!-- 			<table cellpadding="0" cellspacing="0" align="center" border="0" width="100%" height="50" bgcolor="f5f5f5"> -->
<!-- 				<tr> -->
<!-- 					<td width="10%"></td> -->
<!-- 					<td> -->
<!-- <span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">기타 연락처 [선택]</span> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 		</div> -->
<!--         <div class="grid_18"> -->
<!-- 			<table cellpadding="0" cellspacing="0" width="100%" align="center" border="0" height="50" bgcolor="f9f9f9"> -->
<!-- 				<tr> -->
<!-- 					<td width="10%"></td> -->
<!-- 					<td> -->
<!-- <span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input name="hometel1" maxlength=4 type="text" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 80px; width: 100%; height:30px;" placeholder=""  onchange="comm_only_num(this)"></span>&nbsp;-&nbsp; -->
<!-- <span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input name="hometel2" maxlength=4 type="text" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 80px; width: 100%; height:30px;" placeholder=""  onchange="comm_only_num(this)"></span>&nbsp;-&nbsp; -->
<!-- <span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input name="hometel3" maxlength=4 type="text" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 80px; width: 100%; height:30px;" placeholder=""  onchange="comm_only_num(this)"></span> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 		</div> -->
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td height="20"></td> -->
<!-- 	</tr> -->
	<tr>
		<td>
        
		</td>
	</tr>
	<tr>
		<td height="50"></td>
	</tr>
	<tr>
		<td align="center" height="50" bgcolor="252525"><a href="javascript:ckform2();" style="text-decoration:none"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 15pt; color:#fff;" >가입하기</span></a></td>
	</tr>
	<tr>
		<td height="100"></td>
	</tr>
</form>
</table>
	</div>
</div>
<script>

var element_layer = document.getElementById('layer');
//주소 검색 닫아주기
function closeDaumPostcode() {
//iframe을 넣은 element를 안보이게 한다.
element_layer.style.display = 'none';
}
//주소 검색 열어주기
function openDaumPostcode(ZipCode, Address, address_ADD) {
new daum.Postcode({
oncomplete : function(data) {
	 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
    var fullAddr = ''; // 최종 주소 변수
    var extraAddr = ''; // 조합형 주소 변수

    // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
        fullAddr = data.roadAddress;

    } else { // 사용자가 지번 주소를 선택했을 경우(J)
        fullAddr = data.jibunAddress;
    }
 // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
    if(data.userSelectedType === 'R'){
        //법정동명이 있을 경우 추가한다.
        if(data.bname !== ''){
            extraAddr += data.bname;
        }
        // 건물명이 있을 경우 추가한다.
        if(data.buildingName !== ''){
            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
        }
        // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
        fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
    }
 
document.getElementById(ZipCode).value = data.zonecode;
document.getElementById(Address).value = fullAddr;
document.getElementById(address_ADD).focus();
element_layer.style.display = 'none';
},
width : '100%',
height : '100%'
}).embed(element_layer);
element_layer.style.display = 'block';
initLayerPosition();
}
//팝업창 세부 설정
function initLayerPosition() {
var width = 600; //우편번호서비스가 들어갈 element의 width
var height = 460; //우편번호서비스가 들어갈 element의 height
var borderWidth = 5; //샘플에서 사용하는 border의 두께
//위에서 선언한 값들을 실제 element에 넣는다.
element_layer.style.width = width + 'px';
element_layer.style.height = height + 'px';
element_layer.style.border = borderWidth + 'px solid';
//실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth) + 'px';
element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth) + 'px';
}
	
	
</script>
</body>
</html>