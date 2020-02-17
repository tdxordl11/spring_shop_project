<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<% 
	String contextpath = request.getContextPath();
	String respath = request.getContextPath() +"/resources/"; 
%>
<%-- <c:forEach items="${goodslist }" var="vo">
	${vo.product_name } <br>
</c:forEach>
--%>
<!-- 무한 스크롤 스크립트 start -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script>
 var count = 0;
$(document).ready(function($){
    start.init();
    
    $(".cart_add").on("click", function(e){
    	e.preventDefault();
    	var gid = $(this).attr("value");
    	alert("나와라 시발");
    	
    	if($.cookie('product') != null ) {
    		if($.cookie('product').indexOf( gid ) != -1) {
    			alert("이미 장바구니에 등록되어 있음");
    		} else {
            	$.cookie('product', $.cookie('product')+","+gid+":1", { expires: 7 , path: '/' });
            	alert("장바구니에 저장되었습니다.");
    		}

    	} else {
        	$.cookie('product', gid+":1", { expires: 7 , path: '/' });
        	alert("장바구니에 저장되었습니다.");
    	}

    	//쿠키 읽기
    	//alert($.cookie('product_id'));
    	//alert($.cookie('product_balance'));
    	

    });
});
var sort = '<%=request.getParameter("sort")%>';
var ts_key = '<%=request.getParameter("ts_key")%>';
var start = {
        param : {
            curPage : 1,
            pageListSize : 16,
        },       
        init : function() {
           this.testEvent();
        },
       testEvent : function() {
            // 무한 스크롤
            $(window).scroll(function() {
            	
            	//로그 
            	//console.log("documentHeight:" + $(document).height() + " | scrollTop:" + $(window).scrollTop() + " | windowHeight: " +$(window).height() );
            	
                // 맨 밑으로 스크롤이 갔을경우 if문을 탑니다.
                if ( $(window).scrollTop() == $(document).height() - $(window).height() ) { 
                    start.param.curPage++; // 현재 페이지에서 +1 처리.
                    start.testAjax(); //ajax 호출
                } 
                
            }); 
        },
        // 무한 스크롤 ajax 요청
        testAjax : function() {
            $.ajax({
                type     : 'get',
                url      : 'goodsScroll?curPage='+start.param.curPage+'&pageListSize='+start.param.pageListSize+'&sort='+sort+"&ts_key="+ts_key,
                //data     : JSON.stringify(start.param), // 다음 페이지 번호와 페이지 사이즈를 가지고 갑니다.
                dataType : 'json',
                contentType: "application/json",
                beforeSend:function(){
					 $('#wrap-loading').css("display", "block");
			    },complete:function(){
			    	 $('#wrap-loading').css("display", "none");
			    },
                success : successCallback,
                error : errorCallback
            });
            // 성공
            function successCallback(goodslist) {
   				//alert("성공 = start.param.curPage:" + start.param.curPage);
   				//alert(goodslist[0].product_name);
   				for(var i=0; i<goodslist.length/4; i++) {
            		$("#repeat").append("<tbody>"+
            				"<td width='418' valign='top'>"+
            				"<table cellpadding='0' cellspacing='0' border='0' align='center' width='100%' style='max-width:418px;' bgcolor='f2f2f2'>"+
            				"	<form method=post action='/order/cart_view.html'>"+
            				"	<input type=hidden name='link_val' value='http://'>"+
            				"		<tr>"+
            				"			<td height='10'></td>"+
            				"		</tr>"+
            				"		<tr>"+
            				"			<td width='10'></td>"+
            				"			<td align='center'><a href='/shop_project/main?menu=p_detail?gid="+goodslist[i*4].product_id+"'><img src='http://www.schezade.co.kr/"+goodslist[i*4].product_image+"' width='100%' height='100%' style='max-width: 400px; max-height: 400px;' border='0' /></a></td>"+
            				"			<td width='10'></td>"+
            				"		</tr>"+
            				"		<tr>"+
            				"			<td align='center' height='150' colspan='3'>"+
            				"				<table cellpadding='0' cellspacing='0' align='center' border='0' width='90%'>"+
            				"					<tr>"+
            				"						<td align='center'>"+
            				"							<p style='line-height: 1.7; test-align: center;'><span style='font-family: Noto Sans KR, sans-serif; font-size: 12pt; font-weight: 300; color: #000;'><br>"+goodslist[i*4].product_brand+"</span>"+
            				"				<span style='font-family: Noto Sans KR, sans-serif; font-size: 15pt; font-weight: 500; color: #000;'><br><a href='/goods/g_detail.html?gid=3506'>"+goodslist[i*4+0].product_name+"</a></span>"+
            				"		     <br><span style='font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 8pt; color: #000;'>"+
            				"			 [청음가능]</span>"+
            				"				<span style='font-family: Noto Sans KR, sans-serif; font-size: 12pt; font-weight: 500; color: #000;'><br><br>"+
            				"				<b></b>"+goodslist[i*4+0].product_price+"원</b>"+
            				"				</span>				"+		
            				"				</p>"+
            				"						</td>"+
            				"					</tr>"+
            				"				</table>"+
            				"			</td>"+
            				"		</tr>		"+
            				"<tr>"+
            				"			<td align='center' height='80' valign='middle' colspan='3'><a href='/goods/g_detail.html?gid=3506'><img src='<%=respath %>/img/cart.png' width='50' height='auto' border='0' alt='바로구매'></a></td>"+
            				"		</tr>"+
            				"		<tr>"+
            				"			<td height='10'></td>"+
            				"		</tr>"+
            				"		<tr>"+
            				"			<td height='40' bgcolor='ffffff' colspan='3'></td>"+
            				"		</tr>"+
            				"	</form>"+
            				"</table>"+
            				"			</td><td width='40'></td>"+
            				
            				
		            				
		            		"<td width='418' valign='top'>"+
		    				"<table cellpadding='0' cellspacing='0' border='0' align='center' width='100%' style='max-width:418px;' bgcolor='f2f2f2'>"+
		    				"	<form method=post action='/order/cart_view.html'>"+
		    				"	<input type=hidden name='link_val' value='http://'>"+
		    				"		<tr>"+
		    				"			<td height='10'></td>"+
		    				"		</tr>"+
		    				"		<tr>"+
		    				"			<td width='10'></td>"+
		    				"			<td align='center'><a href='/shop_project/main?menu=p_detail?gid="+goodslist[i*4+1].product_id+"'><img src='http://www.schezade.co.kr/"+goodslist[i*4+1].product_image+"' width='100%' height='100%' style='max-width: 400px; max-height: 400px;' border='0' /></a></td>"+
		    				"			<td width='10'></td>"+
		    				"		</tr>"+
		    				"		<tr>"+
		    				"			<td align='center' height='150' colspan='3'>"+
		    				"				<table cellpadding='0' cellspacing='0' align='center' border='0' width='90%'>"+
		    				"					<tr>"+
		    				"						<td align='center'>"+
		    				"							<p style='line-height: 1.7; test-align: center;'><span style='font-family: Noto Sans KR, sans-serif; font-size: 12pt; font-weight: 300; color: #000;'><br>"+goodslist[i*4+1].product_brand+"</span>"+
		    				"				<span style='font-family: Noto Sans KR, sans-serif; font-size: 15pt; font-weight: 500; color: #000;'><br><a href='/goods/g_detail.html?gid=3506'>"+goodslist[i*4+1].product_name+"</a></span>"+
		    				"		     <br><span style='font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 8pt; color: #000;'>"+
		    				"			 [청음가능]</span>"+
		    				"				<span style='font-family: Noto Sans KR, sans-serif; font-size: 12pt; font-weight: 500; color: #000;'><br><br>"+
		    				"				<b></b>"+goodslist[i*4+1].product_price+"원</b>"+
		    				"				</span>				"+		
		    				"				</p>"+
		    				"						</td>"+
		    				"					</tr>"+
		    				"				</table>"+
		    				"			</td>"+
		    				"		</tr>		"+
		    				"<tr>"+
		    				"			<td align='center' height='80' valign='middle' colspan='3'><a href='/goods/g_detail.html?gid=3506'><img src='<%=respath %>/img/cart.png' width='50' height='auto' border='0' alt='바로구매'></a></td>"+
		    				"		</tr>"+
		    				"		<tr>"+
		    				"			<td height='10'></td>"+
		    				"		</tr>"+
		    				"		<tr>"+
		    				"			<td height='40' bgcolor='ffffff' colspan='3'></td>"+
		    				"		</tr>"+
		    				"	</form>"+
		    				"</table>"+
		    				"			</td><td width='40'></td>"+
		    				
		    				
		    				
		    				"<td width='418' valign='top'>"+
		    				"<table cellpadding='0' cellspacing='0' border='0' align='center' width='100%' style='max-width:418px;' bgcolor='f2f2f2'>"+
		    				"	<form method=post action='/order/cart_view.html'>"+
		    				"	<input type=hidden name='link_val' value='http://'>"+
		    				"		<tr>"+
		    				"			<td height='10'></td>"+
		    				"		</tr>"+
		    				"		<tr>"+
		    				"			<td width='10'></td>"+
		    				"			<td align='center'><a href='/shop_project/main?menu=p_detail?gid="+goodslist[i*4+2].product_id+"'><img src='http://www.schezade.co.kr/"+goodslist[i*4+2].product_image+"' width='100%' height='100%' style='max-width: 400px; max-height: 400px;' border='0' /></a></td>"+
		    				"			<td width='10'></td>"+
		    				"		</tr>"+
		    				"		<tr>"+
		    				"			<td align='center' height='150' colspan='3'>"+
		    				"				<table cellpadding='0' cellspacing='0' align='center' border='0' width='90%'>"+
		    				"					<tr>"+
		    				"						<td align='center'>"+
		    				"							<p style='line-height: 1.7; test-align: center;'><span style='font-family: Noto Sans KR, sans-serif; font-size: 12pt; font-weight: 300; color: #000;'><br>"+goodslist[i*4+2].product_brand+"</span>"+
		    				"				<span style='font-family: Noto Sans KR, sans-serif; font-size: 15pt; font-weight: 500; color: #000;'><br><a href='/goods/g_detail.html?gid=3506'>"+goodslist[i*4+2].product_name+"</a></span>"+
		    				"		     <br><span style='font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 8pt; color: #000;'>"+
		    				"			 [청음가능]</span>"+
		    				"				<span style='font-family: Noto Sans KR, sans-serif; font-size: 12pt; font-weight: 500; color: #000;'><br><br>"+
		    				"				<b></b>"+goodslist[i*4+2].product_price+"원</b>"+
		    				"				</span>				"+		
		    				"				</p>"+
		    				"						</td>"+
		    				"					</tr>"+
		    				"				</table>"+
		    				"			</td>"+
		    				"		</tr>		"+
		    				"<tr>"+
		    				"			<td align='center' height='80' valign='middle' colspan='3'><a href='/goods/g_detail.html?gid=3506'><img src='<%=respath %>/img/cart.png' width='50' height='auto' border='0' alt='바로구매'></a></td>"+
		    				"		</tr>"+
		    				"		<tr>"+
		    				"			<td height='10'></td>"+
		    				"		</tr>"+
		    				"		<tr>"+
		    				"			<td height='40' bgcolor='ffffff' colspan='3'></td>"+
		    				"		</tr>"+
		    				"	</form>"+
		    				"</table>"+
		    				"			</td><td width='40'></td>"+
		    				
		    				
		    				
		    				
		    				"<td width='418' valign='top'>"+
		    				"<table cellpadding='0' cellspacing='0' border='0' align='center' width='100%' style='max-width:418px;' bgcolor='f2f2f2'>"+
		    				"	<form method=post action='/order/cart_view.html'>"+
		    				"	<input type=hidden name='link_val' value='http://'>"+
		    				"		<tr>"+
		    				"			<td height='10'></td>"+
		    				"		</tr>"+
		    				"		<tr>"+
		    				"			<td width='10'></td>"+
		    				"			<td align='center'><a href='/shop_project/main?menu=p_detail?gid="+goodslist[i*4+3].product_id+"'><img src='http://www.schezade.co.kr/"+goodslist[i*4+3].product_image+"' width='100%' height='100%' style='max-width: 400px; max-height: 400px;' border='0' /></a></td>"+
		    				"			<td width='10'></td>"+
		    				"		</tr>"+
		    				"		<tr>"+
		    				"			<td align='center' height='150' colspan='3'>"+
		    				"				<table cellpadding='0' cellspacing='0' align='center' border='0' width='90%'>"+
		    				"					<tr>"+
		    				"						<td align='center'>"+
		    				"							<p style='line-height: 1.7; test-align: center;'><span style='font-family: Noto Sans KR, sans-serif; font-size: 12pt; font-weight: 300; color: #000;'><br>"+goodslist[i*4+3].product_brand+"</span>"+
		    				"				<span style='font-family: Noto Sans KR, sans-serif; font-size: 15pt; font-weight: 500; color: #000;'><br><a href='/goods/g_detail.html?gid=3506'>"+goodslist[i*4+3].product_name+"</a></span>"+
		    				"		     <br><span style='font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 8pt; color: #000;'>"+
		    				"			 [청음가능]</span>"+
		    				"				<span style='font-family: Noto Sans KR, sans-serif; font-size: 12pt; font-weight: 500; color: #000;'><br><br>"+
		    				"				<b></b>"+goodslist[i*4+3].product_price+"원</b>"+
		    				"				</span>				"+		
		    				"				</p>"+
		    				"						</td>"+
		    				"					</tr>"+
		    				"				</table>"+
		    				"			</td>"+
		    				"		</tr>		"+
		    				"<tr>"+
		    				"			<td align='center' height='80' valign='middle' colspan='3'><a href='/goods/g_detail.html?gid=3506'><img src='<%=respath %>/img/cart.png' width='50' height='auto' border='0' alt='바로구매'></a></td>"+
		    				"		</tr>"+
		    				"		<tr>"+
		    				"			<td height='10'></td>"+
		    				"		</tr>"+
		    				"		<tr>"+
		    				"			<td height='40' bgcolor='ffffff' colspan='3'></td>"+
		    				"		</tr>"+
		    				"	</form>"+
		    				"</table>"+
		    				"			</td></tr><tr>"
		            				           		
            		);
  		
            	}    
            }
            
            // 실패
            function errorCallback(err) {
                alert("실패");
   				console.log(JSON.stringify(start.param));
            }
        }
       
} 
</script>
<!-- 무한 스크롤 스크립트 End -->


<table cellpadding="0" cellspacing="0" align="center" border="0" width="100%">
	<tr>
		<td height="1" bgcolor="ebebeb"></td>
	</tr>
</table>
<div class="menuWrap" style="z-index:997;">
	<div class="blogmenu">
		<div class="category">
<table cellpadding="0" cellspacing="0" border="0" width="100%" height="100" background="<%=respath %>/img/goods_bg.png">
	<tr>
		<td width="95%">
			<table cellpadding="0" cellspacing="0" align="center" width="95%">
				<tr>
					<td height="50"></td>
				</tr>
				<tr>	
				<!--  상품 없을 시 표시 -->
					<c:if test="${fn:length(goodslist) == 0 }">
						<td><span style="margin-left:150px;font-size: 20px"><b><%=request.getParameter("ts_key") %>에 대한 검색결과가 없습니다</b></span><br><br><br></td>
					</c:if>
					<c:if test="${fn:length(goodslist) != 0 }">
						<td width="40%" align="left">
						<span style="font-family: Noto Sans KR, sans-serif; font-weight: 500; font-size: 10pt; color:#000;">　　·전체보기</span></a>
						</td>
						<td width="60%" align="right">
						          <!-- 검색 후  정렬 : 추가 구현 필요 ( 현재 검색은 goodsFind에서 처리 함 ) -->
						<a href='<%=contextpath +"/main?menu=goods&sort=toprelease" %>'><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">　·최근 등록 순　　</span></a>
						<a href='<%=contextpath +"/main?menu=goods&sort=topprice" %>'  ><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">　·가격높은 순　　</span></a>
						<a href='<%=contextpath +"/main?menu=goods&sort=underprice" %>' ><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">　·가격낮은 순　　</span></a>
						<a href='<%=contextpath +"/main?menu=goods&sort=topsell" %>'><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">　·인기순　　</span></a>
						<%-- <a href='<%=contextpath +"/main?menu=goods" %>'><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">　·멤버십 할인상품</span> --%></a>
						</td>
					</c:if>					
				</tr>
			</table>
		</td>
	</tr>
</table>
		</div>
	</div>
</div>

<!-- 상품 리스트 시작 -->

<div class="main4">
	<table cellpadding="0" cellspacing="0" border="0" align="center" width="95%" id="repeat">
	<tr> <!-- 4번째 부터 닫기 -->
	<!--  반복 시작 -->
<c:forEach items="${goodslist }" var="vo" varStatus="status">
			<td width="418" valign="top">


<table cellpadding="0" cellspacing="0" border="0" align="center" width="100%" style="max-width:418px;" bgcolor="f2f2f2">
	<!--<form method=post action="/order/cart_view.html">
 	<input type=hidden name='cart_mode' value="add">
	<input type=hidden name='gid' value="aZyRowE1ND27E1ND27">
	<input type=hidden name='cart_g_price' value="a5uanZWU">
	<input type=hidden name='cart_g_name' value="d7ylsrA1B920pj8cr8ech912A1B920jR1UKV0rHeA1C910rVhc1LTEdRYwzHecW8imBlbLT0dXhpFsE1ND27"> -->

	<!-- <input type=hidden name='link_val' value=""> -->
	<input type=hidden name='link_val' value="http://">
		<tr>
			<td height="10"></td>
		</tr>
		<tr>
			<td width="10"></td>
			<td align="center"><a href='/shop_project/main?menu=p_detail?gid=${vo.product_id }'><img src='http://www.schezade.co.kr/${vo.product_image}' width="100%" height="100%" style="max-width: 400px; max-height: 400px;" border="0" /></a></td>
			<td width="10"></td>
		</tr>
		<tr>
			<td align="center" height="150" colspan="3">
				<table cellpadding="0" cellspacing="0" align="center" border="0" width="90%">
					<tr>
						<td align="center">
							<p style="line-height: 1.7; test-align: center;"><span style="font-family: Noto Sans KR, sans-serif; font-size: 12pt; font-weight: 300; color: #000;"><br>${vo.product_brand }</span>
				<span style="font-family: Noto Sans KR, sans-serif; font-size: 15pt; font-weight: 500; color: #000;"><br><a href="/goods/g_detail.html?gid=3506">${vo.product_name }</a></span>
		     <br><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 8pt; color: #000;">
			 [청음가능]</span>
				<span style="font-family: Noto Sans KR, sans-serif; font-size: 12pt; font-weight: 500; color: #000;"><br><br>
				<b></b>${vo.product_price}원</b>
				</span>						
				
				</p>
						</td>
					</tr>
				</table>
			</td>
		</tr>
			
<tr>
			<td align="center" height="80" valign="middle" colspan="3"><a class='cart_add' value="${vo.product_id }" href=""><img src='<%=respath %>/img/cart.png' width="50" height="auto" border="0" alt='바로구매'></a></td>
		</tr>

		<tr>
			<td height="10"></td>
		</tr>
		<tr>
			<td height="40" bgcolor="ffffff" colspan="3"></td>
		</tr>
<!-- 	</form> -->
</table>


			</td>
			<c:choose>
					<c:when test="${status.count%4==0}"> 
						</tr><tr>
					</c:when>
					<c:otherwise>
						<td width='40'></td>
					</c:otherwise>
			</c:choose>
	 
</c:forEach> 
			<!-- 반복 끝 -->
	
	<!-- 로딩 -->		
	</table>
</div>

<div id="dataload" style='display:none;text-align: center'>
			<div id="wrap-loading">
				 <img src='<%=request.getContextPath() + "/resources/loadingimg.gif" %>' />
			 </div>
</div>
