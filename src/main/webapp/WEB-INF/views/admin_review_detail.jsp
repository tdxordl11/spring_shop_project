<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	String contextpath = request.getContextPath();
	String respath = request.getContextPath() +"/resources/"; 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<!-- Custom fonts for this template -->
<link href="<%=respath %>vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<%=respath %>css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="<%=respath %>vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>
<body>
      <div class="card shadow mb-4">
        <div class="card-header py-3">
          <h6 class="m-0 font-weight-bold text-primary">이용후기 관리</h6>
        </div>
        <br>
          <div class="col mr-2">
             <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">SEQ</div>
             <div class="h5 mb-0 font-weight-bold text-gray-800">${reviewdetail.review_seq }</div><br>
          </div>
          <div class="col mr-2">
             <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">유저ID</div>
             <div class="h5 mb-0 font-weight-bold text-gray-800">${reviewdetail.user_id }</div><br>
          </div>
          <div class="col mr-2">
             <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">제품명</div>
             <div class="h5 mb-0 font-weight-bold text-gray-800">${reviewdetail.product_name }</div><br>
          </div>
           <div class="col mr-2">
             <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">리뷰명</div>
             <div class="h5 mb-0 font-weight-bold text-gray-800">${reviewdetail.review_title }</div><br>
          </div>
          <div class="col mr-2">
             <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">리뷰내용</div>
             <div class="h5 mb-0 font-weight-bold text-gray-800">${reviewdetail.review_contents }</div><br>
          </div>
            <div class="col mr-2">
             <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">리뷰점수</div>
             <div class="h5 mb-0 font-weight-bold text-gray-800">
             	<c:forEach begin="1" end="${reviewdetail.review_recommend }">
				★
				</c:forEach>
			 </div><br>
          </div>
			<div>
				
			</div>
          </div>
        </div>
      </div>
</body>
</html>