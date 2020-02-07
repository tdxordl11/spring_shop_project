<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">cs관리</h1>
          <p class="mb-4"> </p>
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">이용후기 관리</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>SEQ</th>
                      <th>유저ID</th>
                      <th>제품명</th>
                      <th>리뷰명</th>
                      <th>추천점수</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${reviewlist }" var="vo" >
	                    <tr>
							<td>${vo.review_seq }</td>
							<td>${vo.user_id }</td>
							<td>${vo.product_name }</td>
							<td>${vo.review_title }</td><!-- detail : pop업 ajax작성 -->
							<td>
								<c:forEach begin="1" end="${vo.review_recommend }">
								★
								</c:forEach>
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