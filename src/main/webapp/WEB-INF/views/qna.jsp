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
					<td width="100" align="center" bgcolor="f5f5f5"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">답변여부</span></td>
				</tr>
				<tr>
					<td colspan="5">
<!-------------------게시물을 기준으로 페이지당 10개(답변은 무시)----------------->					

						<table cellpadding="0" cellspacing="0" align="center" border="0" width="1200">


   

		<tbody>
		
		
		<c:choose>
		<c:when test="${user_id ne null}">
		<c:forEach items="${qnalist }" var="vo" >
		<tr>
			<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">${vo.cs_seq }</span></td>
			<td width="800" align="left"><a href="board_view.html?no=7051&amp;s_key=&amp;s_field=&amp;category=100&amp;page=1"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 500; font-size: 11pt; color:#000;">${vo.cs_title }</span></a></td>
			<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">${vo.user_id }</span></td>
			<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">${vo.cs_date }</span></td>
			<td width="100" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">
			<c:if test="${vo.comments_contents == null}">
									X
        						</c:if>
        						<c:if test="${vo.comments_contents != null}">
									O (${vo.comments_date })
        						</c:if>
									</span>
        						</td>
		</tr>
		<tr>
			<td height="20" colspan="5"></td>
		</tr>
		<tr>
			<td height="1" bgcolor="f5f5f5" colspan="5"></td>
		</tr>
   </c:forEach>
		</c:when>
		<c:otherwise>
		<h3>등록된 글이 없습니다.</h3>
		</c:otherwise>
		</c:choose>

<!-- 		<tr> -->
<!-- 			<td height="20" colspan="5"></td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td height="1" bgcolor="f5f5f5" colspan="5"></td> -->
<!-- 		</tr> -->
   
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
		<td height="80" align="right" colspan="2"><!--<a href="board_modi.html"><img src="/img/board/modi.jpg" border="0" width="100" height="auto" /></a><a href="#"><img src="/img/board/del.jpg" border="0" width="100" height="auto" /></a>--><a href="board_write.html?category=100"><img src="<%=respath %>img/board/write.jpg" border="0" width="100" height="auto"></a></td>
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
