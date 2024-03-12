<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.BoardDTO"%>
<%@ page import="mvc.model.BoardDAO"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
	List boardList = (List) request.getAttribute("boardlist");
	int total_record = ((Integer) request.getAttribute("total_record")).intValue();
	int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
	int total_page = ((Integer) request.getAttribute("total_page")).intValue();
	
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>Board</title>

<script type="text/javascript">
	function checkForm() 
	{	
		if (${sessionId==null}) 
		{
			alert("로그인을 해야지 q&a게시판을 이용할수있습니다.");
			return false;
		}

		location.href = "./BoardWriteForm.do?id=<%=sessionId%>"
	}
</script>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="container">
		<main role="main">
	        <div class="jumbotron">
	        	<div class="col-sm-8 mx-auto">
	            	<h1>Q&A</h1>
	              	<a class="btn btn-primary" href="./mainpage.jsp" role="button">홈으로»</a>
	          	</div>
	        </div>
	    </main>
	</div>
	
	
	<div class="container">
	
		<form action="<c:url value="./BoardListAction.do"/>" method="post">
			<div style="padding-top: 80px">
				<table class="table table-hover">
					<tr>
						<th>번호</th>
<!-- 					<th>분류</th> -->
						<th>제목</th>
						<th>작성일</th>
						<th>조회</th>
 						
					</tr>
					
					<%
						for (int j = 0; j < boardList.size(); j++) 
						{
							BoardDTO notice = (BoardDTO) boardList.get(j);
					%>
					
					<tr>
						<td><%=notice.getNum()%></td>
						<td><a href="./BoardViewAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>"><%=notice.getSubject()%></a></td>
						<td><%=notice.getRegist_day()%></td>
						<td><%=notice.getHit()%></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			
<!-- 			전체페이지 페이지 수 -->
			<div align="center" style="padding-top: 30px; padding-bottom:100px;">
				<c:set var="pageNum" value="<%=pageNum%>" />
				<c:forEach var="i" begin="1" end="<%=total_page%>">
					<a href="<c:url value="./BoardListAction.do?pageNum=${i}" /> ">
						
						<c:choose>
							<c:when test="${pageNum==i}">
								<font color='4C5317'><b> [${i}]</b></font>
							</c:when>
						
							<c:otherwise>
								<font color='4C5317'> [${i}]</font>
							</c:otherwise>
						
						</c:choose>
					
					</a>
				</c:forEach>
			</div>
			
<!-- 			글찾기 -->
			<div align="center">
				<table>
					<tr >
						<td width="60%" align="left" > &nbsp;&nbsp; 
							<select name="Items" class="txt"> 
									<option value="subject">제목</option>
									<option value="content">본문</option>
									<option value="name">글쓴이</option>
							</select> 
							 &nbsp;
							<input name="text" type="text" /> 
							 &nbsp; &nbsp;
							<input type="submit" id="btnAdd" class="btn btn-secondary" value="검색 " />
						</td>
						
						<td width="100%" align="right">
							<a href="#" onclick="checkForm(); return false;" class="btn btn-primary">글쓰기&raquo;</a>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	<br>
	<jsp:include page="../footer.jsp" />
</body>
</html>


