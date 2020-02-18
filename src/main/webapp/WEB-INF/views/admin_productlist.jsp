<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String contextpath = request.getContextPath();
	String respath = request.getContextPath() + "/resources/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {

	});
</script>
<style>
.left-box {
  float: left;
  padding: 9px;
}
.right-box {
  float: right;
}
</style>
<script type="text/javascript">
	var popupWindow = null;
	function positionedPopup(url, winName, w, h, t, l, scroll) {
		settings = 'height=' + h + ',width=' + w + ',top=' + t + ',left=' + l
				+ ',scrollbars=' + scroll + ',resizable'
		popupWindow = window.open(url, winName, settings)
	}

	// 일괄 체크
	/* function allChk(obj) {
		var chkObj = document.getElementsByName("RowCheck");
		var rowCnt = chkObj.length - 1;
		var check = obj.checked;
		if (check) {
			for (var i = 0; i <= rowCnt; i++) {
				if (chkObj[i].type == "checkbox")
					chkObj[i].checked = true;
			}
		} else {
			for (var i = 0; i <= rowCnt; i++) {
				if (chkObj[i].type == "checkbox") {
					chkObj[i].checked = false;
				}
			}
		}
	} */

	// n개 삭제 (개별 선택)
	function productDelete() {

		var userid = "";
		var memberChk = document.getElementsByName("RowCheck");
		var chked = false;
		var indexid = false;
		for (i = 0; i < memberChk.length; i++) {
			if (memberChk[i].checked) {
				if (indexid) {
					userid = userid + ',';
				}
				userid = userid + memberChk[i].value;
				indexid = true;
			}
		}
		if (!indexid) {
			alert("삭제할 사용자를 체크해 주세요");
			return;
		}
		document.productlist.product_id
		value = product_id; // 체크된 상품을 ','로 묶은 productlist.product_id 의 value로 저장

		var agree = confirm("삭제 하시겠습니까?");
		if (agree) {
			document.userForm.execute.value = "productDelete";
			document.userForm.submit();
		}
	}
	﻿
</script>
</head>
<body>
	<h1 class="h3 mb-2 text-gray-800">상품관리</h1>
	<p class="mb-4"></p>
	<!-- DataTales Example -->

	<div class="card shadow mb-4">
		<div class="card-header py-3">
			 <div class="left-box"><h6 class="m-0 font-weight-bold text-primary">상품 관리</h6></div>
			<div class="right-box">
			<input  type="button" value="상품 추가" class="btn btn-primary" 
						onclick="positionedPopup('<%=request.getContextPath() + "/admin/admin_product_insert_page"%>', '상품 추가', '900', '1000', '100', '200', 'yes'); return false">
			</div>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<div align="right">
					
					<!-- 일괄 삭제 미완 -->
					<!-- <input type="button" value="상품 일괄 삭제[미완성]" onclick="productDelete()" /> -->
				</div>
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<!-- <th><input id="allCheck" type="checkbox"
								onclick="allChk(this)" /></th> -->
							<th>품번</th>
							<th>이름</th>
							<th>브랜드</th>
							<th>카테고리</th>
							<th>가격</th>
							<th>재고</th>
							<th>판매량</th>
							<th>출시일</th>
							<!-- <th>할인율</th> -->
							<th>상품 상세 정보</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${productlist }" var="vo">
							<tr>
								<%-- <td><input name="RowCheck" type="checkbox"
									value="${result.product_id }" /></td> --%>
								<td>${vo.product_id }</td>
								<td>${vo.product_name }</td>
								<td>${vo.product_brand }</td>
								<td>${vo.product_category }</td>
								<td>${vo.product_price }원</td>
								<td>${vo.product_balance }개</td>
								<td>${vo.product_sellcount }개</td>
								<td>${vo.product_release }</td>
								<%-- <td>${vo.sales_persent }%</td> --%>
								<td><input type="button" value="상세" class="btn btn-primary"
									onclick="positionedPopup('<%=request.getContextPath() +"/admin/admin_product_detail?product_id="%>${vo.product_id}', '${vo.product_id}', '500', '600', '100', '200', 'yes'); return false" />
									<input type="button" value="삭제" class="btn btn-primary"
									onclick="location.href='<%=request.getContextPath() +"/admin/admin_product_delete?product_id="%>${vo.product_id}'" />
									<input type="button" value="수정" class="btn btn-primary"
									onclick="positionedPopup('<%=request.getContextPath() +"/admin/admin_product_modify_page?product_id="%>${vo.product_id}', '${vo.product_id}', '500', '600', '100', '200', 'yes'); return false" />
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>

<!--  Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 PRODUCT_DETAIL                                     VARCHAR2(200)
 PRODUCT_PRICE                                      NUMBER(10)
 PRODUCT_BALANCE                                    VARCHAR2(20)
 PRODUCT_SELLCOUNT                                  VARCHAR2(20)
 PRODUCT_CATEGORY                                   VARCHAR2(50)
 PRODUCT_BRAND                                      VARCHAR2(20)
 PRODUCT_NAME                                       VARCHAR2(100)
 PRODUCT_ID                                NOT NULL VARCHAR2(20)
 PRODUCT_IMAGE                                      VARCHAR2(200)
 PRODUCT_RELEASE                                    VARCHAR2(20)
 SALES_PERSENT                                      NUMBER
 SALES_DATE                                         DATE -->
