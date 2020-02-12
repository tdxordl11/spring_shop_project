<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function popup(url){
    var name = "popup test";
    var option = "width = 600, height = 750, top = 100, left = 200, location = no"
    window.open(url, name, option);
}
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
</head>
<body>
<!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">cs관리</h1>
          <p class="mb-4"> </p>
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <div class="left-box"><h6 class="m-0 font-weight-bold text-primary">1:1문의 관리</h6></div>
              </div>
            <div class="card-body">
              <div class="table-responsive">

                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>SEQ</th>
                      <th>작성자</th>
                      <th>제품명</th>
                      <th>카테고리</th>
                      <th>문의 제목</th>
                      <th>작성시간</th>
                      <th>답변여부</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${qnalist }" var="vo" >
	                    <tr>
							<td>${vo.cs_seq }</td>
							<td>${vo.user_id }</td>
							<td>${vo.product_name }</td>
							<td>${vo.cs_category }</td>
							<td><a href=javascript:popup('<%=request.getContextPath() + "/admin/admin_qna_detail?cs_seq="%>${vo.cs_seq }')>${vo.cs_title }</a></td>
							<td>${vo.cs_date }</td>
							<td>
								<c:if test="${vo.comments_contents == null}">
									X
        						</c:if>
        						<c:if test="${vo.comments_contents != null}">
									O (${vo.comments_date })
        						</c:if>
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