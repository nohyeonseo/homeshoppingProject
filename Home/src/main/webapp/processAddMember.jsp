<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!-- 회원 가입 처리 페이지 -->

<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String mail1 = request.getParameter("mail1");
	String mail2 = request.getParameterValues("mail2")[0];
	String mail = mail1 + "@" + mail2;
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	
	Date currentDatetime = new Date(System.currentTimeMillis());
	java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());
	java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDatetime.getTime());
%>

<sql:setDataSource var="dataSource"
	url="jdbc:oracle:thin:@localhost:1521:xe"
	driver="oracle.jdbc.OracleDriver" user="home" password="web1234" />

<sql:update dataSource="${dataSource}" var="resultSet">
	INSERT INTO member VALUES (?, ?, ?, ?, ?, ?)
	<sql:param value="<%=id%>"/>
	<sql:param value="<%=password%>"/>
	<sql:param value="<%=name%>"/>
	<sql:param value="<%=mail%>"/>
	<sql:param value="<%=phone%>"/>
	<sql:param value="<%=address%>"/>
</sql:update>

<c:if test="${resultSet>=1}">
	<c:redirect url="LoginAfter.jsp?msg=1"/>
</c:if>	
