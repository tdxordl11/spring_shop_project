<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery-3.2.1.min.js"></script>
<style type="text/css">
   html, body
{
    height: 100%;
}

body
{
    display: table;
    margin: 0 auto;
}

.container
{
    height: 100%;
    display: table-cell;
    vertical-align: middle;
}

.main
{
    height: 200px;
    width: 200px;     
}

</style>
<script>
   $(document).ready(function() {

   });
</script>
</head>
<body>
<div class="container">
    <div class="main">
			<form>
				<div id=loginform>
					<h3 style="text-align: center;">로그인</h3>
					<div class="form-group">
						<label for="exampleInputId1">ID</label> <input type="text"
							class="form-control" placeholder="아이디" name="userid"
							maxlength="20">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> <input
							type="password" class="form-control" id="exampleInputPassword1"
							placeholder="Password">
					</div>
					<div class="checkbox">
						<label> <input type="checkbox"> 아이디 저장
						</label>
					</div>
					<button type="submit" class="btn btn-success btn-block">로그인</button>
				</div>
			</form>

		</div>
</div>
</body>
</html>