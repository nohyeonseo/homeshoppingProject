<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="mvc.model.BoardDTO"%>

<%
	BoardDTO notice = (BoardDTO) request.getAttribute("board");
	int num = ((Integer) request.getAttribute("num")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
%>

<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>게시판</title>
</head>
<body>

	<jsp:include page="../menu.jsp" />
	<div class="container">
		<main role="main">
	    	<div class="jumbotron">
	        	<div class="col-sm-8 mx-auto">
	        		<h1>Q&A</h1>
	                <a href="./BoardListAction.do?pageNum=<%=nowpage%>"	class="btn btn-primary">목록</a>
	          	</div>
	        </div>
	    </main>
	</div>
	
	<div class="container">
		
		<form name="newUpdate" action="BoardUpdateAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>" class="form-horizontal" method="post">
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >제목</label>
				<div class="col-sm-5">
					<input name="subject" class="form-control"	value=" <%=notice.getSubject()%>" >
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >내용</label>
				<div class="col-sm-8" style="word-break: break-all;">
					<textarea name="content" class="form-control" cols="50" rows="5"> <%=notice.getContent()%></textarea>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >성명</label>
				<div class="col-sm-3">
					<input name="name" class="form-control"	value=" <%=notice.getName()%>">
				</div>
			</div>
			
			<div class="form-group row">
			
				<div class="col-sm-offset-2 col-sm-10 ">
				
					<c:set var="userId" value="<%=notice.getId()%>" />

					<c:choose>
					
					    <c:when test="${sessionId == 'operator'}">
					        <p>
					            <a href="./BoardDeleteAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>" class="btn btn-danger">삭제</a>
					            <input type="submit" class="btn btn-success" value="수정">
					        </p>
					    </c:when>
					    
					    <c:when test="${sessionId == userId}">
					        <p>
					            <a href="./BoardDeleteAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>" class="btn btn-danger">삭제</a>
					            <input type="submit" class="btn btn-success" value="수정">
					        </p>
					    </c:when>
					    
					    <c:otherwise>
					        <!-- 아무런 버튼도 보이지 않음 -->
					    </c:otherwise>
					    
					</c:choose>
					
					
<%-- 					<c:set var="userId" value="<%=notice.getId()%>" /> --%>
					
<%-- 					<c:if test="${sessionId==userId}"> --%>
<!-- 						<p> -->
<%-- 							<a href="./BoardDeleteAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>"class="btn btn-danger"> 삭제</a>  --%>
<!-- 							<input type="submit" class="btn btn-success" value="수정 "> -->
<%-- 					</c:if> --%>
				</div>
			</div>
					
		</form>
		<br>
	</div>
	<br>
	<jsp:include page="../footer.jsp" />	
	
</body>
</html>