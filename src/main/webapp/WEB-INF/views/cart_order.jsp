<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>

<title>타이틀</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- AMP Analytics -->

<!-- Google Tag Manager -->

<form name="go_loginQQQQQQ" action="https://www.schezade.co.kr/member/member_login.html?" method="get"></form>



<!-------------------상단텍스트롤링 스크립트--------------------->
<!-------------------상단텍스트롤링 스크립트--------------------->



</head>



<!-----------------고정 로그인---------------------->

<!--------------------------------상단 텍스트 롤링배너 스크립트---------------------------->
<!--------------------------------상단 텍스트 롤링배너 스크립트---------------------------->




<!--------------------------------상단 텍스트 롤링배너 스크립트---------------------------->
<!--------------------------------상단 텍스트 롤링배너 스크립트---------------------------->


<!------------------------카테고리 메뉴----------------------------->
<!------------------------카테고리 메뉴----------------------------->
<!------------------------브랜드 카테고리 메뉴----------------------------->
<!------------------------브랜드 카테고리 메뉴----------------------------->
<!------------------검색바------------------------------->
<!------------------검색바------------------------------->

<!------------------움직이는 메뉴---------------------->



<!------------

------------------------>




<!-------------------좌측메뉴 카테고리----------------------->
<!-----------------------------------좌측메뉴 카테고리부분 스크립트------------------------------>

 
<!-----------------------------------------------검색 및 장바구니----------------------------------->
<!-- 	<div id="cate_div17" style="display: none;"> -->
<!--         <div id="container" style="z-index: 99999999999;"> -->
<!-- 			<div align="right" style="float: right; margin-top: 23px; margin-right: 10px; z-index: 9;"> -->
<!-- 				<a onclick="menu_open16();" style="cursor:hand"><img src="/img/search.png" border="0" width="25" height="auto" /></a> -->
<!-- 				<a href="/order/cart_view.html"><img src="/img/cart.png" border="0" width="25" height="auto" /></a> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<table cellpadding="0" cellspacing="0" border="0" bgcolor="ffffff" width="100%" align="center" height="10"> -->
<!-- 			<tr> -->
<!-- 				<td align="center"></td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
<!-- 		<table cellpadding="0" cellspacing="0" border="0" bgcolor="f9f9f9" width="100%" align="center" height="50"> -->
<!-- 			<form name=search_total method=get action="/goods/g_list_search.html" onSubmit="return s_total_chk();"> -->
<!-- 			<tr> -->
<!-- 				<td align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 8pt; color:#ff7d00;"><input id="ts_key" name="ts_key" type="text" style="BORDER: #f2f2f2 1px solid; max-width: 1200px; width: 90%; height:30px; text-indent: 10;" placeholder="Search.."></span></td> -->
<!-- 			</tr> -->
<!-- 			</form> -->
<!-- 		</table> -->
<!-- 	</div> -->
<!-----------------------------------------------검색 및 장바구니----------------------------------->
<!----------------------------------------로그인-------------------------------------------------->
<!----------------------------------------로그인-------------------------------------------------->

<!-----------------------------브랜드------------------------------------------->
<!-----------------------------브랜드------------------------------------------->

<!------------------움직이는 메뉴---------------------->

<!--<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<meta name="description" content="Simple Responsive Template is a template for responsive web design. Mobile first, responsive grid layout, toggle menu, navigation bar with unlimited drop downs, responsive slideshow">
<meta name="keywords" content="">
-->
<!-- Mobile viewport -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
<link rel="shortcut icon" href="/images/favicon.ico"  type="image/x-icon">

<!-- CSS-->

<!-- end CSS-->
    
<!-- JS-->
<!-- end JS-->


<!-- Global site tag (gtag.js) - Google Analytics -->

<!-- Event snippet for 전체 방문자 conversion page -->

<table cellpadding="0" cellspacing="0" align="center" border="0" width="100%">
	<tr>
		<td height="1" bgcolor="ebebeb"></td>
	</tr>
</table>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>


<SCRIPT language=JavaScript>
function zip(zipcode,address1,address2)  {
	new daum.Postcode({
            oncomplete: function(data) {
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

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                //document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                //document.getElementById('sample6_address').value = fullAddr;				
				document.getElementById(zipcode).value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById(address1).value = fullAddr;
				document.getElementById(address2).value = '';
                // 커서를 상세주소 필드로 이동한다.
               // document.getElementById('sample6_address2').focus();
            }
        }).open();
}
</script>
<script>
alert('${o_info}');
alert('${o_info2}');
alert('${o_info3}');

function onlyNumber1(obj){
 var digits="0123456789";
 var temp;
 var val='';
 var num=obj.value;
 for(var i=0;i<num.length;i++){       
  temp=num.substring(i,i+1);    
  if(digits.indexOf(temp)==-1){        
  }else{
   val=val+temp;
  }
 }
 
 obj.value=val;

 if(!b_point_chk(val)){
	obj.value=0; 
 }
} 

function chk_str_20180227(chk_str,str)
{
  var num = chk_str;
  var return_str='';
  var i ; 
  for ( i=0; i < str.length; i++ )  {
    if( num.indexOf(str.substring(i,i+1)) < 0) {
      //break;
    }else{
	  return_str+=str.substring(i,i+1);
	 }
  }
  return return_str; 
}
</script>

<script>
function same_receiver(){ 
  document.register.b_name.value=document.register.o_name.value; 
  document.register.b_address.value=document.register.address.value;
  document.register.b_address_add.value=document.register.address_ADD.value;
  document.register.b_zip1.value=document.register.zipcode1.value; 
  //document.register.b_hometel.value=document.register.o_hometel.value; 
  document.register.b_etc.value=document.register.o_etc.value;
}

function f_chk(){	
  var f=document.register;
    if(!f.o_name.value){		
    alert('주문자 성함을 입력해 주세요');		
    f.o_name.focus();		
    return false;	
  }

  if(!f.o_etc.value){		
    alert('주문자 연락처를 입력해 주세요');		
    f.o_etc.focus();		
    return false;	
  }
  
  if(!f.address.value){		
    alert('주문자 주소를 입력해 주세요');		
    f.address.focus();		
    return false;	
  }

   if(!f.address_ADD.value){		
    alert('주문자 주소를 입력해 주세요');		
    f.address_ADD.focus();		
    return false;	
  }

   
 if(!f.b_name.value){		
    alert('받으시는분 성함을 입력해 주세요');		
    f.b_name.focus();		
    return false;	
  }

  
   if(!f.b_etc.value){		
    alert('받으시는분 연락처를 입력해 주세요');		
    f.b_etc.focus();		
    return false;	
  }

  
  if(!f.b_address.value){		
    alert('받으시는분 주소를 입력해 주세요');		
    f.b_address.focus();		
    return false;	
  }


  if(!f.b_address_add.value){		
    alert('받으시는분 상세주소를 입력해 주세요');		
    f.b_address_add.focus();		
    return false;	
  }

  
  if(f.buy_way[0].checked==true){		
    if(!f.bank_iname.value){		
      alert('온라인입금시 입금자를 적어 주세요');		
      f.bank_iname.focus();		
      return false;	
    }

	if(f.receipt[1].checked==true){
		  if(!f.receipt_phone_number.value){
			  alert('핸드폰 번호를 입력해 주세요');
			  f.receipt_phone_number.focus();
			  return false;
		  }
	}
  }
  
}

</script>


<!-------------------------1200이상---------------------------->
<div class="main4">
<table cellpadding="0" cellspacing="0" align="center" border="0" width="1200">
	<tr>
		<td height="50" align="center"></td>
	</tr>
	<tr>
		<td align="center" colspan="2">
			<table cellpadding="0" cellspacing="0" border="0" align="center" width="1200">
				<tr>
					<td>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 25pt; color:#000;">주문서 작성</span>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 15pt; color:#000;">　Customer Order</span>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="50" align="center"></td>
	</tr>
	<tr>
		<td height="50" align="center" colspan="2">
			<table cellpadding="0" cellspacing="0" border="0" align="center" width="1200" height="50">
				<tr>
					<td width="950" align="center" bgcolor="f5f5f5" height="50">
						<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">상품명</span></td>
					<td width="100" align="center" bgcolor="f5f5f5">
						<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">수량</span></td>
					<td width="150" align="center" bgcolor="f5f5f5"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">주문금액</span></td>
				</tr>
				<tr>
					<td colspan="5">
<!-------------------상품리스트----------------->						
						<table cellpadding="0" cellspacing="0" align="center" border="0" align="center" width="1200">
							<tr>
								<td height="50" colspan="6"></td>
							</tr>
  
							<form name="cart_view465000" method=post>
							<input type=hidden name=cart_mode value="modi">
							<input type=hidden name=c_no value="465000">
							<input type=hidden name="link_val" value="">
							<tr>
								<td width="200" align="center" height="150">
																			<a href='/goods/g_detail.html?gid=3718'><img src="/goods/img/img_S3718.jpg" width="150" style="BORDER: #898989 1px solid;" /></a>
																					
								</td>
								<td width="750" align="left">
																	  <a href='/goods/g_detail.html?gid=3718'><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">SONY [소니] 블루투스 헤드폰 (WH-1000XM3)[사은품:소니 정품등록 이벤트][블랙]</span></a>					
									
																									<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#858585;"><br>18959</span>
								
																<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#858585;"><br>소니 정품등록 이벤트</span>
								
								</td>
								<td width="100" align="center">
											
									<select name="g_num_modi" onchange="this.form.submit()">
																		<option value="1" >1</option>
																		<option value="2" >2</option>
																		<option value="3" >3</option>
																		<option value="4" >4</option>
																		<option value="5" >5</option>
																		<option value="6" >6</option>
																		<option value="7" >7</option>
																		<option value="8" >8</option>
																		<option value="9" >9</option>
																		<option value="10" >10</option>
																		<option value="11" >11</option>
																		<option value="12" >12</option>
																		<option value="13" >13</option>
																		<option value="14" >14</option>
																		<option value="15" >15</option>
																		<option value="16" >16</option>
																		<option value="17" >17</option>
																		<option value="18" >18</option>
																		<option value="19" >19</option>
																		<option value="20" >20</option>
																		<option value="21" >21</option>
																		<option value="22" >22</option>
																		<option value="23" >23</option>
																		<option value="24" >24</option>
																		<option value="25" >25</option>
																		<option value="26" >26</option>
																		<option value="27" >27</option>
																		<option value="28" >28</option>
																		<option value="29" >29</option>
																		</select>
																	
								</td>
								<td width="150" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">399,000 원</span></td>
							</tr>
							<tr>
								<td height="50" colspan="6"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="6"></td>
							</tr>
							</form>
						</table>
<!-------------------상품리스트----------------->
					</td>
				</tr>
			</table>
		</td>
	</tr>


<form method=post name="coupon_ps_form" action="cart_order_coupon_ps.html" target="cart_order_coupon_ps">
<input type=hidden name='mode' value='coupon_ps'>
<input type=hidden name='buy_type' value="1">
	<tr>
		<td width="1180" height="100" align="right">
		<input type=hidden name="total_price" value="1197000">
		<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#000;">전체금액</span>　
		<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#000;" >1,197,000 원</span>



		</td>
		<td width="20"></td>
	</tr>
	<tr>
		<td height="1" align="center" bgcolor="f5f5f5" colspan="2"></td>
	</tr>
	<tr>
		<td width="1180" height="100" align="right"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#000;">최종 결제금액</span>　
		<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 20pt; color:#000;" id="cuopon_price_total">1,197,000 원</span></td>
		<td width="20"></td>
	</tr>
</form>



	<tr>
		<td height="1" align="center" bgcolor="f5f5f5" colspan="2"></td>
	</tr>
	<tr>
		<td height="50" align="center"></td>
	</tr>

	<FORM name=register action="https://www.schezade.co.kr/order/cart_order_ps.html" method=post onsubmit="return f_chk()">
	<input type=hidden name='total_price' id="total_price" value='1197000'>
	<input type=hidden name='buy_type' id="buy_type" value='1'>
	<input type=hidden name='b_point' id="b_point" value=''>
	<tr>
		<td align="center">
			<table cellpadding="0" cellspacing="0" align="center">
				<tr>
					<td width="40"></td>
					<td width="550" valign="top">

<p style="line-height: 1.7;"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 18pt; color:#000;">주문자 정보(회원시 자동입력)</span>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#000;"><br><br>주문자　:　
</span><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input name=o_name value="" type="text" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 250px; width: 100%; height:30px; text-indent: 10;" placeholder="입력"></span>

<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#000;"><br><br>연락처　:　
</span><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input   name=o_etc value="" type="text" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 250px; width: 100%; height:30px; text-indent: 10;" placeholder=""(-)없이 기재. 예)01012341234" onchange="onlyNumber1(this)"></span>

<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#000;"><br><br>주소지　:　
</span><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input  name="zipcode1" id="zipcode1" value=""  type="text" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 150px; width: 100%; height:30px; text-indent: 10;" placeholder="우편번호"></span>

<a href="javascript:zip('zipcode1','address','address_ADD')"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 9pt; color:#ff0000;">　주소 검색</span></a>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#000;"><br><br>　　　　　
</span><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input   name=address id="address" value="" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 250px; width: 100%; height:30px; text-indent: 10;" placeholder="주소"></span>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#000;"><br><br>　　　　　
</span><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input name=address_ADD id="address_ADD" value="" type="text" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 250px; width: 100%; height:30px; text-indent: 10;" placeholder="상세주소"></span>

					</td>

					<td width="610" valign="top">
<p style="line-height: 1.7;"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 18pt; color:#000;">배송 정보</span>
<label><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#858585;">　　　주문자와 동일</span>
<INPUT onclick=same_receiver(); type=checkbox value=same name=same></label>


<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#000;"><br><br>　　수령인　:　
</span><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input name=b_name value="" type="text" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 250px; width: 100%; height:30px; text-indent: 10;" placeholder=""></span>

<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#000;"><br><br>　　연락처　:　
</span><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input   name=b_etc value="" type="text" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 250px; width: 100%; height:30px; text-indent: 10;" placeholder="(-)없이 기재. 예)01012341234" onchange="onlyNumber1(this)"></span>

<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#000;"><br><br>　기타전화　:　
</span><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input   name=b_hometel value="" type="text" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 250px; width: 100%; height:30px; text-indent: 10;" placeholder="기타 연락처를 남기실 분만 기재바랍니다" onchange="onlyNumber1(this)"></span>

<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#000;"><br><br>　　이메일　:　
</span><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input   name=o_email value="" type="text" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 250px; width: 100%; height:30px; text-indent: 10;" placeholder="이메일을 입력해주세요"></span>


<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#000;"><br><br>　　배송지　:　
</span><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input name=b_zip1 id="b_zip1" type="text" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 250px; width: 100%; height:30px; text-indent: 10;" placeholder="우편번호"></span><a href="javascript:zip('b_zip1','b_address','b_address_add')"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 9pt; color:#ff0000;">　주소 검색</span></a>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#000;"><br><br>　　　　　　　
</span><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input name=b_address id="b_address"  value=""  style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 450px; width: 100%; height:30px; text-indent: 10;" placeholder="주소"></span>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#000;"><br><br>　　　　　　　
</span><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input name=b_address_add   id="b_address_add" value="" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 450px; width: 100%; height:30px; text-indent: 10;" placeholder="상세주소"></span>

<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#000;"><br><br>배송메시지　:　
</span><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input  name="delivery_memo" value="" type="text" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 450px; width: 100%; height:30px; text-indent: 10;" placeholder="부재시 연락바랍니다"></span>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#000;"><br><br>기타메시지　:　
</span><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#959595;"><input name=b_note value="" type="text" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 450px; width: 100%; height:30px; text-indent: 10;" placeholder="담당자에게 남기실 말"></span></p>

					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="50" align="center"></td>
	</tr>
	<tr>
		<td height="1" align="center" bgcolor="f5f5f5" colspan="2"></td>
	</tr>
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" align="center">
				<tr>
					<td height="50" align="center"></td>
				</tr>
				<tr>
					<td width="40"></td>
					<td width="1160" colspan="2">
<p style="line-height: 1.7;"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 18pt; color:#000;">결제 방법</span></p>
					</td>
				</tr>
				<tr>
					<td width="40"></td>
					<td width="200" valign="top">
<p style="line-height: 1.7;"><label><input type="radio"  value="bank" name=buy_way CHECKED><span style="font-family: Noto Sans KR, sans-serif; font-weight: 500; font-size: 12pt; color:#000;">　무통장 입금</span></label></p>
					</td>
					<td width="960" valign="top" align="left">
						<table cellpadding="0" cellspacing="0" align="left" border="0" width="960">
							<tr>
								<td align="left"><p style="line-height: 1.7;"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#000;">입금 은행　</span>
<select  name=bank >
<option value="국민은행 015-01-0695-981 ㈜소리샵">국민은행 015-01-0695-981 ㈜소리샵
<option value="우리은행 180-238919-13-001 ㈜소리샵">우리은행 180-238919-13-001 ㈜소리샵
</select>
</p>
								</td>
							</tr>
							<tr>
								<td align="left"><p style="line-height: 1.7;"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#000;">입금자 성함　</span><input name="bank_iname" type="text" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 150px; width: 100%; height:30px; text-indent: 10;" placeholder="입력"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#858585;">　(무통장 입금의 경우 입금 확인 후 발송합니다.)</span></p></td>
							</tr>
							<tr>
								<td align="left"><p style="line-height: 2.5;"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#000;">현금영수증 및 세금계산서<br></span></label>
<label><input type="radio" name="receipt" value="1" checked><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">　발행안함<br></span></label>
<label><input type="radio" name="receipt" value="2"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">　현금영수증　</span></label><input name=receipt_phone_number value="" type="text" style="background: #f9f9f9; BORDER: #f9f9f9 1px solid; max-width: 150px; width: 100%; height:30px; text-indent: 10;" placeholder="연락처 입력"><br>
<label><input type="radio" name="receipt" value="3"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">　세금계산서</span></label><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#858585;">　(사업자용-주문후 전화 드립니다. 사업자등록증 발송하실 팩스번호(02-713-8584))</span></p>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="1" align="center" bgcolor="f5f5f5" colspan="3"></td>
				</tr>
				<tr>
					<td width="40"></td>
					<td width="200" valign="top">
<p style="line-height: 1.7;"><label><input type="radio" value="card" name=buy_way onclick="order_receipt_off()"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 500; font-size: 12pt; color:#000;">　신용카드 결제</span></label></p>
					</td>
					<td width="960" valign="top" align="left">
						<table cellpadding="0" cellspacing="0" align="left" border="0" width="960">
							<tr>
								<td align="left"><p style="line-height: 2.0;"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#000;">무이자 및 일반할부는 카드사 정책에 따라 다릅니다.</span>
 <span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#858585;"><br>카드전표를 세금계산서로 사용하실 수 있습니다.
 <br>무이자 할부개월수가 다른제품의 결제시 낮은개월수를 우선으로 결제됩니다.
 <br>할인쿠폰을 사용해서 결제시 쿠폰의 무이자결제 유무에 따라 결제됩니다.</span></p></td>
							</tr>
						</table>

						<!--------------------------------추가된 부분--------------------------------------->
						<table cellpadding="0" cellspacing="0" border="0">
															<tr>
									<td  height="40">
										<a href="#" onclick="javascript:window.open('/images/index/banner_NaSeI901.jpg','open','width=600,height=655,top=10,left=10,scrollbars=no')"><img src="/img/goods/cardinfo.jpg" border="0" alt="무이자할부안내" /></a>									</td>
								</tr>
														<tr>
								<td width="150" height="40">
									<p align="left" style="line-height: 1.8;"><label><input type="radio"   name="card_event" value="" checked><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#000000;">　일반결제</span></label></p>
								</td>
																<td width="760">
									<p align="left" style="line-height: 1.8;"><label><input type="radio"   name="card_event" value="sam"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#ff0000;">　삼성카드 18,24개월 할부(부분 무이자)</span></label></p>
								</td>
															</tr>
							<tr>
								<td colspan="2" height="40"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt;">카드전표를 세금계산서로 사용하실 수 있습니다.</span></td>
							</tr>
						</table>
						<!--------------------------------추가된 부분--------------------------------------->
					</td>
				</tr>
				<tr>
					<td height="1" align="center" bgcolor="f5f5f5" colspan="3"></td>
				</tr>
				<tr>
					<td width="40"></td>
					<td width="200" valign="top">
<p style="line-height: 1.7;"><label><input type="radio" value="escrow" name=buy_way  onclick="order_receipt_on()"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 500; font-size: 12pt; color:#000;">　에스크로</span></label></p>
					</td>
					<td width="960" valign="top" align="left">
						<table cellpadding="0" cellspacing="0" align="left" border="0" width="960">
							<tr>
								<td align="left"><p style="line-height: 2.5;"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#000;">현금영수증 및 세금계산서</span>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#858585;">　(현금영수증은 에스크로 거래후 주문조회나 MyPage에서 인쇄 가능합니다. )<br></span>
<label><input type="radio" name="tex" checked><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">　발행안함<br></span></label>
<label><input type="radio" name="tex"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">　세금계산서</span></label><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#858585;">　(사업자용-주문후 전화 드립니다. 사업자등록증 발송하실 팩스번호(02-713-8584))</span><br>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#858585;"><br>매매보호서비스는 1회성 가상계좌(신한,농협,국민)에 입금을 하는 방식이며 제품수령후 홈페이지의 주문조회에서  
<br>구매확인을 하셔야  입금처리되고 구매거부로 처리할시 관리자가 확인/처리후 7일 이내에 고객님계좌로 환불됩니다. 
<br>가상계좌로 입금시 CD기로의 입금은 처리 되지 않으니 사용시 유의 하시기 바랍니다. 
<br>구매완료후 주문조회,MyPage에서 현금영수증을 인쇄 하실 수 있습니다. 
</span></p></td>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="50" align="center"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" align="center" bgcolor="f5f5f5" colspan="2"></td>
	</tr>
	<tr>
		<td height="50"></td>
	</tr>
	<tr>
		<td height="50" align="center" colspan="2"><input type=image src="/img/order/order.jpg" border="0" width="100%" height="auto" style="max-width: 150px;" /></td>
	</tr>
	<tr>
		<td height="150" align="center"></td>
	</tr>
	</form>
</table>
</div>
<!-------------------------1200이상---------------------------->
<!-------------------상품리스트----------------->						
<!-------------------상품리스트----------------->



<iframe name="cart_order_coupon_ps" src="about:blank" frameborder="0" width="0" height="0" ></iframe>

<!--form name=name_check_ps method=post action="cart_order_name_check_ps.html" target="cart_order_name_check_ps">
<input type=hidden name="check_name">
<input type=hidden name="check_jumin1">
<input type=hidden name="check_jumin2">
</form

<iframe name="cart_order_name_check_ps" src="cart_order_name_check_ps.html" width=0 height=0 frameborder=0></iframe-->

    <!-----------------------top버튼 css--------------------------->
    <style>
        .go-top{
			z-index: 99999999999;
            display:block;
            width:40px;
            height:40px;
            line-height:px;
            text-align:center;
            font-size:30px;
            position:fixed;
            bottom:-40px;
            opacity: 1;
            right:20px;
            -webkit-transition: all 1s ease;
            -moz-transition: all 1s ease;
            -o-transition: all 1s ease;
            transition: all 1s ease;
            background-color:#ffffff;
            color:#FFFFFF;
            text-decoration:none;
            -moz-border-radius:50px;
            -webkit-border-radius:50px;
            border-radius:50px;
        }

        .go-top.show{
            bottom:70px;
        }
    </style>
    <!-----------------------top버튼 css--------------------------->
    <!-------------------------------top버튼 스크립트------------------------------>
    <script>
        /*Add class when scroll down*/
        $(window).scroll(function(event){
            var scroll = $(window).scrollTop();
            if (scroll >= 100) {
                $(".go-top").addClass("show");
            } else {
                $(".go-top").removeClass("show");
            }
        });
    </script>
    <!-------------------------------top버튼 스크립트------------------------------>


<iframe name="index_ps" src="about:blank" frameborder="0" width="0" height="0"></iframe>

<!-- Google 리마케팅 태그 코드 -->
<!-- Google 리마케팅 태그 코드 -->
<!--form name="go_loginQQQQQQ" action="http://www.schezade.co.kr/member/member_login.html" method="get"-->






<script language = "javascript" src = "https://pgweb.dacom.net/WEB_SERVER/js/escrowValid.js"></script>

<script language=javascript>
<!--
var isDOM = (document.getElementById ? 1 : 0);
var isIE4 = ((document.all && !isDOM) ? 1 : 0);
var isNS4 = (document.layers ? 1: 0);
function getRef(id) {
  if (isDOM) return document.getElementById(id);
  if (isIE4) return document.all[id];
  if (isNS4) return document.layers[id];
}
var isNS = navigator.appName == "Netscape";
function moveRightEdge() {
    var yMenuFrom, yMenuTo, yOffset, timeoutNextCheck;
    if (isNS4) {
            yMenuFrom   = divMenu.top;
            yMenuTo     = windows.pageYOffset + 60;
    } else if (isDOM) {
            yMenuFrom   = parseInt (divMenu.style.top, 10);
            yMenuTo     = (isNS ? window.pageYOffset : document.body.scrollTop) + 200;
    }
    timeoutNextCheck = 500;

    if (yMenuFrom != yMenuTo) {
            yOffset = Math.ceil(Math.abs(yMenuTo - yMenuFrom) / 20);
            if (yMenuTo < yMenuFrom)
                    yOffset = -yOffset;
            if (isNS4)
                    divMenu.top += yOffset;
            else if (isDOM)
                    divMenu.style.top = parseInt (divMenu.style.top, 10) + yOffset;
                    timeoutNextCheck = 10;
    }
    setTimeout ("moveRightEdge()", timeoutNextCheck);
}
-->
</script>
<script language=javascript>
<!--
if (isNS4) {
  var divMenu = document["divMenu"];
  divMenu.top = top.pageYOffset + 60;
  divMenu.visibility = "visible";
  moveRightEdge();
} else if (isDOM) {
  var divMenu = getRef('divMenu');
  divMenu.style.top = (isNS ? window.pageYOffset : document.body.scrollTop) + 60;
  divMenu.style.visibility = "visible";
  moveRightEdge();
}
//-->
</script>


<!-- 공통 적용 스크립트 , 모든 페이지에 노출되도록 설치. 단 전환페이지 설정값보다 항상 하단에 위치해야함 --> 
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"> </script> 

<!--naver Analytics -->

<!-- naver 프리미엄 로그 --> 

</body>
</html>