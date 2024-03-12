<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<html>
<head>

<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<%
	String cartId = session.getId();
%>

<title>장바구니 페이지 입니다.</title>
</head>

<body>
	<jsp:include page="menu.jsp" />
	<div class="container">
		<main role="main">
			<div class="jumbotron">
		    	<div class="col-sm-8 mx-auto">
		        	<h1>장바구니</h1>
		        	<a href="./mainpage.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>	
		        </div>
		    </div>
		</main>
	</div>


	<div class="container">
		
		<div class="row">
		</div>
		
		<div style="padding-top: 50px">
			<table class="table table-hover">
				<tr>
					<th>상품</th>
					<th>수량</th>
					<th>가격</th>
					<th>상태</th>
				</tr>
				<%
					int sum = 0;
					ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
					if (cartList == null)
						cartList = new ArrayList<Product>();
					// 상품리스트 하나씩 출력하기
					for (int i = 0; i < cartList.size(); i++) {
						Product product = cartList.get(i);
						// getProductByIdFromDB 메서드를 사용하여 데이터베이스에서 상품 정보 가져오기
						ProductRepository dao = ProductRepository.getInstance();
						Product productFromDB = dao.getProductByIdFromDB(product.getProductId());
						int total = productFromDB.getUnitPrice() * product.getQuantity();
						sum = sum + total;
				%>
				<tr>
					<td><%=product.getProductId()%> - <%=productFromDB.getPname()%></td>
					<td><%=product.getQuantity()%></td>
					<td><%=total%></td>
					<td><a href="./removeCart.jsp?id=<%=product.getProductId()%>" class="badge badge-danger">삭제</a></td>
				</tr>
				<%
					}
				%>
				<tr>
					<th>총액</th>
					<th></th>
					<th><%=sum%></th>
					<th></th>
				</tr>
			</table>
			
			<table width="85%">
				<tr>
					<td align="center"><a href="./deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-danger">삭제하기</a></td>
					<td align="right"><a href="./paypage.jsp?cartId=<%= cartId %>" class="btn btn-success">주문하기</a></td>
				</tr>
			</table>
			
		</div>
		<br>
	</div>
	<br>
	<jsp:include page="footer.jsp" />

</body>
</html>