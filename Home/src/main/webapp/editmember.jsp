<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<script type="text/javascript">

function init() 
{
	setComboMailValue("${mail2}");
// 	setComboBirthValue("${month}");
}

function checkForm() {
	if (!document.newMember.id.value) {
		alert("아이디를 입력하세요.");
		return false;
	}
	if (!document.newMember.password.value) {
		alert("비밀번호를 입력하세요.");
		return false;
	}
	if (document.newMember.password.value != document.newMember.password_confirm.value) {
		alert("비밀번호를 동일하게 입력하세요.");
		return false;
	}
}

</script>

<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />

<%
	String sessionId = (String) session.getAttribute("sessionId");
%>

<sql:setDataSource var="dataSource"
	url="jdbc:oracle:thin:@localhost:1521:xe"
	driver="oracle.jdbc.OracleDriver" user="home" password="web1234" />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM MEMBER WHERE ID=?
   <sql:param value="<%=sessionId%>" />
</sql:query>


<title>회원정보 수정</title>
</head>

<body onload="init()">
	<jsp:include page="menu.jsp" />
	<div class="container">
		<main role="main">
			<div class="jumbotron">
		    	<div class="col-sm-8 mx-auto">
		        	<h1>회원정보수정</h1>
		        </div>
		    </div>
		</main>
	</div> 
	
	<c:forEach var="row" items="${resultSet.rows}">
	<c:set var="mail" value="${row.mail}" />
	<c:set var="mail1" value="${mail.split('@')[0]}" />
	<c:set var="mail2" value="${mail.split('@')[1]}" />
	
	
	<div class="container">
		<form name="newMember" class="form-horizontal" action="processEditMember.jsp" method="post" onsubmit="return checkForm()">
		
			<div class="form-group  row">
				<label class="col-sm-2 ">아이디</label>
				<div class="col-sm-3">
					<input name="id" type="text" class="form-control" placeholder="아이디를 입력하세요" value="<c:out value='${row.id}'/>" />
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input name="password" type="text" class="form-control"
						placeholder="password" value="<c:out value='${row.password }'/>" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">비밀번호확인</label>
				<div class="col-sm-3">
					<input name="password_confirm" type="text" class="form-control"
						placeholder="비밀번호를 입력하세요" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control"
						placeholder="이름을 입력하세요" value="<c:out value='${row.name }'/>" >
				</div>
			</div>
	
			<div class="form-group  row ">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-10">
					<input type="text" name="mail1" maxlength="50" value="${mail1}">@
					<select name="mail2" id="mail2">
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gmail.com</option>
						<option>nate.com</option>
					</select>
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input name="phone" type="text" class="form-control" placeholder="핸드폰번호를 입력하세요" value="<c:out value='${row.phone}'/>">

				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2 ">주소</label>
				<div class="col-sm-5">
					<input name="address" type="text" class="form-control" value="<c:out value='${row.address}'/>">
				</div>
			</div>
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="회원수정 "> 
					<a href="deleteMember.jsp" class="btn btn-primary"> 회원탈퇴 </a>
				</div>
			</div>
		</form>
	</div>
	</c:forEach>
</body>
</html>

