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
	�̸��� ���� ��ư Ŭ���� �߻��ϴ� �̺�Ʈ
	*/
	$(document).on("click", "#emailBtn", function(){
	/* �̸��� �ߺ� üũ �� ���� �߼� �񵿱� ó�� */
	if(!$("#mail1").val()){
		alert('email�� �Է��� �ּ���');
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
	�������, http://a.com?name=egoing&job=programmer ���� &job=programmer
	�� '&'�� �ϳ��� �Ķ���Ͱ� ������ ���� �Ķ���Ͱ� �´ٴ� �ǹ��̴�.
	�׷��� ������ ���� job�� ���� &�� ���Եȴٸ� �ý����� job�� ���� ����� �ν��Ҽ� ���� �ȴ�. */
			success : function(data){
				alert("��û�� �̸��� �ּҷ� ������ȣ�� ���½��ϴ�. ������ȣ�� �Է����ּ���.")
				},
			error: function(data){
			alert("������ �߻��߽��ϴ�.");
				return false;
				}
			})
		})
	/*
	�̸��� ������ȣ �Է� �� ���� ��ư Ŭ�� �̺�Ʈ
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
					alert("������ �Ϸ�Ǿ����ϴ�.");
					
				}else if(data == "false"){
					alert("������ȣ�� �߸� �Է��ϼ̽��ϴ�.")
					}
				},
			complete: function(){
// 	loadingBarEnd();
				},
			error:function(data){
			alert("������ �߻��߽��ϴ�.");
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
					$("#id_check").html("��� ������ ���̵��Դϴ�.").css("color", "green");
				} else {
					id_check = true;
					$("#id_check").html("��� �Ұ����� ���̵� �Դϴ�").css("color", "red");
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
			alert('���̵� �Է��� �ּ���');
			f.id.focus();
			return false;
		}
	  
	   if(f.id.value.length<4 || f.id.value.length>60) {
			alert('���̵�� 4~60���� ����,���ڷθ� �Է��� �ּ���');
			f.id.focus();
			return false;
		}

		if(!f.password.value){
			alert('��й�ȣ�� �Է��� �ּ���');
			f.password.focus();
			return false;
		}

	    if(f.password.value.length<6 ||f.password.value.length>12) {
			alert('��й�ȣ�� 6~12�ڷ� �Է����ּ���');
			f.password.focus();
			return false;
		}

		if(!f.password2.value){
			alert('��й�ȣȮ�� �Է��� ���ּ���');
			f.password2.focus();
			return false;
		}

	    if(f.password.value!=f.password2.value){
			alert("�Է��Ͻ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�!");
			f.password2.focus();
			return false;
		}

		if(!f.address_ADD.value){
			alert('�ּҸ� �Է��� �ּ���');
			return false;
		}
		
		if(!f.cellpager1.value || !f.cellpager2.value || !f.cellpager3.value ){
			alert('����ó�� �Է��� ���ּ���');
			return false;
		}
		
		

		
		//if(!f.mail1.value || !f.mail2.value){
		//	alert('�̸����� �Է��� �ּ���');
		//	f.mail1.focus();
		//	return false;
	    //}
		/*
		/
		else{
		   if(!chk_mail(f.mail.value)){
			 alert('�̸��� ������ �߸� �Ǿ����ϴ�.');
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
		<td align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 20pt; color:#000;">ȸ�� ����</span>
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
<!-- <input type="hidden" name=ssn1 value="�������"> -->
<!-- <input type="hidden" name=name value="�̸�"> -->
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
						<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">���̵� [�ʼ�]</span>
					</td>
				</tr>
			</table>
		</div>
        <div class="grid_18">
			<table cellpadding="0" cellspacing="0" width="100%" align="center" border="0" height="50" bgcolor="f9f9f9">
				<tr>
					<td width="10%"></td>
					<td>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input name="user_id" id="id" type="text" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 150px; width: 100%; height:30px;" placeholder="�Է�" maxlength=60></span>
<a href="javascript:id_check()"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 9pt; color:#ff0000;">���ߺ�Ȯ��</span></a>
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
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">��й�ȣ [�ʼ�]</span>
					</td>
				</tr>
			</table>
		</div>
        <div class="grid_18">
			<table cellpadding="0" cellspacing="0" width="100%" align="center" border="0" height="50" bgcolor="f9f9f9">
				<tr>
					<td width="10%"></td>
					<td>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input name="user_password" id="password" type="password" maxlength=12 style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 200px; width: 100%; height:30px;" placeholder="�Է�"></span>
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
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">��й�ȣ Ȯ�� [�ʼ�]</span>
					</td>
				</tr>
			</table>
		</div>
        <div class="grid_18">
			<table cellpadding="0" cellspacing="0" width="100%" align="center" border="0" height="50" bgcolor="f9f9f9">
				<tr>
					<td width="10%"></td>
					<td>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input name="password2" type="password" maxlength=12  style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 200px; width: 100%; height:30px;" placeholder="�Է�"></span>
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
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">�̸�</span>
					</td>
				</tr>
			</table>
		</div>
        <div class="grid_18">
			<table cellpadding="0" cellspacing="0" width="100%" align="center" border="0" height="50" bgcolor="f9f9f9">
				<tr>
					<td width="10%"></td>
					<td>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input name="user_name" type="text" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 150px; width: 100%; height:30px;" placeholder="�Է�" maxlength=60></span>						
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
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">�̸��� </span>
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
					<button type="button" class="btn btn-info" id="emailBtn">�̸��� �߼�</button>
					<input type="text" path="emailAuth" id=emailAuth value="" style="display: none; background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 100px; width: 100%; height:30px;"/>
					<button type="button" class="btn btn-info" id="emailAuthBtn">�̸��� ����</button>
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
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">�ּ� [�ʼ�]</span>
					</td>
				</tr>
			</table>
		</div>
        <div class="grid_18">
			<table cellpadding="0" cellspacing="0" width="100%" align="center" border="0" height="150" bgcolor="f9f9f9">
				<tr>
					<td width="10%"></td>
					<td>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input name="zipcode" id="zipcode" type="text" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 150px; width: 100%; height:30px;" placeholder="�����ȣ"></span><a href="javascript:openDaumPostcode('zipcode','address','address_ADD')" style="text-decoration:none"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 9pt; color:#ff0000;">�ּ� �˻�</span></a>
<div id="layer" style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1" onclick="closeDaumPostcode()" alt="�ݱ� ��ư">
</div>
					</td>
				</tr>
				<tr>
					<td width="10%"></td>
					<td>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input name="address" id="address" maxlength=200 type="text" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 200px; width: 100%; height:30px;" placeholder="�ּ�"></span>
					</td>
				</tr>
				<tr>
					<td width="10%"></td>
					<td>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input  name="address_ADD" id="address_ADD"  maxlength=300 type="text" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 200px; width: 100%; height:30px;" placeholder="���ּ�"></span>
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
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">����ó [�ʼ�]</span>
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
<!-- <span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">��Ÿ ����ó [����]</span> -->
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
		<td align="center" height="50" bgcolor="252525"><a href="javascript:ckform2();" style="text-decoration:none"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 15pt; color:#fff;" >�����ϱ�</span></a></td>
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
//�ּ� �˻� �ݾ��ֱ�
function closeDaumPostcode() {
//iframe�� ���� element�� �Ⱥ��̰� �Ѵ�.
element_layer.style.display = 'none';
}
//�ּ� �˻� �����ֱ�
function openDaumPostcode(ZipCode, Address, address_ADD) {
new daum.Postcode({
oncomplete : function(data) {
	 // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

    // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
    // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
    var fullAddr = ''; // ���� �ּ� ����
    var extraAddr = ''; // ������ �ּ� ����

    // ����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
    if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
        fullAddr = data.roadAddress;

    } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
        fullAddr = data.jibunAddress;
    }
 // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.
    if(data.userSelectedType === 'R'){
        //���������� ���� ��� �߰��Ѵ�.
        if(data.bname !== ''){
            extraAddr += data.bname;
        }
        // �ǹ����� ���� ��� �߰��Ѵ�.
        if(data.buildingName !== ''){
            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
        }
        // �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
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
//�˾�â ���� ����
function initLayerPosition() {
var width = 600; //�����ȣ���񽺰� �� element�� width
var height = 460; //�����ȣ���񽺰� �� element�� height
var borderWidth = 5; //���ÿ��� ����ϴ� border�� �β�
//������ ������ ������ ���� element�� �ִ´�.
element_layer.style.width = width + 'px';
element_layer.style.height = height + 'px';
element_layer.style.border = borderWidth + 'px solid';
//����Ǵ� ������ ȭ�� �ʺ�� ���� ���� �����ͼ� �߾ӿ� �� �� �ֵ��� ��ġ�� ����Ѵ�.
element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth) + 'px';
element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth) + 'px';
}
	
	
</script>
</body>
</html>