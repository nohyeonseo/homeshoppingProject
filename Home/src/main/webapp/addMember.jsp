<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resource/css/bootstrap.min.css" />
<title>회원가입</title>
</head>
	
<body class="bg">
	<%@ include file = "menu.jsp"%>
	
	<div class="container">
		<div class="py-5 text-center">
				<img class="d-block mx-auto mb-4" src="image/user2.png" alt="" width="90" height="90">
	       	<h2>
	       		<font style="vertical-align: inherit;">
	       			<font style="vertical-align: inherit;">회원가입</font>
	       		</font>
	       	</h2>
	       	<p class="lead">
	       		<font style="vertical-align: inherit;">
		        	<font style="vertical-align: inherit;">회원가입을 위해 정보를 입력하세요</font>
	       	    </font>
	       	</p>
	    </div>
    </div>
      <!-- 정규식 사용해라 -->
	<div class="container">
		<form name="newMember" class="form-horizontal" action="processAddMember.jsp" method="post" onsubmit="return checkForm()">
			
			<div class="form-group  row">
				<label class="col-sm-2 ">아이디</label>
				<div class="col-sm-3">
					<input name="id" type="text" class="form-control" placeholder="id" >
				</div>
			</div>
			
			<div class="form-group  row">
				<label class="col-sm-2 ">비밀번호</label>
				<div class="col-sm-3">
					<input name="password" type="text" class="form-control" placeholder="password" >
				</div>
			</div>
			
			<div class="form-group  row">
				<label class="col-sm-2 ">성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" placeholder="name" >
				</div>
			</div>
			
			<div class="form-group  row">
				<label class="col-sm-2 ">이메일</label>
				<div class="col-sm-10">
					<input type="text" name="mail1" maxlength="50"> @
					<select name="mail2">
						<option>naver.com</option>
						<option>gmail.com</option>
						<option>nate.com</option>
					</select>
				</div>
			</div>
			
			<div class="form-group  row">
				<label class="col-sm-2 ">전화번호</label>
				<div class="col-sm-3">
					<input name="phone" type="text" class="form-control" placeholder="phone">
				</div>
			</div>
			
			<div class="form-group  row">
				<label class="col-sm-2 ">주소</label>
				<div class="col-sm-5">
					<input name="address" type="text" class="form-control" placeholder="address">
				</div>
			</div>
			
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="reset" class="btn btn-primary " value="취소 " onclick="reset()" >
					<input type="submit" class="btn btn-primary " value="등록 " > 
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="footer.jsp" />
</body>
    
</body>
</html>