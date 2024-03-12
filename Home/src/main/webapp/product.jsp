<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>

<%-- <%@ page import ="dto.Product" %> --%>
<%-- <%@ page import="dao.ProductRepository"%> --%>
<html>
<head>
<link rel ="stylesheet" href = "http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>제품 상세페이지</title>
<!-- 장바구니에 넣기 -->
<script type="text/javascript">
	function addToCart() 
	{
		if(confirm("상품을 장바구니에 추가하시겠습니까?"))
		{
			document.addForm.submit();
		}
		else{
			document.addForm.reset();
		}
	}
</script>


</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="container">
		<main role="main">
			<div class="jumbotron">
				<div class="col-sm-8 mx-auto">
					<h1>상세상품페이지</h1>
					<a href="./mainpage.jsp" class="btn btn-secondary"> 상품목록&raquo; </a>				
				</div>
			</div>
		</main>
	</div>
	
	<%@ include file ="dbconn.jsp" %>
	<%
		String productId = request.getParameter("id");
		if (productId != null) 
		{
	
			PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        String sql = "select * from product where p_id = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, productId);
	        rs = pstmt.executeQuery();
		
        	if (rs.next()) 
        	{
	%>
	
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="./upload3/<%=rs.getString("p_fileName")%>" style="width:100%">
				<h4 class="text-center"><%=rs.getString("p_name")%></h4>
			</div>
			<div class="col-md-6">
				<h3><%=rs.getString("p_name")%></h3>
				<p><%=rs.getString("p_description")%>
				<p><%=rs.getString("p_detail") %>
				<p> <b>카테고리</b> : <%=rs.getString("p_category") %>
				<p> <b>상품 코드 : </b><span class="badge badge-warning"><%=rs.getString("p_id") %>></span>
				<h4> <%=rs.getString("p_UnitPrice")%>원</h4>
				<p> <form name="addForm" action="./addCart.jsp?id=<%=rs.getString("p_id")%>"method="post">
					<a href="#" class="btn btn-info" onclick="addToCart()"> 상품주문&raquo; </a>
					</form>
			</div>
		</div>
	</div>
	<%
        	}
			if (rs != null) 
			{
		        rs.close();
		    }
		    if (pstmt != null) 
		    {
		        pstmt.close();	
		    }
        } 
        else 
        {
	    // productId가 없는 경우에 대한 처리 (예: 에러 메시지 출력)
		}
	
		if (conn != null)
		{
	    	conn.close();
		}
	%>
	
	
<!-- 	 else  -->
<!--         { -->
<!-- 	 %>   	 -->
<!--         	<script> -->
<!--                alert("상품 정보를 가져올 수 없습니다. 상품 ID가 제공되지 않았습니다."); -->
<!--                history.back(); // 뒤로가기로 이전 페이지로 이동 -->
<!--           	</script> -->
<%-- 	<%       --%>
<!--  		} -->
	
<!-- 		if (conn != null) -->
<!-- 		{ -->
<!-- 	    	conn.close(); -->
<!-- 		} -->
<!-- 	%>      -->
	
	
	<br>
	<br>
	<br>
	<jsp:include page="footer.jsp" />
</body>
</html>