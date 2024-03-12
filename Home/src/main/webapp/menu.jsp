<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<html>
<head>
<link rel="stylesheet" href="./resource/css/bootstrap.min.css" />
<title>header</title>
</head>

<body>


<div class="container">
	<nav class="navbar navbar-expand-lg navbar-light bg-light rounded">
	
	<c:choose>
    <c:when test="${empty sessionId}">
        <div class="navbar">
            <div class="dropdown">
<!--                 <button class="dropbtn">로그인</button> -->
                <div class="dropdown-content">
                    <a href="login.jsp">로그인</a>
                    <a href="addMember.jsp">회원가입</a>
                </div>
            </div>
        </div>
    </c:when>
   
    <c:otherwise>
        <div class="navbar">
            <button class="navbar-toggle">로그아웃</button>
        </div>
    </c:otherwise>
</c:choose>
		
    
    
        <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample10">
        	<ul class="navbar-nav">
        	
			<c:choose>
			
			    <c:when test="${sessionId == 'operator'}">
			        <li class="nav-item">
			            <a class="nav-link" href="./mainpage.jsp">
			                <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">CD</font></font>
			            </a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link" href="./dvd.jsp">
			                <font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> DVD</font></font>
			            </a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link" href="./photo.jsp">
			                <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">PHOTOBOOK</font></font>
			            </a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link" href="<c:url value="/BoardListAction.do?pageNum=1"/>">
			                <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Q&A</font></font>
			            </a>
			        </li>
			        
			        
			        <li class="nav-item">
			            <a class="nav-link" href="<c:url value="/addProduct.jsp"/>">
			                <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">상품등록</font></font>
			            </a>
			        </li>

			        <li class="nav-item">
			            <a class="nav-link" href="<c:url value="/editProduct.jsp?edit=update"/>">
			                <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">상품수정</font></font>
			            </a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link" href="<c:url value="/editProduct.jsp?edit=delete"/>">
			                <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">상품삭제</font></font>
			            </a>
			        </li>
			    </c:when>
			    
			    <c:when test="${empty sessionId || sessionId ne 'otherId'}">
			        
			        <li class="nav-item">
			            <a class="nav-link" href="./mainpage.jsp">
			                <font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> CD </font></font>
			            </a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link" href="./dvd.jsp">
			                <font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> DVD </font></font>
			            </a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link" href="./photo.jsp">
			                <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">PHOTOBOOK</font></font>
			            </a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link" href="<c:url value="./BoardListAction.do?pageNum=1"/>">
			                <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Q&A</font></font>
			            </a>
			        </li>
			    </c:when>
			</c:choose>       	
            	
            </ul>
        </div>
	</nav>	
</div>

</body>

<script>
    /* JavaScript로 드롭다운 토글 기능 추가 */
    var dropdowns = document.getElementsByClassName("dropdown");
    var i;

    for (i = 0; i < dropdowns.length; i++) 
    {
        dropdowns[i].addEventListener("click", function() 
        		{
            this.classList.toggle("active");
            var dropdownContent = this.querySelector(".dropdown-content");
            if (dropdownContent.style.display === "block") {
                dropdownContent.style.display = "none";
            } 
            else 
            {
                dropdownContent.style.display = "block";
            }
        });
    }
</script>

</html>