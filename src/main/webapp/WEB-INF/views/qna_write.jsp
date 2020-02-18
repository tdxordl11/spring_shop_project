<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
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
	
	if( session.getAttribute("user_name") == null ) {
		out.print("<script>alert('로그인 후에 글쓰기가 가능합니다.');history.go(-1);</script>");
	}
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

<!-------------------------1200이상---------------------------->
<div class="main4">
<table cellpadding="0" cellspacing="0" align="center" border="0" width="1200">
	<tr>
		<td height="50" align="center"></td>
	</tr>
	<tr>
		<td align="center">
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
		<td height="50" align="center">
			<table cellpadding="0" cellspacing="0" border="0" align="center" width="1200" height="50">
			<form name=form method=post action='<%=contextpath +"/user_qna_write" %>'>
			<input type=hidden name="category" value="100">
				<tr>
					<td width="1200" align="center" bgcolor="f5f5f5" height="50"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">
					<input type="text" id="cs_title" name="cs_title" style="background: #f5f5f5; border-top: #f5f5f5 solid; border-bottom: #f5f5f5 solid; border-left: #f5f5f5 solid; border-right: #f5f5f5 solid; width: 1200px; height:30px; text-indent: 20;" placeholder="이 곳에 제목을 입력해주세요"></input></span></td>
				</tr>
				<tr>
					<td>
<!-------------------본문내용----------------->						
						<table cellpadding="0" cellspacing="0" align="center" border="0" align="center" width="1200">

							<tr>
								<td height="20"></td>
							</tr>
							<tr>
								<td width="20">
									
								</td>
								<td width="880" align="left">

								

<!------------------회원시 아이디 자동입력-------------->
<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">작성자 : <input id="user_id" name="user_id" readonly="readonly" type="text" value="${user_name }" style="background: #f5f5f5; border-top: #f5f5f5 solid; border-bottom: #f5f5f5 solid; border-left: #f5f5f5 solid; border-right: #f5f5f5 solid; width: 100px; height:30px; text-indent: 10;" placeholder="작성자"></input></span>
<!------------------회원시 아이디 자동입력-------------->

<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">　　삭제 및 수정시 비밀번호 : <input id="cs_password" name="cs_password" type="password" value="" style="background: #f5f5f5; border-top: #f5f5f5 solid; border-bottom: #f5f5f5 solid; border-left: #f5f5f5 solid; border-right: #f5f5f5 solid; width: 100px; height:30px; text-indent: 10;" placeholder="입력"></input></span>

								</td>
								<td width="280" align="right"><!--span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">작성일자 : 2017-03-10</span---></td>
								<td width="20" align="center"></td>
							</tr>	 
							<tr>
							</tr>
							<tr>
								<td height="20" colspan=4></td>
							</tr>
							<tr>
								<td height="1" bgcolor="f5f5f5" colspan="4"></td>
							</tr>
														<tr>
								<td height="50" colspan=4></td>
							</tr>
							<tr>
								<td colspan="4">
							<!---------본문---------->
									<table cellpadding="0" cellspacing="0" border="0" style="max-width: 1200px; width: 95%; height: auto;" align="center">
										<tr>
											<td align="center">  
<textarea name="cs_contents" id="ir1" rows="10" cols="100" style="width:100%; height:550px; display:none;">

</textarea>
</td>
										</tr>
									</table>
							<!---------본문---------->
								</td>
							</tr>
							<tr>
								<td height="50"  colspan=4></td>
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
		<td height="1" bgcolor="f5f5f5"></td>
	</tr>
	<tr>
		<td height="80" align="center"><a href="javascript:history.back();"><img src='<%=respath +"/img/board/exit.jpg"%>' border="0" width="100" height="auto" /></a>
		<input type=image id="save" src='<%=respath +"/img/board/write.jpg"%>' border="0" width="100" height="auto" /></a></td>
	</tr>
	</form>
</table>
<table cellpadding="0" cellspacing="0" align="center" width="80%">
	<tr>
		<td height="100"></td>
	</tr>
</table>
</div>
<!-------------------------1200이상---------------------------->

</body>
</html>