<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% 
	String contextpath = request.getContextPath();
	String respath = request.getContextPath() +"/resources/"; 
%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script>
 var count = 0;
$(document).ready(function($){
	
	var totalprice ="";
	var cookie = $.cookie('product');
	var cookielength = cookie.split(",").length;
	//alert(cookielength);

<%-- 	$.ajax({
		url : '<%=request.getContextPath() + "/cart_view_ajax" %>',
		data : {'product_list' : $.cookie('product') },
		type : 'get',
		dataType : 'json',
		cache: false,
		success : function(data) {
			
			for(var i=0; i<data.length;i++) {
				var str = "<tr><form name='cart_viewp465509' method='post' action='cart_view_sub_ps.html' target='cart_view_sub_ps'></form>"+
				"<input type='hidden' name='cart_mode' value='modi'>"+
				"<input type='hidden' name='c_no' value='465509'>"+
				"<input type='hidden' name='link_val' value=''>"+
				"	<td width='50' align='center' height='150'></td>"+
				"	<td width='200' align='center' height='150'>"+
				"						<a href=''><img src='http://www.schezade.co.kr/"+data[i].product_image+"' width='150' style='BORDER: #898989 1px solid;'></a>"+
				"					</td>"+
				"	<td width='600' align='left'> <a href=''><span style='font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;'>"+data[i].product_name+"</span></a>"+
				"	</td>"+
				"	<td width='100' align='center'>"+
				"					<select name='product_balance' id='product_balance'>"+
				"									<option value='1'selected=''>1</option>"+
				"										<option value='2'>2</option>"+
				"										<option value='3'>3</option>"+
				"										<option value='4'>4</option>"+
				"										<option value='5'>5</option>"+
				"										<option value='6'>6</option>"+
				"										<option value='7'>7</option>"+
				"										<option value='8'>8</option>"+
				"										<option value='9'>9</option>"+
				"										<option value='10'>10</option>"+
				"										<option value='11'>11</option>"+
				"										<option value='12'>12</option>"+
				"										<option value='13'>13</option>"+
				"										<option value='14'>14</option>"+
				"										<option value='15'>15</option>"+
				"										<option value='16'>16</option>"+
				"										<option value='17'>17</option>"+
				"										<option value='18'>18</option>"+
				"										<option value='19'>19</option>"+
				"										<option value='20'>20</option>"+
				"										<option value='21'>21</option>"+
				"										<option value='22'>22</option>"+
				"										<option value='23'>23</option>"+
				"										<option value='24'>24</option>"+
				"										<option value='25'>25</option>"+
				"										<option value='26'>26</option>"+
				"										<option value='27'>27</option>"+
				"										<option value='28'>28</option>"+
				"										<option value='29'>29</option>"+
				"								</select>"+
				"			</td>"+
				"	<td width='150' align='center'><span id='price' style='font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;'>"+data[i].product_price+
/* 				"<script> totalprice += eval($('#product_balance option:selected').val()*"+data[i].product_price+"); alert(totalprice)<\/script>"+ */
				"</span></td>"+
				"	<td width='100' align='center'><a href='javascript:cart_del('465509','p');'><span style='font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;'>삭제</span></a></td>"+
				"</tr>";
				
				$("#cartview").append(str);
			}
			
		},
		error:function(err) {
			alert(err);
		},
		
	}); --%>
	

});
</script>
<div class="main4">
		<table cellpadding="0" cellspacing="0" align="center" border="0" width="1200">
			<tbody><tr>
				<td height="50" align="center"></td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<table cellpadding="0" cellspacing="0" border="0" align="center" width="1200">
						<tbody><tr>
							<td>
								<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 25pt; color:#000;">장바구니</span>
								<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 15pt; color:#000;">　Cart List</span>
								<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;"><br><br>·판매가 종료된 상품은 장바구니에서 삭제될 수 있으며 구매하실 수 없습니다.</span>
								<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;"><br>·오랫동안 장바구니에 보관된 상품을 주문하실 경우 가격이나 혜택이 변동될 수 있습니다.</span></td>
							
						</tr>
					</tbody></table>
				</td>
			</tr>
			<tr>
				<td height="50" align="center"></td>
			</tr>


			<tr>
				<td height="50" align="center" colspan="2">


					<table cellpadding="0" cellspacing="0" border="0" align="center" width="1200" height="50">
						<tbody><tr>
							<td width="850" align="center" bgcolor="f5f5f5" height="50"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">상품명</span></td>
							<td width="100" align="center" bgcolor="f5f5f5"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">수량</span></td>
							<td width="150" align="center" bgcolor="f5f5f5"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">주문금액</span></td>
							<td width="100" align="center" bgcolor="f5f5f5"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">삭제</span></td>
						</tr>
						<tr>
							<td colspan="5">						
								<!-------------------상품리스트----------------->
								<table cellpadding="0" cellspacing="0" align="center" border="0" width="1200">
									<tbody id="cartview">
									<tr>
										<td height="50" colspan="6"></td>
									</tr>

										
								</tbody></table>

								<!-------------------상품리스트----------------->
							</td>
						</tr>
					</tbody></table>
				</td>
			</tr>
						<tr>
				<td width="1180" height="100" align="right"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#000;">최종 결제금액</span><span id="totalprice" style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 20pt; color:#000;">　6,380,000 원</span></td>
				<td width="20"></td>
			</tr>
			<tr>
				<td height="1" align="center" bgcolor="f5f5f5" colspan="2"></td>
			</tr>
			<tr>
				<td height="50" align="center"></td>
			</tr>
			<tr>
				<td height="50" align="right" colspan="2">
					<a href="/index.html"><img src="<%=respath %>img/back.jpg" border="0"></a>
					<!--a href="order.html"><img src="/img/cart/pay2.jpg" border="0" /></a-->
					<a href="https://www.schezade.co.kr/order/cart_login.html"><img src="<%=respath %>img/pay.jpg" border="0"></a>
				</td>
			</tr>
		</tbody></table>
		<table cellspacing="0" cellpadding="0" width="1200" align="center" border="0">
			<tbody><tr>
				<td height="10"></td>
			</tr>
					</tbody></table>

		<!-- naver pay-->
		<table cellspacing="0" cellpadding="0" width="1200" align="center" border="0">
			<tbody><tr>
				<td height="150" align="center"></td>
			</tr>
		</tbody></table>
	</div>