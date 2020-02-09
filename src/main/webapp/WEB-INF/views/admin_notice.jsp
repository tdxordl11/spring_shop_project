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
              <div class="left-box"><h6 class="m-0 font-weight-bold text-primary">공지사항 관리</h6></div>
              <div class="right-box"><a class="btn btn-primary" href=javascript:popup('<%=request.getContextPath() + "/admin/admin_notice_write"%>')>작성하기</a></div>
            </div>
            <div class="card-body">
              <div class="table-responsive">

                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>SEQ</th>
                      <th>작성자</th>
                      <th>공지사항 제목</th>
                      <th>공지기간</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${noticelist }" var="vo" >
	                    <tr>
							<td>${vo.notice_seq }</td>
							<td>${vo.admin_id }</td>
							<td><a href=javascript:popup('<%=request.getContextPath() + "/admin/admin_notice_detail?notice_seq="%>${vo.notice_seq }')>${vo.notice_title }</a></td>
							<td>${vo.start_date } ~ ${vo.end_date }</td>
	                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
</body>
</html>