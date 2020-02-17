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
<!-- ���� ��ũ�� ��ũ��Ʈ start -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script>
 var count = 0;
$(document).ready(function($){
    start.init();
    
    $(".cart_add").on("click", function(e){
    	e.preventDefault();
    	var gid = $(this).attr("value");
    	alert("���Ͷ� �ù�");
    	
    	if($.cookie('product') != null ) {
    		if($.cookie('product').indexOf( gid ) != -1) {
    			alert("�̹� ��ٱ��Ͽ� ��ϵǾ� ����");
    		} else {
            	$.cookie('product', $.cookie('product')+","+gid+":1", { expires: 7 , path: '/' });
            	alert("��ٱ��Ͽ� ����Ǿ����ϴ�.");
    		}

    	} else {
        	$.cookie('product', gid+":1", { expires: 7 , path: '/' });
        	alert("��ٱ��Ͽ� ����Ǿ����ϴ�.");
    	}

    	//��Ű �б�
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
            // ���� ��ũ��
            $(window).scroll(function() {
            	
            	//�α� 
            	//console.log("documentHeight:" + $(document).height() + " | scrollTop:" + $(window).scrollTop() + " | windowHeight: " +$(window).height() );
            	
                // �� ������ ��ũ���� ������� if���� ž�ϴ�.
                if ( $(window).scrollTop() == $(document).height() - $(window).height() ) { 
                    start.param.curPage++; // ���� ���������� +1 ó��.
                    start.testAjax(); //ajax ȣ��
                } 
                
            }); 
        },
        // ���� ��ũ�� ajax ��û
        testAjax : function() {
            $.ajax({
                type     : 'get',
                url      : 'goodsScroll?curPage='+start.param.curPage+'&pageListSize='+start.param.pageListSize+'&sort='+sort+"&ts_key="+ts_key,
                //data     : JSON.stringify(start.param), // ���� ������ ��ȣ�� ������ ����� ������ ���ϴ�.
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
            // ����
            function successCallback(goodslist) {
   				//alert("���� = start.param.curPage:" + start.param.curPage);
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
            				"			 [û������]</span>"+
            				"				<span style='font-family: Noto Sans KR, sans-serif; font-size: 12pt; font-weight: 500; color: #000;'><br><br>"+
            				"				<b></b>"+goodslist[i*4+0].product_price+"��</b>"+
            				"				</span>				"+		
            				"				</p>"+
            				"						</td>"+
            				"					</tr>"+
            				"				</table>"+
            				"			</td>"+
            				"		</tr>		"+
            				"<tr>"+
            				"			<td align='center' height='80' valign='middle' colspan='3'><a href='/goods/g_detail.html?gid=3506'><img src='<%=respath %>/img/cart.png' width='50' height='auto' border='0' alt='�ٷα���'></a></td>"+
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
		    				"			 [û������]</span>"+
		    				"				<span style='font-family: Noto Sans KR, sans-serif; font-size: 12pt; font-weight: 500; color: #000;'><br><br>"+
		    				"				<b></b>"+goodslist[i*4+1].product_price+"��</b>"+
		    				"				</span>				"+		
		    				"				</p>"+
		    				"						</td>"+
		    				"					</tr>"+
		    				"				</table>"+
		    				"			</td>"+
		    				"		</tr>		"+
		    				"<tr>"+
		    				"			<td align='center' height='80' valign='middle' colspan='3'><a href='/goods/g_detail.html?gid=3506'><img src='<%=respath %>/img/cart.png' width='50' height='auto' border='0' alt='�ٷα���'></a></td>"+
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
		    				"			 [û������]</span>"+
		    				"				<span style='font-family: Noto Sans KR, sans-serif; font-size: 12pt; font-weight: 500; color: #000;'><br><br>"+
		    				"				<b></b>"+goodslist[i*4+2].product_price+"��</b>"+
		    				"				</span>				"+		
		    				"				</p>"+
		    				"						</td>"+
		    				"					</tr>"+
		    				"				</table>"+
		    				"			</td>"+
		    				"		</tr>		"+
		    				"<tr>"+
		    				"			<td align='center' height='80' valign='middle' colspan='3'><a href='/goods/g_detail.html?gid=3506'><img src='<%=respath %>/img/cart.png' width='50' height='auto' border='0' alt='�ٷα���'></a></td>"+
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
		    				"			 [û������]</span>"+
		    				"				<span style='font-family: Noto Sans KR, sans-serif; font-size: 12pt; font-weight: 500; color: #000;'><br><br>"+
		    				"				<b></b>"+goodslist[i*4+3].product_price+"��</b>"+
		    				"				</span>				"+		
		    				"				</p>"+
		    				"						</td>"+
		    				"					</tr>"+
		    				"				</table>"+
		    				"			</td>"+
		    				"		</tr>		"+
		    				"<tr>"+
		    				"			<td align='center' height='80' valign='middle' colspan='3'><a href='/goods/g_detail.html?gid=3506'><img src='<%=respath %>/img/cart.png' width='50' height='auto' border='0' alt='�ٷα���'></a></td>"+
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
            
            // ����
            function errorCallback(err) {
                alert("����");
   				console.log(JSON.stringify(start.param));
            }
        }
       
} 
</script>
<!-- ���� ��ũ�� ��ũ��Ʈ End -->


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
				<!--  ��ǰ ���� �� ǥ�� -->
					<c:if test="${fn:length(goodslist) == 0 }">
						<td><span style="margin-left:150px;font-size: 20px"><b><%=request.getParameter("ts_key") %>�� ���� �˻������ �����ϴ�</b></span><br><br><br></td>
					</c:if>
					<c:if test="${fn:length(goodslist) != 0 }">
						<td width="40%" align="left">
						<span style="font-family: Noto Sans KR, sans-serif; font-weight: 500; font-size: 10pt; color:#000;">��������ü����</span></a>
						</td>
						<td width="60%" align="right">
						          <!-- �˻� ��  ���� : �߰� ���� �ʿ� ( ���� �˻��� goodsFind���� ó�� �� ) -->
						<a href='<%=contextpath +"/main?menu=goods&sort=toprelease" %>'><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">�����ֱ� ��� ������</span></a>
						<a href='<%=contextpath +"/main?menu=goods&sort=topprice" %>'  ><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">�������ݳ��� ������</span></a>
						<a href='<%=contextpath +"/main?menu=goods&sort=underprice" %>' ><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">�������ݳ��� ������</span></a>
						<a href='<%=contextpath +"/main?menu=goods&sort=topsell" %>'><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">�����α������</span></a>
						<%-- <a href='<%=contextpath +"/main?menu=goods" %>'><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#000;">��������� ���λ�ǰ</span> --%></a>
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

<!-- ��ǰ ����Ʈ ���� -->

<div class="main4">
	<table cellpadding="0" cellspacing="0" border="0" align="center" width="95%" id="repeat">
	<tr> <!-- 4��° ���� �ݱ� -->
	<!--  �ݺ� ���� -->
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
			 [û������]</span>
				<span style="font-family: Noto Sans KR, sans-serif; font-size: 12pt; font-weight: 500; color: #000;"><br><br>
				<b></b>${vo.product_price}��</b>
				</span>						
				
				</p>
						</td>
					</tr>
				</table>
			</td>
		</tr>
			
<tr>
			<td align="center" height="80" valign="middle" colspan="3"><a class='cart_add' value="${vo.product_id }" href=""><img src='<%=respath %>/img/cart.png' width="50" height="auto" border="0" alt='�ٷα���'></a></td>
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
			<!-- �ݺ� �� -->
	
	<!-- �ε� -->		
	</table>
</div>

<div id="dataload" style='display:none;text-align: center'>
			<div id="wrap-loading">
				 <img src='<%=request.getContextPath() + "/resources/loadingimg.gif" %>' />
			 </div>
</div>
