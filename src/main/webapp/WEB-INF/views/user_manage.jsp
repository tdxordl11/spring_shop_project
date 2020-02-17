<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<!-- <script type="text/javascript"> -->
<%-- 
$(document).ready(function () {
	$("#deletebtn").on("click" , function(){
		if(confirm("�����Ͻðڽ��ϱ�?") == true ) {
			location.href="<%=contextpath + "/admin/userdelete&user="%>${vo.user_id }";
		} else {
			return false;
		}
	});  
	
});

		
</script>--%>
</head>
<body>
<!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">��������</h1>
          <p class="mb-4"> </p>
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">����� ��������</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
              
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>���̵�</th>
                      <th>�̸���</th>
                      <th>�ּ�</th>
                      <th>�̸�</th>
                      <th>��ȭ��ȣ</th>
                      <th>���</th>
                      <th>������</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${userlist }" var="vo" >
	                    <tr>
							<td><a href='<%=contextpath + "/admin/main?menu=user_manage_detail&user="%>${vo.user_id }'>${vo.user_id }</a></td>
							<td>${vo.user_email }</td>
							<td>${vo.user_address }</td>
							<td>${vo.user_name }</td>
							<td>${vo.user_phone}</td>
							<td>${vo.user_grade}</td>
						<%-- <td>
								<c:if test="${vip.user_id == '${vo.user_id}' "> 
								 	${vo.user_grade = 1} 
								</c:if>
								<c:if test="${vip.user_id != vo.user_id }">
									${vo.user_grade = 5} 
								</c:if>
							</td> --%>
							<td>${vo.user_joindate }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type=button class="btn btn-primary" id="deletebtn" name="deletebtn" value="X" onclick="location.href='<%=contextpath + "/admin/main?menu=userdelete?user="%>${vo.user_id }'">
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