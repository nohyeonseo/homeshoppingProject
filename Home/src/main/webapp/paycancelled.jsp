<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resource/css/bootstrap.min.css" />
<title>결제가 취소되었습니다.</title>
</head>
<body>
<%@ include file = "menu.jsp"%>
	<div class="container">
		<main role="main">
	        <div class="jumbotron bg-danger">
	          <div class="col-sm-8 mx-auto">
	            <h1 class="text-white">결제가 취소되었습니다.</h1>
	              <a class="btn btn-secondary" href="./mainpage.jsp" role="button">홈화면으로»</a>
	          </div>
	        </div>
	      </main>
	</div>
	<br>
	<jsp:include page="footer.jsp" />
</body>
</html>