<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String name = (String) request.getAttribute("name");
// 	int nowpage = ((Integer) request.getAttribute("page")).intValue();
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>게시글 작성</title>
</head>

<script type="text/javascript">
	function checkForm() 
	{
		if (!document.newWrite.name.value) 
		{
			alert("성명을 입력하세요.");
			return false;
		}
		if (!document.newWrite.subject.value) 
		{
			alert("제목을 입력하세요.");
			return false;
		}
		if (!document.newWrite.content.value) 
		{
			alert("내용을 입력하세요.");
			return false;
		}		
	}
</script>

<body>
	<jsp:include page="../menu.jsp"/>
	<div class="container">
		<main role="main">
	        <div class="jumbotron">
	          <div class="col-sm-8 mx-auto">
	            <h1>Q&A</h1>
<%-- 	              <a href="./BoardListAction.do?pageNum=<%=nowpage%>" class="btn btn-primary">게시판으로»</a> --%>
	          </div>
	        </div>
	      </main>
	</div>
	
		<div class="container">

		<form name="newWrite" action="./BoardWriteAction.do" class="form-horizontal" method="post" onsubmit="return checkForm()">
			
			<input name="id" type="hidden" class="form-control" value="${sessionId}">
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" value="<%=name %>" placeholder="이름">
				</div>
			</div>
			
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >제목</label>
				<div class="col-sm-5">
					<input name="subject" type="text" class="form-control" placeholder="제목을 입력해주세요">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label">내용</label>
				<div class="col-sm-8">
					<textarea name="content" cols="50" rows="5" class="form-control" placeholder="내용을 입력해주시요"></textarea>
				</div>
			</div>
			
			<div class="form-group row" style="padding-top:60px;">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="reset"  class="btn btn-warning" value="취소 ">
					<input type="submit" class="btn btn-primary" value="등록 ">				
				</div>
			</div>
		</form>
		
	</div>
	<br>
	<jsp:include page="../footer.jsp" />
	
</body>
</html>