<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String contextpath = request.getContextPath();
	String respath = request.getContextPath() + "/resources/";
%>
<script type="text/javascript" src="<%=respath %>/editor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];

// 추가 글꼴 목록
//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
$(document).ready(function(){
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "ir1",
		sSkinURI: "<%=respath +"editor/SmartEditor2Skin.html" %>",	
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
			fOnBeforeUnload : function(){
				//alert("완료!");
			}
		}, //boolean
		fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});
	

	$("#save").click(function(){
	          oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	          $("#form").submit();
	 });    
	
	function pasteHTML(str) {
		//var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
		oEditors.getById["ir1"].exec("PASTE_HTML", [str]);
		//저장버튼 클릭시 form 전송
	}
});
	

</script>

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
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 25pt; color:#000;">Q&A</span>
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;"><br><br>·상품 및 주문관련 문의를 주고 받을 수 있습니다.</span>
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
					<td width="1200" align="center" bgcolor="f5f5f5" height="50"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">${qnalist.cs_title }</span></td>
				</tr>
				<tr>
					<td>
<!-------------------본문내용----------------->			
						<table cellpadding="0" cellspacing="0" align="center" border="0" align="center" width="1200">
							<tr>
								<td height="20"></td>
							</tr>
							<tr>
								<td width="20"></td>
								<td width="580" align="left"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">작성자 : ${qnalist.user_id }</span></td>
								<td width="500" align="right"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">작성일 : ${qnalist.cs_date }</span></td>
							</tr>
							<tr>
								<td height="20"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="4"></td>
							</tr>
							<tr>
								<td height="100"></td>
							</tr>
							<tr>
								<td colspan="4">
							<!---------본문---------->
									<table cellpadding="0" cellspacing="0" border="0" style="max-width: 825px; width: 100%; height: auto;" align="center">
										<tr>
											<td  >
<br><p class='board3'><SPAN class='boardlistview2'>${qnalist.cs_contents }</span></p>											
											</td>
										</tr>
									</table>
							<!---------본문---------->
								</td>
							</tr>
							<tr>
								<td height="100"></td>
							</tr>


<tr>
	<td height="100"></td>
</tr>
<tr>
	<td colspan="4">
     <!-- 답변 -->
     <c:if test="${qnalist.comments_contents != null }">
      <table cellpadding="0" cellspacing="0" border="0" style="max-width: 1200px; width: 95%; height: auto;" align="center">
		<tbody>
			<tr>
				<td height="30" bgcolor="f8f8f8" width="5%"></td>
				<td height="30" bgcolor="f8f8f8" width="45%" align="left">
				<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 9pt; color:#000;">webmaster　(${qnalist.comments_date })</span></td>
				<td height="30" bgcolor="f8f8f8" width="5%"></td>
			</tr>
			<tr>
				<td colspan="4" height="10"></td>
			</tr>
			<tr>
				<td height="30" width="5%"></td>
				<td height="30" width="90%" colspan="2">
					<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 9pt; color:#000;">
					${qnalist.comments_contents }
					</span>
				</td>
				<td height="30" width="5%"></td>
			</tr>
			<tr>
				<td colspan="4" height="30"></td>
			</tr>
		</tbody>
	</table>
     </c:if>
    

	</td>
</tr>
<tr>
	<td height="20"></td>
</tr>
							<tr>
								<td height="20"></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="4"></td>
							</tr>
						</table>
<!-------------------본문내용----------------->
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="20"></td>
	</tr>
	
	<tr>
		<td height="20" colspan="2">
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td width="600" align="left"></td>
					<td width="600" align="right"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="20"></td>
	</tr>
	<tr>
		<!-- <td height="1" bgcolor="f5f5f5" colspan="2"></td> -->
	</tr>
	<tr>
		<td>
			<table bgcolor="#ffffff" height="40">
				<tr>
					<td align="left">
					</td>
				</tr>
			</table>
		</td>
		<td height="80" align="right" colspan="2">
			<!-- <a href="board.html?s_key=&s_field=&category=100&page=1"><img src="/img/board/list.jpg" border="0" width="100" height="auto" /></a>
			<a href="board_modi.html?s_key=&s_field=&category=100&page=1&no=9145"><img src="/img/board/modi.jpg" border="0" width="100" height="auto" /></a>
			<a href="board_del.html?s_key=&s_field=&category=100&page=1&no=9145"><img src="/img/board/del.jpg" border="0" width="100" height="auto" /></a> -->
						
		</td>
	</tr>
</table>
</div>