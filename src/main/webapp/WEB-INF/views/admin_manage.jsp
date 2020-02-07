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
          <h1 class="h3 mb-2 text-gray-800">계정관리</h1>
          <p class="mb-4"> </p>
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">관리자 계정관리</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>아이디</th>
                      <th>권한 레벨</th>
                      <th>연락처</th>
                      <th>이메일</th>
                      <th>이름</th>
                      <th>OTP KEY</th>
                      <th>계정활성화 여부</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${adminlist }" var="vo" >
	                    <tr>
							<td>${vo.admin_id }</td>
							<td>${vo.admin_authlevel }</td>
							<td>${vo.admin_phone }</td>
							<td>${vo.admin_address }</td>
							<td>${vo.admin_name }</td>
							<td>${vo.admin_otpkey }</td>
							<td>${vo.admin_active }</td>
	                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
</body>
</html>