<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<link rel = "stylesheet" href="./resources/css/bootstrap.min.css" />

<title>홈화면 메인화면</title>
</head>
<body>
	<%@ include file = "menu.jsp"%>
	<div class="container">
		<main role="main">
			<div class="jumbotron">
		    	<div class="col-sm-8 mx-auto">
		        	<h1>DVD입니다</h1>
		        </div>
		    </div>
		</main>
	</div>


<div class="album py-5 bg-light">	
	<div class="container">
		<div class="row" align="center">
			<%@ include file ="dbconn.jsp" %>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "select * from product where p_type='DVD'";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()){
			%>
			<div class="col-md-4">
				<div class="card mb-4 box-shadow">
					<img class="card-img-top" src= "./upload3/<%=rs.getString("p_fileName")%>" style="height: 225px; width: 100%; display: block;" >
					<div class="card-body">
						<h3><%= rs.getString("p_name") %></h3>
						<p><%= rs.getString("p_description")%>
						<p><%= rs.getString("p_UnitPrice")%>원
	 					<p>
						<a href="./product.jsp?id=<%=rs.getString("p_id")%>" class= "btn btn-secondary" role="button"> 상품 보기 &raquo;</a>
					</div>
					
				</div>
			</div>
			<%
			 	}
			
		if (rs!=null)
			rs.close();
		if (pstmt!=null)
			pstmt.close();	
		if (conn!=null)
			conn.close();
		%>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>