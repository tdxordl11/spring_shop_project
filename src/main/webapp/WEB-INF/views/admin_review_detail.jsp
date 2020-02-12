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
             <input type="text" id="review_seq" name="review_seq" class="form-control" value="${reviewdetail.review_seq }" readonly="readonly"><br>
          </div>
          <div class="col mr-2">
             <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">유저ID</div>
              <input type="text"  class="form-control" value="${reviewdetail.user_id }" disabled="disabled"><br>
          </div>
          <div class="col mr-2">
             <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">제품명</div>
             <input type="text"  class="form-control" value="${reviewdetail.product_name }" disabled="disabled"><br>
          </div>
           <div class="col mr-2">
             <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">리뷰명</div>
              <input type="text"  class="form-control" value="${reviewdetail.review_title }" disabled="disabled"><br>
          </div>
          <div class="col mr-2">
             <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">리뷰내용</div>
              <input type="text"  class="form-control" value="${reviewdetail.review_contents }" disabled="disabled"><br>
          </div>
            <div class="col mr-2">
             <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">리뷰점수(5점만점)</div>
            <input type="text"  class="form-control" value="${reviewdetail.review_recommend }점" disabled="disabled"><br>			    
          </div>
			<div>
				
			</div>
          </div>
        </div>
      </div>
</body>
</html>