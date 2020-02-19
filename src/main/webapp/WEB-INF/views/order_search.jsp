<%@page import="com.spring.shop_project.SessionVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	String contextpath = request.getContextPath();
	String respath = request.getContextPath() +"/resources/"; 
%>

<div class="cartpc">
<table cellpadding="0" cellspacing="0" align="center" border="0" width="1200">
	<tr>
		<td height="50" align="center"></td>
	</tr>
	<tr>
		<td align="center" colspan="2">
			<table cellpadding="0" cellspacing="0" border="0" align="center" width="1200">
				<tr>
					<td align="center">
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 25pt; color:#000;">주문 조회</span>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 15pt; color:#000;"><br>Track Order</span>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="50" align="center"></td>
	</tr>
	


	<tr>
		<td height="50" align="center"></td>
	</tr>
	<tr>
		<td height="50" align="center" colspan="2">
			<table cellpadding="0" cellspacing="0" border="0" align="center" width="1200" height="50">
				<tr>
					<td width="700" align="center" bgcolor="f5f5f5" height="50"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">상품</span></td>
					<td width="200" align="center" bgcolor="f5f5f5"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">결제금액</span></td>
					<td width="200" align="center" bgcolor="f5f5f5"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">주문상태</span></td>
					<td width="100" align="center" bgcolor="f5f5f5"></td>
				</tr>

				<tr>
					<td colspan="5">
<!-------------------회원의 경우 자동 출력/비회원의 경우 위에 정보입력후 출력----------------->						
						<table cellpadding="0" cellspacing="0" align="center" border="0" align="center" width="1200">
							<tr>
								<td height="50" colspan="4"></td>
							</tr>
							<tr>
								<td width="700" align="left"><a href="order_detail.html?oid=20191214_ZBEFAS"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 13pt; color:#000;">　[이벤트]Final [파이널] 이어폰 (E1000) [블랙]</span></a></td>
								<td width="200" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">31,100 원</span></td>
								<td width="200" align="center">
									<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">
										발송완료									
									</span>
								</td>
								<td width="100" align="center">
																			<a href="javascript:order_print('20191214_ZBEFAS')"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 9pt; color:#000;">주문내역인쇄</span></a>
																	</td>
							</tr>
							<tr>
								<td height="20" colspan="4"></td>
							</tr>
							<tr>
								<td align="left" height="40" colspan="3">
									<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#858585;">　주문일 : 2019-12-14</span>

																		<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">　　택배 추척 : </span>
									<a href="https://www.doortodoor.co.kr/doortodoor.do?fsp_action=PARC_ACT_002&fsp_cmd=retrieveInvNoACT&invc_no=627342814942" target="_blank"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#858585;">627342814942</span></a>
																	</td>
							</tr>
							<tr>
								<td height="20" align="center" colspan="4"></td>
							</tr>
							<tr>
								<td height="1" align="center" bgcolor="f5f5f5" colspan="4"></td>
							</tr>
							<tr>
								<td height="20" align="center" colspan="4"></td>
							</tr>
						</table>
<!-------------------회원의 경우 자동 출력/비회원의 경우 위에 정보입력후 출력----------------->						
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="50" align="right"></td>
	</tr>
	<tr>
		<td height="1" align="center" bgcolor="f5f5f5" colspan="2"></td>
	</tr>
	<tr>
		<td height="50" align="center"></td>
	</tr>
	<tr>
		<td height="400" align="center" bgcolor="f5f5f5">
			<table cellpadding="0" cellspacing="0" width="90%">
				<tr>
					<td>
<p style="line-height: 2.0;"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">1. 전 제품 5만원 이상 주문건은 배송비가 무료입니다. (택배사: CJ 대한통운)</span>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#858585;"><br>(중고/전시품란의 일부상품 제외. 5만원 미만 주문건은 2,500원의 배송비가 추가됩니다.)</span>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;"><br>2. 카드수수료는 따로 없으며 카드가와 현금가 동일합니다. 
<br>3. 전제품 품질보증서가 들어있는 정식 수입원 제품입니다. 일부 상품은 정식 수입품이지만 시리얼넘버로 정품관리를 하기 때문에 보증서가 들어있지 않을 수도 있습니다.
<br>4. 전 제품은 수입원(제조사)이 지정하는 A/S센타에서 A/S를 받으실수 있습니다. </span>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#858585;"><br>(단 소모품 및 악세사리는 AS가 불가능할 수 있습니다.)</span>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;"><br>5. 제품을 설치하였거나 개봉후에는 반품 및 교환이 불가능합니다. 
<br>6. 제품 자체에 결함이 있을 경우 100% 교환 및 환불이 가능합니다. 단, 제품이 하자가 없을 경우 왕복택배비가 부담됩니다.
<br>7. 이벤트(경매, 중고/전시품 판매, 특가&이벤트판매 등)를 통해 구매하신 제품은 제품의 결함 외에는 환불 및 교환이 불가능합니다. 
<br>8. 특별할인판매 및 기타 이벤트 판매의 경우 현금 주문은 24시간 이내에 입금되지 않으면 주문은 자동취소됩니다. 
</span></p>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="50" align="right" colspan="2"></td>
	</tr>
	<tr>
		<td height="50" align="center" colspan="2"><a href="/index.html"><img src="/img/cart/back.jpg" border="0" /></a></td>
	</tr>
	<tr>
		<td height="150" align="center"></td>
	</tr>
</table>
</div>