<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>
<body>
	<h1 class="h3 mb-2 text-gray-800">결제관리</h1>
	<p class="mb-4"></p>
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">관리자 결제관리</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>SEQ</th>
							<th>주문번호</th>
							<th>상품명</th>
							<th>주문개수</th>
							<th>송장번호</th>
							<th>주문가격</th>
							<th>구매방식</th>
							<th>구매자</th>
							<th>주문날짜</th>
							<th>배송지</th>
							<th>우편번호</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orderlist }" var="vo">
							<tr>
								<td>${vo.order_seq }</td>
								<td>${vo.order_id }</td>
								<td>${vo.product_name}</td>
								<%-- <td>${vo.product_name }<br> <input type="button"
									value="Detail"
									onclick="location.href='/Spring_shop_project/production?detail=${vo.product_id}'" />
								</td> --%>
								<td>${vo.order_balance }</td>
								<td><a href="">${vo.order_invoice }</a></td>
								<td>${vo.order_price }</td>
								<td>${vo.order_payment }</td>
								<td>${vo.user_id }</td>
								<td>${vo.order_date }</td>
								<td>${vo.shipment_address }</td>
								<td>${vo.shipment_zipcode }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>

<!-- order_id             NUMBER(10) NOT NULL , -->
<!-- 	order_name           VARCHAR2(20) NULL , -->
<!-- 	order_balance        NUMBER(10) NULL , -->
<!-- 	order_price          NUMBER(10) NULL , -->
<!-- 	order_payment        VARCHAR2(20) NULL , -->
<!-- 	product_id           VARCHAR2(20) NULL , -->
<!-- 	user_id              VARCHAR2(20) NOT NULL , -->
<!-- 	order_date           DATE NULL , -->
<!-- 	shipment_address     VARCHAR2(50) NULL , -->
<!-- 	shipment_zipcode     VARCHAR2(10) NULL , -->
<!-- 	order_invoice -->