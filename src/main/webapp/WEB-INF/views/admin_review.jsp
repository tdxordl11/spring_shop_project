<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Insert title here</title>
   <script>
        function popup(url){
            var name = "popup test";
            var option = "width = 600, height = 700, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
    </script>
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
							<td><a href=javascript:popup('<%=request.getContextPath() + "/admin/admin_review_detail?review_seq="%>${vo.review_seq }')>${vo.review_title }</a></td>
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