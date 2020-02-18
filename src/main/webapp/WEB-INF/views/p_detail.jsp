<%@page import="com.spring.shop_project.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String contextpath = request.getContextPath();
	String respath = request.getContextPath() + "/resources/";
%>

<html>
<head>
<script>
$(document).ready(function($){
    
    $("#cart_add").on("click", function(e){
    	e.preventDefault();
    	var gid = ${p_info.product_id };
    	
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
</script>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
<link rel="shortcut icon" href="/images/favicon.ico"  type="image/x-icon">


<table cellpadding="0" cellspacing="0" align="center" border="0" width="100%">
	<tr>
		<td height="1" bgcolor="ebebeb"></td>
	</tr>
</table>


<script>

function menu_open13(){
    cate_div13.style.display = "block";
   cate_div14.style.display = "none";
   cate_div15.style.display = "none";
}
function menu_open14(){
    cate_div13.style.display = "none";
   cate_div14.style.display = "block";
   cate_div15.style.display = "none";
}
function menu_open15(){
    cate_div13.style.display = "none";
   cate_div14.style.display = "none";
   cate_div15.style.display = "block";
}
</script>



<script type="text/javascript">
$(document).ready(function(){
    var nav = $('.detail');
    $(window).scroll(function () {
        if ($(this).scrollTop() > 1130) {
            nav.addClass("float");
        }else {
            nav.removeClass("float");
        }
    });
});
</script>

<script type="text/javascript">
$(document).ready(function(){
    var nav = $('.detailmain');
    $(window).scroll(function () {
        if ($(this).scrollTop() > 1300) {
            nav.addClass("floatmain");
        }else {
            nav.removeClass("floatmain");
        }
    });
});
</script>

<style>
.detailmain   {  }
.floatmain { top:40px; width:100%; position:fixed; z-index:9999; }
.blogmenu1   { margin:0 0 0px; padding:0px 0; width:100%; height: 30px; border-bottom:0px solid #666; }
</style>

<style>
.detail   {  }
.float { top:80px; width:100%; position:fixed; z-index:9999; }
.blogmenu2   { margin:0 0 0px; padding:0px 0; width:100%; height: 30px; border-bottom:0px solid #666; }
</style>


<!----1200이상------>
<div class="main4">
	<table cellpadding="0" cellspacing="0" align="center" width="95%">
		<tr>
			<td height="50"></td>
		</tr>
	</table>
		<table cellpadding="0" cellspacing="0" width="1200" align="center">
		<tr>
			<td width="700" valign="top" align="left">
				<table cellpadding="0" cellspacing="0" align="left" border="0">
					<tr>
						<td width="600" align="left">    <!-- #region Jssor Slider Begin -->

    <!-- Generator: Jssor Slider Maker -->
    <!-- Source: http://www.jssor.com/demos/image-slider-2.slider -->
    
    <!-- This demo works without jquery library. -->

     <script type="text/javascript" src="<%=respath%>js/jssor.slider.min.js"></script>
    <!-- use jssor.slider.debug.js instead for debug -->
    <script>
        jssor_1_slider_init = function() {
            
            var jssor_1_options = {
              $AutoPlay: true,
              $ArrowNavigatorOptions: {
                $Class: $JssorArrowNavigator$
              },
              $ThumbnailNavigatorOptions: {
                $Class: $JssorThumbnailNavigator$,
                $Cols: 10,
                $SpacingX: 3,
                $SpacingY: 3,
                $Align: 260
              }
            };
            
            var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);
            
            //responsive code begin
            //you can remove responsive code if you don't want the slider scales while window resizing
            function ScaleSlider() {
                var refSize = jssor_1_slider.$Elmt.parentNode.clientWidth;
                if (refSize) {
                    refSize = Math.min(refSize, 570);
                    jssor_1_slider.$ScaleWidth(refSize);
                }
                else {
                    window.setTimeout(ScaleSlider, 30);
                }
            }
            ScaleSlider();
            $Jssor$.$AddEvent(window, "load", ScaleSlider);
            $Jssor$.$AddEvent(window, "resize", ScaleSlider);
            $Jssor$.$AddEvent(window, "orientationchange", ScaleSlider);
            //responsive code end
        };
    </script>

    <style>
        
        /* jssor slider arrow navigator skin 02 css */
        /*
        .jssora02l                  (normal)
        .jssora02r                  (normal)
        .jssora02l:hover            (normal mouseover)
        .jssora02r:hover            (normal mouseover)
        .jssora02l.jssora02ldn      (mousedown)
        .jssora02r.jssora02rdn      (mousedown)
        */
        .jssora02l, .jssora02r {
            display: block;
            position: absolute;
            /* size of arrow element */
			margin-top: 300px;
            width: 55px;
            height: 55px;
            cursor: pointer;
            background: url('<%=respath %>img/goods/arrow.png') no-repeat;
            overflow: hidden;
        }
        .jssora02l { background-position: -3px -33px; }
        .jssora02r { background-position: -63px -33px; }
        .jssora02l:hover { background-position: -123px -33px; }
        .jssora02r:hover { background-position: -183px -33px; }
        .jssora02l.jssora02ldn { background-position: -3px -33px; }
        .jssora02r.jssora02rdn { background-position: -63px -33px; }

        /* jssor slider thumbnail navigator skin 03 css */
        /*
        .jssort03 .p            (normal)
        .jssort03 .p:hover      (normal mouseover)
        .jssort03 .pav          (active)
        .jssort03 .pdn          (mousedown)
        */
        
        .jssort03 .p {
            position: absolute;
            top: 0;
            left: 0;
            width: 90px;
            height: 90px;
        }
        
        .jssort03 .t {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border: none;
        }
        
        .jssort03 .w, .jssort03 .pav:hover .w {
            position: absolute;
            width: 90px;
            height: 90px;
            border: white 0px dashed;
            box-sizing: content-box;
        }
        
        .jssort03 .pdn .w, .jssort03 .pav .w {
            border-style: solid;
        }
        
        .jssort03 .c {
            position: absolute;
            top: 0;
            left: 0;
            width: 90px;
            height: 90px;
            background-color: #000;
        
            filter: alpha(opacity=45);
            opacity: .45;
            transition: opacity .6s;
            -moz-transition: opacity .6s;
            -webkit-transition: opacity .6s;
            -o-transition: opacity .6s;
        }
        
        .jssort03 .p:hover .c, .jssort03 .pav .c {
            filter: alpha(opacity=0);
            opacity: 0;
        }
        
        .jssort03 .p:hover .c {
            transition: none;
            -moz-transition: none;
            -webkit-transition: none;
            -o-transition: none;
        }
        
        * html .jssort03 .w {
            width /**/: 90px;
            height /**/: 90px;
        }
        
    </style>


    <div id="jssor_1" style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 570px; height: 690px; overflow: hidden; visibility: hidden; z-index: 1;">
        <!-- Loading Screen -->
        <div data-u="loading" style="position: absolute; top: 0px; left: 0px;">
            <div style="filter: alpha(opacity=70); opacity: 0.7; position: absolute; display: block; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
            <div style="position:absolute;display:block;background:url('/img/loading.gif') no-repeat center center;top:0px;left:0px;width:100%;height:100%;"></div>
        </div>
        <div data-u="slides" style="cursor: default; position: relative; top: 0px; left: 0px; width: 570px; height: 570px; overflow: hidden;">
<!--------------------썸네일 570사이즈 기준으로 추가될 때마다 아래 소스가 반복 시작---------------------->

			<!-- 카운트 만큼 반복  -->
			<% 
			
				ProductVO vo = (ProductVO)request.getAttribute("p_info");
			
				String[] splimg = vo.getProduct_image().split(", ");
				for(String str : splimg) {
					out.print("<div data-p='112.50' style='display: none;'>"+
			                "<img data-u='image' src='http://www.schezade.co.kr/"+str+"' />"+
			                "<img data-u='thumb' src='http://www.schezade.co.kr/"+str+"' />"+
			                "</div>");
				}
				
			%>
            
<!--------------------썸네일 570사이즈 기준으로 추가될 때마다 아래 소스가 반복 끝---------------------->
           

        </div>
        <!-- Thumbnail Navigator -->
        <div u="thumbnavigator" class="jssort03" style="position:absolute;left:0px;bottom:0px;width:90px;height:90px;" data-autocenter="1">
            <div style="position: absolute; top: 0; left: 0; width: 100%; height:100%; background-color: #000; filter:alpha(opacity=30.0); opacity:0;"></div>
            <!-- Thumbnail Item Skin Begin -->
            <div u="slides" style="cursor: default;">
                <div u="prototype" class="p">
                    <div class="w">
                        <div u="thumbnailtemplate" class="t"></div>
                    </div>
                    <div class="c"></div>
                </div>
            </div>
            <!-- Thumbnail Item Skin End -->
        </div>
        <!-- Arrow Navigator -->
        <span data-u="arrowleft" class="jssora02l" style="top:0px;left:8px;width:55px;height:55px;" data-autocenter="2"></span>
        <span data-u="arrowright" class="jssora02r" style="top:0px;right:8px;width:55px;height:55px;" data-autocenter="2"></span>
    </div>
    <script>
        jssor_1_slider_init();
    </script>

    <!-- #endregion Jssor Slider End --></td>
					</tr>
					<tr>
						<td height="100"></td>
					</tr>
				</table>
			</td>
			<td width="500" valign="top">
				<table cellpadding="0" cellspacing="0" border="0" align="center" width="500">
					<tr>
						<td align="left" style="padding-top: 10px;"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 400; font-size: 20pt; color:#939393;"></span>
							<span style="font-family: Noto Sans KR, sans-serif; font-weight: 500; font-size: 20pt; color:#000;"><br>${p_info.product_brand } ${p_info.product_category } (${p_info.product_name })</span>

<%-- 															<br><img src="<%=respath %>img/goods/pakage_gift.gif" width="6" height="8" border="0"><font class="text14" color="#c25943"> 소니 정품등록 이벤트</font> --%>
							

							 <img src='<%=respath %>img/goods/goods_exhibit.gif' align=absmiddle border=0></a>																												 
<%-- 							 <a href="/board/old_goods/g_detail2.html?no=2453"><img src='<%=respath %>img/goods/icon_sale.jpg'  align=absmiddle border=0></a> --%>
						</td>
					</tr>
					<tr>
						<td height="20"></td>
					</tr>
					<tr>
						<td height="3" bgcolor="#000000"></td>
					</tr>
					<tr>
						<td height="20"></td>
					</tr>
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0" align="center" border="0">


								

									
										<tr>
											<td width="150" align="left">
												<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#000;">소비자가격</span>
											</td>
											<td width="350" align="left" colspan="2">
												<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#939393;">${p_info.convert_price } 원</span>
											</td>
										</tr>
									
																			<tr>
											<td width="150" align="left" height="50">
												<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#000;">판매가격</span>
											</td>
											<td width="150" align="left">
												<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#939393;">${p_info.convert_price } 원</span>
											</td>
											<td width="200" align="left"><a href="#" onclick="javascript:window.open('<%=contextpath%>/images/index/banner_NaSeI901.jpg','open','width=600,height=655,top=10,left=10,scrollbars=no')"><img src="<%=respath %>img/goods/cardinfo.jpg" border="0" alt="무이자할부안내" /></a></td>
										</tr>
									
									<tr>
										<td height="10"></td>
									</tr>


								<tr>
									<td height="10"></td>
								</tr>
								<tr>
									<td height="1" bgcolor="#f2f2f2" colspan="3"></td>
								</tr>
								<tr>
									<td height="20"></td>
								</tr>
								<tr>
									<td width="150" align="left">
										<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#000;">제조사</span>
									</td>
									<td width="150" align="left"><c:set var = "brand" value = "${p_info.product_brand}"/> <c:set var = "legnth" value = "${fn:length(brand)}"/><c:set var = "brands" value = "${fn:substring(brand, 1, legnth-1)} " />
										<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#000;">${brands }</span>
									</td>
									<td width="200" align="left">
																			</td>
								</tr>
																<tr>
									<td width="150" align="left" height="50">
										<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#000;">상품문의</span>
									</td>
									<td width="350" align="left" colspan="2"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#000;">00-0000-0000 ㅣ <a href="javascript:helpmail_goods()">help@stshop.co.kr</a></span></td>
								</tr>
								<tr>
									<td height="10"></td>
								</tr>
								

								<!--form name=input_cart method=post action="/order/cart_view.html"-->
								<form name=input_cart method=post action="main?menu=cart_order" >
<!-- 									<input type=hidden name='mode' value="cart_add"> -->
									<input type=hidden name='card_add_mode' value="add">
									<input type=hidden name='gid' value="${p_info.product_id }">
									<input type=hidden name='cart_g_price' value="${p_info.convert_price }">
									<input type=hidden name='product_name' value="${p_info.product_name }">
									<input type=hidden name='link_val' value="">
																			<tr>
											<td height="100" bgcolor="#f4f4f4" colspan="3">

												<table cellspacing="0" cellpadding="0" align="center" border="0">

																												<tr>
																<td width="20"></td>
																<td width="130" align="left" height="40">
<!-- 																	<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#000;">·옵션</span> -->
																</td>
																<td width="330" align="left" colspan="2">
<!-- 																	<select name="option" -->
<!-- 																			style="BORDER: #ebebeb 1px solid; text-align:center; max-width: 350px; width: 100%; height:25px; text-indent: 10;" -->
<!-- 																			placeholder="옵션 선택"> -->
<!-- 																		<option value=''>옵션을 선택하세요</option> -->
<!-- 																		<option value="18959" >블랙</option><option value="18960" >실버</option>																</td> -->
																<td width="20"></td>
															</tr>
																													

													<!--수량-->

													<script>
														//Trim
														function trim2(str) {
															len = str.length;
															for (i = 0; i < len; i++) {
																if (str.substring(0, 1) == " ") str = str.substring(1);
																else break;
															}

															len = str.length;
															for (i = len; i > 0; i--) {
																if (str.substring(i - 1) == " ") str = str.substring(0, i - 1);
																else break;
															}
															return str;
														}

														function change_val(val) {
															var f = document.input_cart;
															var num2;

															if (f.num.value > 0) {
																f.num.value = eval(f.num.value) + eval(val);
															} else {
																alert('1개이상 주문가능 합니다.');
															}
															ck_val2();
														}

														function ck_val2() {
															var f = document.input_cart;
															var value = trim2(f.num.value);
															f.num.value = value;

															if (!ck_num2(value)) {
																alert('수량은 숫자로 입력해 주세요');
																f.num.value = f.o_num.value;
																return;
															} else {
																if (value < 1) {
																	alert('1개 이상 주문가능 합니다.');
																	f.num.value = 1;
																	return;
																}

																f.o_num.value = value;
																return true;
															}
														}

														function ck_num2(str) {
															var num = '1234567890';

															var i;
															for (i = 0; i < str.length; i++) {
																if (num.indexOf(str.substring(i, i + 1)) < 0) {
																	break;
																}
															}

															if (i != str.length) {
																return;
															} else {
																return true;
															}
														}

														function img_ch_qty(img_id, img_url) {
															//alert(img_id);
															var img_qty = img_id;
															img_qty.src = img_url;
														}

														function g_detail_cart_add_pc(card_add_mode) {
															var f = document.input_cart;
// 																														if (f.option.options[0].selected == true) {
// 																alert('옵션을 선택해 주세요');
// 																return;
// 															}
															
															
															f.card_add_mode.value = card_add_mode;

															f.submit();
														}
													</script>

													<tr>
														<td width="20"></td>
														<td width="130" align="left" height="40">
															<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#000;">·수량</span>
														</td>
														<td width="330" align="left" colspan="2">
															<table border="0" cellspacing="0" cellpadding="0">
																<tr>
																	<td><img src="<%=respath %>img/goods/minus.jpg" width="25" height="25" border="0"
																			 onclick="javascript:change_val('-1')" style='cursor:hand'
																			 onmouseover="img_ch_qty(this,'<%=respath %>img/goods/minus.jpg');"
																			 onmouseout="img_ch_qty(this,'<%=respath %>img/goods/minus.jpg');"></td>
																	<td width=50>
																		<input type=hidden name="o_num" value="1">
																		<input type='text' name='num' value='1'
																			   style='BORDER-LEFT: #fff 1px solid; BORDER-RIGHT: #fff 1px solid; BORDER-TOP: #ebebeb 1px solid; BORDER-BOTTOM: #ebebeb 1px solid; text-align:center; color: #d2d0d0; HEIGHT: 25px; WIDTH: 80px'
																			   maxlength='4' onchange="ck_val2()">
																	</td>
																	<td><img src="<%=respath %>img/goods/plus.jpg" width="25" height="25" border="0"
																			 onclick="javascript:change_val('+1');" style='cursor:hand'
																			 onmouseover="img_ch_qty(this,'<%=respath %>img/goods/plus.jpg');"
																			 onmouseout="img_ch_qty(this,'<%=respath %>img/goods/plus.jpg');"></td>
																</tr>
															</table>
														</td>
														<td width="20"></td>
													</tr>

												</table>
											</td>
										</tr>
										<tr>
											<td height="133" colspan="3" align="right">
												<span style="font-family: Noto Sans KR, sans-serif; font-weight: 500; font-size: 30pt; color:#000;">${p_info.convert_price }</span>
												<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 20pt; color:#000;">원</span>
											</td>
										</tr>
										<tr>
											<td colspan="3">
												<table cellpadding="0" cellspacing="0" border="0">
													<tr>
														<td width="240"><a href='<%=contextpath +"/main?menu=cart_order&product_list="%>${p_info.product_id }:1'><img src="<%=respath %>img/goods/buy.jpg" border="0"/></a></td>
														<td width="20"></td>
														<td width="240"><a id="cart_add" href="#"><img src="<%=respath %>img/goods/cart.jpg" border="0"/></a>
														</td>
													</tr>
												</table>
											</td>
										</tr>

										
																	</form>


							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<a name="detailmain"><div style="position: absolute; background: #fff; width: 100px; height: 50px; opacity: 0;"></div></a>
	<table cellpadding="0" cellspacing="0" align="center" width="95%">
		<tr>
			<td height="50"></td>
		</tr>
	</table>
	<!-------------------------쿠폰----------------------->
		<!-------------------------쿠폰----------------------->
	<table cellpadding="0" cellspacing="0" align="center" width="95%">
		<tr>
			<td height="100"></td>
		</tr>
	</table>
	<div class="detailmain" style="z-index:99;">
		<div class="blogmenu1">
			<table cellpadding="0" cellspacing="0" align="center" width="100%">
				<tr>
					<td height="50">
						<div id="cate_div13">
<table cellpadding="0" cellspacing="0" border="0" width="100%" height="50" align="center" background="<%=respath %>img/dbg.jpg">
	<tr>
		<td align="center">
			<table cellpadding="0" cellspacing="0" border="0" width="1200" height="50" align="center">
				<tr>
					<td><a href="#detailmain" onclick="menu_open13();" style="cursor:hand"><img src="<%=respath %>img/detail.jpg" border="0"></a></td><td><a href="#reviewmain" onclick="menu_open14();" style="cursor:hand"><img src="<%=respath %>img/info_1.jpg" border="0"></a></td><td><a href="#delimain" onclick="menu_open15();" style="cursor:hand"><img src="<%=respath %>img/deli_1.jpg" border="0"></a></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</div>
<div id="cate_div14" style="display: none;">
<table cellpadding="0" cellspacing="0" border="0" width="100%" height="50" align="center" background="<%=respath %>img/dbg.jpg">
	<tr>
		<td align="center">
			<table cellpadding="0" cellspacing="0" border="0" width="1200" height="50" align="center">
				<tr>
					<td><a href="#detailmain" onclick="menu_open13();" style="cursor:hand"><img src="<%=respath %>img/detail_1.jpg" border="0"></a></td><td><a href="#reviewmain" onclick="menu_open14();" style="cursor:hand"><img src="<%=respath %>img/info.jpg" border="0"></a></td><td><a href="#delimain" onclick="menu_open15();" style="cursor:hand"><img src="<%=respath %>img/deli_1.jpg" border="0"></a></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</div>
<div id="cate_div15" style="display: none;">
<table cellpadding="0" cellspacing="0" border="0" width="100%" height="50" align="center" background="<%=respath %>img/dbg.jpg">
	<tr>
		<td align="center">
			<table cellpadding="0" cellspacing="0" border="0" width="1200" height="50" align="center">
				<tr>
					<td><a href="#detailmain" onclick="menu_open13();" style="cursor:hand"><img src="<%=respath %>img/detail_1.jpg" border="0"></a></td><td><a href="#reviewmain" onclick="menu_open14();" style="cursor:hand"><img src="<%=respath %>img/info_1.jpg" border="0"></a></td><td><a href="#delimain" onclick="menu_open16();" style="cursor:hand"><img src="<%=respath %>img/deli.jpg" border="0"></a></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</div>					</td>
				</tr>
			</table>
		</div>
	</div>
	<table cellpadding="0" cellspacing="0" align="center" width="95%">
		<tr>
			<td height="100"></td>
		</tr>
	</table>

	<!-----------------상품페이지 영역----------------->
	<table cellpadding="0" cellspacing="0" align="center" width="100%" height="auto" border="0">
		<tr>
			<td align="center">

				
<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr>
		<td>
			<table width=100% cellpadding="0" cellspacing="0" border="0" align="center">
				<tr><td height=20></td></tr>
	<tr>
	   <td   align="center">
	</tr>
	<tr><td height=5></td></tr>
					
				<tr><td height=15></td></tr>
			</table>
		</td>
	</tr>
</table>
<br>
<br>

				<p><br></p><br><table cellpadding="0" cellspacing="0" align="center" border="0">
<tr>
</tr>
<tr>
<!--  디테일     -->
<td><img src='${p_info.product_detail }'></td>
</table>



				<!-- 셋트에 포함된상품의 상세설명을 자동으로보인다. -->

				<p><br></p><br>

									<br>
					<br>
					<table width="1920" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="252525">
						<tr>
							<td>
								<table width="1200" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td height="20"></td>
									</tr>
									<tr>
										<td height="20" align="center"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 12pt; color:#fff;">제조사의 사정에 따라 구성품 및 디자인 일부가 예고없이 변경될 수 있습니다.</span></td>
									</tr>
									<tr>
										<td height="20"></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
			</td>
		</tr>
	</table>


	<!-----------------상품페이지 영역----------------->



	<a name="reviewmain"><div style="position: absolute; background: #fff; width: 100px; height: 50px; opacity: 0;"></div></a>
	<table cellpadding="0" cellspacing="0" align="center" width="95%">
	<tr>
		<td height="100"></td>
	</tr>
</table>


	<table cellpadding="0" cellspacing="0" align="center" style="max-width: 1200px; width: 100%; height: auto;">
		<tr>
			<td align="left"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 20pt; color:#000;">　리뷰 </span></td>
		</tr>
		<tr>
			<td align="left" height="1" bgcolor="#000"></td>
		</tr>
		<tr>
			<td>
				<!--------프리미엄 리뷰 게시판---->
				<table cellpadding="0" cellspacing="0" align="center" border="0" align="center" width="1200">
					<tr>
						<td height="20" colspan="4"></td>
					</tr>
						<!-- 	<tr>
							<td width="150" align="center" rowspan="3"><a href="/board/guide/board_view.html?no=137"><img src="/board/guide/upload/guide_137_3.jpg" width="100" height="auto"></a></td>
							<td width="850" align="left"><a href="/board/guide/board_view.html?no=137"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;"><b>[가이드] 다른 헤드폰 제조사들 다 굶어죽겠다. SONY WH-1000XM3</a></span></a></td>
						</tr>
						<tr>
							<td><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#858585;">MD_내귀에공연장치　ㅣ　2018-10-23</span></td>
						</tr>
						<tr>
							<td><a href="/board/guide/board_view.html?no=137"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">SONY [소니] 블루투스 헤드폰 'WH-1000XM3'을 소개합니다.</span></a></td>
						</tr>

						<tr>
							<td height="20" colspan="4"></td>
						</tr>
						<tr>
							<td height="1" bgcolor="f5f5f5" colspan="4"></td>
						</tr>
						<tr>
							<td height="20" colspan="4"></td>
						</tr>
											<tr>
							<td width="150" align="center" rowspan="3"><a href="/board/guide/board_view.html?no=170"><img src="/board/guide/upload/guide__170_3.jpg" width="100" height="auto"></a></td>
							<td width="850" align="left"><a href="/board/guide/board_view.html?no=170"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;"><b>[가이드] 소니 이어폰 & 헤드폰 청취기</a></span></a></td>
						</tr>
						<tr>
							<td><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#858585;">MD_스핑크스　ㅣ　2019-02-13</span></td>
						</tr>
						<tr>
							<td><a href="/board/guide/board_view.html?no=170"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">소니의 인기 이어폰과 헤드폰의 청취기입니다.</span></a></td>
						</tr> -->

						<tr>
							<td height="20" colspan="4"></td>
						</tr>
						<tr>
							<td height="1" bgcolor="f5f5f5" colspan="4"></td>
						</tr>
						<tr>
							<td height="20" colspan="4"></td>
						</tr>
									</table>
				<!--------프리미엄 리뷰 게시판---->
			</td>
		</tr>
		<tr>
			<td height="50">
		</tr>
	</table>

	<!-----------------상품정보 영역 각 게시판에서 불러올 폼, 게시물이 없으면 아예 폼도 안보이게 처리. 불러오는 순서는.. 프리미엄 리뷰, 일반 리뷰, 갤러리 순서입니다.----------------->
	<a name="delimain"><div style="position: absolute; width: 100px; height: 50px; opacity: 0;"></div></a>
	<table cellpadding="0" cellspacing="0" align="center" width="95%">
		<tr>
			<td height="100"></td>
		</tr>
	</table>
	<!-----------배송정보--------->
	<table cellpadding="0" cellspacing="0" align="center" width="1200">
		<tr>
			<td height="400" align="center" bgcolor="f5f5f5">
				<table cellpadding="0" cellspacing="0" width="95%">
					<tr>
						<td>
							<p style="line-height: 2.0;"><span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 11pt; color:#000;">1. 전 제품 5만원 이상 주문건은 배송비가 무료입니다. (택배사: CJ 대한통운)</span>
								<span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; font-size: 10pt; color:#858585;"><br>(중고/전시품란의 일부상품 제외. 5만원 미만 주문건은 2,500원의 배송비가 추가됩니다.) </span>
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
	</table>
</div>


</div>