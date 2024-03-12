<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>

<%
	request.setCharacterEncoding("UTF-8");

	String cartId = session.getId();

	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_phonenumber = "";
	String shipping_deliverydate = "";
	String shipping_country = "";
	String shipping_zipCode = "";
	String shipping_address = "";
	String shipping_bankname = "";
	String shipping_cdnumber = "";
	
	Cookie[] cookies = request.getCookies();

	if (cookies != null) 
	{
		for (int i = 0; i < cookies.length; i++) 
		{
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if (n.equals("Shipping_cartId"))
				shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_name"))
				shipping_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_phonenumber"))
				shipping_phonenumber = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_deliverydate"))
				shipping_deliverydate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_country"))
				shipping_country = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_zipCode"))
				shipping_zipCode = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_address"))
				shipping_address = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_bankname"))
				shipping_bankname = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_cdnumber"))
				shipping_cdnumber = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			
		}
	}
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>주문 정보</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="container">
		<main role="main">
	        <div class="jumbotron">
	          <div class="col-sm-8 mx-auto">
	            <h1>주문완료</h1>
	              <a class="btn btn-warning" href="./mainpage.jsp" role="button">쇼핑을 계속하는것을 원하십니까?»</a>
	          </div>
	        </div>
	      </main>
	</div>

	<div class="container col-4 alert alert-info">
		<div class="text-center ">
			<h1>배송확인</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
<%-- 			<strong>배송 주소</strong> <br> 성명 : <% out.println(shipping_name); %>	<br>  --%>
				<strong>배송 확인</strong> <br>
				성명 : <%out.println(shipping_name);%> <br>
				전화번호 : <%out.println(shipping_phonenumber);%> <br>
				우편번호:<% out.println(shipping_zipCode);%><br> 
				주소 : (<%out.println(shipping_country);%>)<br>
					<%out.println(shipping_address);%><br>
			</div>
			
			<div class="col-4" align="right">
				<p>	<em>배송일: <% out.println(shipping_deliverydate);%></em>
			</div>
		</div>
		
		
		<div>
			<table class="table table-hover">			
			<tr>
				<th class="text-center">상품명</th>
				<th class="text-center">갯수</th>
				<th class="text-center">가격</th>
				<th class="text-center"></th>
			</tr>
			<%
				int sum = 0;
				ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
				if (cartList == null)
					cartList = new ArrayList<Product>();
				for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
					Product product = cartList.get(i);
					int total = product.getUnitPrice() * product.getQuantity();
					sum = sum + total;
			%>
			<tr>
				<td class="text-center"><em><%=product.getPname()%> </em></td>
				<td class="text-center"><%=product.getQuantity()%></td>
				<td class="text-center"><%=product.getUnitPrice()%>원</td>
				<td class="text-center"><%=total%>원</td>
			</tr>
			<%
				}
			%>
			<tr>
				<td> </td>
				<td> </td>
				<td class="text-right">	<strong>총액: </strong></td>
				<td class="text-center text-danger"><strong><%=sum%> </strong></td>
			</tr>
			</table>
			
<%-- 				<a href="./shippingInfo.jsp?cartId=<%=shipping_cartId%>"class="btn btn-secondary" role="button"> 이전 </a> --%>
<!-- 				<a href="./thankCustomer.jsp"  class="btn btn-success" role="button"> 주문 완료 </a> -->
<!-- 				<a href="./checkOutCancelled.jsp" class="btn btn-secondary"	role="button"> 취소 </a>			 -->
		</div>
	</div>	
	<jsp:include page="footer.jsp" />
</body>
</html>