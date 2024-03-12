<%@ page language="java" contentType="text/html; charset=utf-8"%>

<html>
<head>
<link rel="stylesheet" href="./resource/css/bootstrap.min.css" />
<title>로그인</title>

</head>
	<%@ include file = "menu.jsp"%>

	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			
			<form class= "form-signin" method="post" action="ProcessLogin.jsp" style="margin-top: 100px; margin-bottom: 100px;">
				<img class="mb-4" src="./resource/image/user2.png" alt="로고입니다" width="85" height="85">
				
				<h1 class="h3 mb-3 font-weight-normal">
					<font style="vertical-align: inherit;">
						<font style="vertical-align: inherit;">로그인</font>
					</font>
				</h1>
				
				<div class="form=group">
					<label for="inputUserName" class="sr-only">ID</label>
					<input type="text" class="form-control" placeholder="ID" name="id" required autofocus>
				</div>
				
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label>
					<input type="password" class="form-control" placeholder="Password" name="password" required style="margin-bottom: 100px;">
				</div>

				<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
				<a class="btn btn btn-lg btn-success btn-block" href="addMember.jsp">회원가입</a>
			
			</form>

		</div>
	</div>
	
	<%@ include file = "footer.jsp"%>

</body>
</html>