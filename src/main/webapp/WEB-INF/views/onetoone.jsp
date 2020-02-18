<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<%
	String contextpath = request.getContextPath();
	String respath = request.getContextPath() + "/resources/";
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
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
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 25pt; color:#000;">Q&amp;A</span>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;"><br><br>·상품 및 주문관련 문의를 주고 받을 수 있습니다.</span>
					</td>
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
					<td width="100" align="center" bgcolor="f5f5f5" height="50"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">번호</span></td>
					<td width="800" align="center" bgcolor="f5f5f5" height="50"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">제목</span></td>
					<td width="100" align="center" bgcolor="f5f5f5"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">작성자</span></td>
					<td width="100" align="center" bgcolor="f5f5f5"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">등록일</span></td>
					<td width="100" align="center" bgcolor="f5f5f5"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">조회수</span></td>
				</tr>
				<tr>
					<td colspan="5">
<!-------------------게시물을 기준으로 페이지당 10개(답변은 무시)----------------->					

						<table cellpadding="0" cellspacing="0" align="center" border="0" width="1200">


   

		<tbody><tr>
			<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">7051</span></td>
			<td width="800" align="left"><a href="board_view.html?no=7051&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 500; font-size: 11pt; color:#000;">[공지] 제품 A/S에 대한 안내 [5]</span></a></td>
			<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">관리자</span></td>
			<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2018-05-17 16:17</span></td>
			<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">6870</span></td>
		</tr>
		<tr>
			<td height="20" colspan="5"></td>
		</tr>
		<tr>
			<td height="1" bgcolor="f5f5f5" colspan="5"></td>
		</tr>
   

		<tr>
			<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">7046</span></td>
			<td width="800" align="left"><a href="board_view.html?no=7046&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 500; font-size: 11pt; color:#000;">[공지] 입금확인에 대한 안내 [2]</span></a></td>
			<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">관리자</span></td>
			<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2018-05-16 15:03</span></td>
			<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">3254</span></td>
		</tr>
		<tr>
			<td height="20" colspan="5"></td>
		</tr>
		<tr>
			<td height="1" bgcolor="f5f5f5" colspan="5"></td>
		</tr>
   

		<tr>
			<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">5902</span></td>
			<td width="800" align="left"><a href="board_view.html?no=5902&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 500; font-size: 11pt; color:#000;">[공지] 구매 영수증 발급 안내 [1]</span></a></td>
			<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">관리자</span></td>
			<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2017-06-05 10:32</span></td>
			<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">5832</span></td>
		</tr>
		<tr>
			<td height="20" colspan="5"></td>
		</tr>
		<tr>
			<td height="1" bgcolor="f5f5f5" colspan="5"></td>
		</tr>

						

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">9140</span></td>
								<td width="800" align="left">
																	<a href="board_view.html?no=9140&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">메제99 클래식 관련 문의 [1]</span></a>
															
								
								</td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">김동규</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2020-02-18 09:00</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">9</span></td>
							</tr>

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="5"></td>
							</tr>

						

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">9139</span></td>
								<td width="800" align="left">
																	<a href="board_view.html?no=9139&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">ls200is 관련 질문 [1]</span></a>
															
								
								</td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">이지훈</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2020-02-17 17:47</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">12</span></td>
							</tr>

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="5"></td>
							</tr>

						

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">9138</span></td>
								<td width="800" align="left">
																	<a href="board_view.html?no=9138&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">oriolus finchi 재입고 언제 될까요? [1]</span></a>
															
								
								</td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">신대홍</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2020-02-17 16:15</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">13</span></td>
							</tr>

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="5"></td>
							</tr>

						

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">9137</span></td>
								<td width="800" align="left">
																	<a href="board_view.html?no=9137&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">final e1000단선됬는데요 [1]</span></a>
															
								
								</td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">yhj</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2020-02-16 15:04</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">23</span></td>
							</tr>

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="5"></td>
							</tr>

						

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">9136</span></td>
								<td width="800" align="left">
																	<a href="board_view.html?no=9136&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">RAI PENTA 3.5 이어폰 케이블 별도 구매 가능 여부 문의 드립니다 [1]</span></a>
															
								
								</td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">정승용</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2020-02-15 10:42</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">17</span></td>
							</tr>

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="5"></td>
							</tr>

						

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">9135</span></td>
								<td width="800" align="left">
																	<a href="board_view.html?no=9135&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">오디지 모비우스 예약판매.. [1]</span></a>
															
								
								</td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">김세홍</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2020-02-15 04:14</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">32</span></td>
							</tr>

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="5"></td>
							</tr>

						

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">9134</span></td>
								<td width="800" align="left">
																	<a href="board_view.html?no=9134&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">null audio 케이블 [1]</span></a>
															
								
								</td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">강태화</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2020-02-13 14:15</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">21</span></td>
							</tr>

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="5"></td>
							</tr>

						

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">9133</span></td>
								<td width="800" align="left">
																	<a href="board_view.html?no=9133&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">ADVANCED  [어드밴스드] C타입 DAC/AMP (ACCESSPORT LITE) [1]</span></a>
															
								
								</td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">김효승</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2020-02-13 09:36</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">25</span></td>
							</tr>

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="5"></td>
							</tr>

						

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">9132</span></td>
								<td width="800" align="left">
																	<a href="board_view.html?no=9132&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">USB 케이블 [1]</span></a>
															
								
								</td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">Yun</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2020-02-12 18:32</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">29</span></td>
							</tr>

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="5"></td>
							</tr>

						

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">9131</span></td>
								<td width="800" align="left">
																	<a href="board_view.html?no=9131&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">배송 누락 [1]</span></a>
															
								
								</td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">sh</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2020-02-12 07:05</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">36</span></td>
							</tr>

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="5"></td>
							</tr>

						

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">9130</span></td>
								<td width="800" align="left">
																	<a href="board_view.html?no=9130&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">안녕하세요 [1]</span></a>
															
								
								</td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">신현섭</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2020-02-11 19:20</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">19</span></td>
							</tr>

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="5"></td>
							</tr>

						

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">9129</span></td>
								<td width="800" align="left">
																	<a href="board_view.html?no=9129&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">배송문의 [1]</span></a>
															
								
								</td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">김재근</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2020-02-11 14:53</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">24</span></td>
							</tr>

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="5"></td>
							</tr>

						

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">9128</span></td>
								<td width="800" align="left">
																	<a href="board_view.html?no=9128&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">x1s pro&nbsp;&nbsp;질문드립니다 [1]</span></a>
															
								
								</td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">누마</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2020-02-11 14:21</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">11</span></td>
							</tr>

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="5"></td>
							</tr>

						

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">9127</span></td>
								<td width="800" align="left">
																	<a href="board_view.html?no=9127&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">ifi xdsd 질문 [1]</span></a>
															
								
								</td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">김홍식</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2020-02-11 13:27</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">13</span></td>
							</tr>

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="5"></td>
							</tr>

						

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">9126</span></td>
								<td width="800" align="left">
																	<a href="board_view.html?no=9126&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">a8000 구매 후 질문드려요 [2]</span></a>
															
								
								</td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">김동휘</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2020-02-11 09:52</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">23</span></td>
							</tr>

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="5"></td>
							</tr>

						

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">9125</span></td>
								<td width="800" align="left">
																	<a href="board_view.html?no=9125&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">역경매 취소 가능한가요? [1]</span></a>
															
								
								</td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">박기범</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2020-02-10 23:08</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">39</span></td>
							</tr>

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="5"></td>
							</tr>

						

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">9124</span></td>
								<td width="800" align="left">
																	<a href="board_view.html?no=9124&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">주문취소 관련 문의 [2]</span></a>
															
								
								</td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">박현호</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2020-02-10 11:17</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">24</span></td>
							</tr>

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="5"></td>
							</tr>

						

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">9123</span></td>
								<td width="800" align="left">
																	<a href="board_view.html?no=9123&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">오프라인가격관련 [1]</span></a>
															
								
								</td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">KJG</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2020-02-09 21:09</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">29</span></td>
							</tr>

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="5"></td>
							</tr>

						

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">9122</span></td>
								<td width="800" align="left">
																	<a href="board_view.html?no=9122&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">케이블 주문제작 문의 [1]</span></a>
															
								
								</td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">질문</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2020-02-09 12:25</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">21</span></td>
							</tr>

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="5"></td>
							</tr>

						

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">9121</span></td>
								<td width="800" align="left">
																	<a href="board_view.html?no=9121&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">입금 문의 [2]</span></a>
															
								
								</td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">임정빈</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2020-02-08 23:12</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">17</span></td>
							</tr>

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="5"></td>
							</tr>

						

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">9120</span></td>
								<td width="800" align="left">
																	<a href="board_view.html?no=9120&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">CKR100is 입고 가능한지 여쭈어봅니다 [1]</span></a>
															
								
								</td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">김영빈</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2020-02-08 19:36</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">22</span></td>
							</tr>

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="5"></td>
							</tr>

						

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">9119</span></td>
								<td width="800" align="left">
																	<a href="board_view.html?no=9119&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">역경매샵 문ㅇ아ㅣ [1]</span></a>
															
								
								</td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">양준원</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2020-02-08 17:45</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">42</span></td>
							</tr>

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="5"></td>
							</tr>

						

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">9118</span></td>
								<td width="800" align="left">
																	<a href="board_view.html?no=9118&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">이어패드문의 [1]</span></a>
															
								
								</td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">강성운</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2020-02-08 17:14</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">22</span></td>
							</tr>

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="5"></td>
							</tr>

						

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">9117</span></td>
								<td width="800" align="left">
																	<a href="board_view.html?no=9117&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">이어팁 구매 재문의 [4]</span></a>
															
								
								</td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">질문</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2020-02-08 13:35</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">39</span></td>
							</tr>

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="5"></td>
							</tr>

						

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">9115</span></td>
								<td width="800" align="left">
																	<a href="board_view.html?no=9115&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">무통장 배송 취소했는데 취소가된건가요?? [1]</span></a>
															
								
								</td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">송용성</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2020-02-08 11:23</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">22</span></td>
							</tr>

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="5"></td>
							</tr>

						

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">9114</span></td>
								<td width="800" align="left">
																	<a href="board_view.html?no=9114&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">2월 7일 이벤트 세일 [1]</span></a>
															
								
								</td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">김영기</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2020-02-07 10:49</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">40</span></td>
							</tr>

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="5"></td>
							</tr>

						

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">9113</span></td>
								<td width="800" align="left">
																	<a href="board_view.html?no=9113&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">환불문의 드립니다. [1]</span></a>
															
								
								</td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">최원규</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2020-02-06 18:54</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">33</span></td>
							</tr>

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="5"></td>
							</tr>

						

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">9112</span></td>
								<td width="800" align="left">
																	<a href="board_view.html?no=9112&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">환불관련 문의입니다 [1]</span></a>
															
								
								</td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">김치관</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2020-02-06 18:47</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">32</span></td>
							</tr>

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="5"></td>
							</tr>

						

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">9111</span></td>
								<td width="800" align="left">
																	<a href="board_view.html?no=9111&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">입금문의 [1]</span></a>
															
								
								</td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">이성현</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2020-02-06 14:14</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">31</span></td>
							</tr>

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="5"></td>
							</tr>

						

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">9110</span></td>
								<td width="800" align="left">
																	<a href="board_view.html?no=9110&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">방문픽업 가능한가요? [1]</span></a>
															
								
								</td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">임한상</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">2020-02-06 11:09</span></td>
								<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">32</span></td>
							</tr>

							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="5"></td>
							</tr>

						</tbody></table>
					</td>
				</tr>
			</tbody></table>
		</td>
	</tr>
<script>
	function s_chk(){
	  var f=document.search;
	  if(!f.s_key.value){
		alert('\"검색어\"를 입력해 주세요 ^^');
		f.s_key.focus();
		return false;
	  }
	}
	</script>
	<tr>
		<td>
			<table bgcolor="#ffffff" height="40">
				<form method="get" name="search" action="board.html" onsubmit="return s_chk()"></form>
				<input type="hidden" name="category" value="100">
				<tbody><tr>
					<td align="left">
<select name="s_field" style="BORDER: #ebebeb 1px solid; max-width: 80px; width: 80px; height:34px;">
<option value="subject">제목</option>
<option value="memo"> 내용</option>
<option value="no">글번호</option>
</select>
<input name="s_key" value="" type="text" style="BORDER: #ebebeb 1px solid; max-width: 150px; width: 150px; height:34px; text-indent: 10;" placeholder="검색">
					</td>
				</tr>
				
			</tbody></table>
		</td>
		<td height="80" align="right" colspan="2"><!--<a href="board_modi.html"><img src="/img/board/modi.jpg" border="0" width="100" height="auto" /></a><a href="#"><img src="/img/board/del.jpg" border="0" width="100" height="auto" /></a>--><a href="board_write.html?category=100"><img src="/img/board/write.jpg" border="0" width="100" height="auto"></a></td>
	</tr>
</tbody></table>
<table cellpadding="0" cellspacing="0" align="center" width="80%">
	<tbody><tr>
		<td width="100%" height="50" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-size: 10pt; font-weight: 300; color: #898989;"><span class="pagenum">◀&nbsp;&nbsp;&nbsp;<b>1</b>&nbsp;&nbsp;&nbsp;<a href="?s_key=&amp;s_field=&amp;category=100&amp;page=2">2</a>&nbsp;&nbsp;&nbsp;<a href="?s_key=&amp;s_field=&amp;category=100&amp;page=3">3</a>&nbsp;&nbsp;&nbsp;<a href="?s_key=&amp;s_field=&amp;category=100&amp;page=4">4</a>&nbsp;&nbsp;&nbsp;<a href="?s_key=&amp;s_field=&amp;category=100&amp;page=5">5</a>&nbsp;&nbsp;&nbsp;<a href="?s_key=&amp;s_field=&amp;category=100&amp;page=6">6</a>&nbsp;&nbsp;&nbsp;<a href="?s_key=&amp;s_field=&amp;category=100&amp;page=7">7</a>&nbsp;&nbsp;&nbsp;<a href="?s_key=&amp;s_field=&amp;category=100&amp;page=8">8</a>&nbsp;&nbsp;&nbsp;<a href="?s_key=&amp;s_field=&amp;category=100&amp;page=9">9</a>&nbsp;&nbsp;&nbsp;<a href="?s_key=&amp;s_field=&amp;category=100&amp;page=10">10</a>&nbsp;&nbsp;&nbsp;<a href="?s_key=&amp;s_field=&amp;category=100&amp;page=11">▶</a></span>	</span></td>
	</tr>
	<tr>
		<td height="100"></td>
	</tr>
</tbody></table>
</div>
</body>
</html>
