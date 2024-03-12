<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resource/css/bootstrap.min.css" />
<title>로그인 유무</title>
</head>
<body>
	<%@ include file = "menu.jsp"%>

	<div class="container">
		<main role="main">
	    	<div class="jumbotron">
	          	<div class="col-sm-8 mx-auto">
	            	<h1>로그인</h1>
	            	<div class="d-flex flex-column align-items-start">
	            		<a class="btn btn-primary mb-2" href="./mainpage.jsp" role="button">홈화면으로»</a>
	            		<a class="btn btn-info" href="./editmember.jsp" role="button">회원정보 수정»</a>
	            	</div>
	            </div>
	        </div>
	    </main>
	</div>
	
	<div class="container" align="center">
		<%
			String msg = request.getParameter("msg");

			if (msg != null) 
			{
				if (msg.equals("0"))
					out.println(" <h2 class='alert alert-danger'>회원정보가 수정되었습니다.</h2>");
				
				else if (msg.equals("1"))
					out.println(" <h2 class='alert alert-info'>회원가입을 축하드립니다.</h2>");
				
				else if (msg.equals("2")) 
				{
					String loginId = (String) session.getAttribute("sessionId");
					out.println(" <h2 class='alert alert-danger'>" + loginId + "님 환영합니다! </h2>");
				}				
			} 
			else 
			{
				out.println("<h2 class='alert alert-danger'>회원정보가 삭제되었습니다.</h2>");
			}
		%>
	</div>
	<br>
	<jsp:include page="footer.jsp" />
</body>
</html>