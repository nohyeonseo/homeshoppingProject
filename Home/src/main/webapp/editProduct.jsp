<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<style>
    .product {
        margin-bottom: 20px; /* 각 상품 사이에 간격 추가 */
    }

    .image-wrapper {
        min-height: 200px; /* 이미지의 최소 높이를 설정 (텍스트 상자 높이에 맞추세요) */
    }

    .image-wrapper img {
        max-width: 100%;
        height: auto;
    }

    .product-info {
        min-height: 150px; /* 텍스트 상자의 최소 높이를 설정 */
    }
</style>

<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>상품 편집</title>

<script type="text/javascript">

	function deleteConfirm(id) 
	{
		if (confirm("해당 상품을 삭제합니다!!") == true)
			location.href = "./deleteProduct.jsp?id=" + id;
		else
			return;
	}
</script>
</head>
<%
	String edit = request.getParameter("edit");
%>

<body>

	<jsp:include page="menu.jsp" />
	<div class="container">
		<main role="main">
			<div class="jumbotron">
		    	<div class="col-sm-8 mx-auto">
		        	<h1>상품편집하기</h1>
		        </div>
		    </div>
		</main>
	</div>
<%@ include file="dbconn.jsp"%>
	
	<div class="container">
    <div class="row">
        <%
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "select * from product";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        int productCount = 0; // 상품 카운트를 유지하여 3개씩 출력
        while (rs.next()) {
            %>
             <div class="col-md-4">
                <div class="product">
                    <div class="image-wrapper">
                        <img src="./upload3/<%=rs.getString("p_fileName")%>" style="max-width: 100%; height: auto;">
                    </div>
                    <div class="product-info">
                        <h3><%=rs.getString("p_name")%></h3>
                        <p><%=rs.getString("p_description")%></p>
                        <p><%=rs.getString("p_UnitPrice")%>원</p>
                        <%
                            if (edit.equals("update")) {
                        %>
                        <a href="./updateProduct.jsp?id=<%=rs.getString("p_id")%>" class="btn btn-success" role="button"> 수정 &raquo;></a>
                        <%
                            }
                            else if (edit.equals("delete")) {
                        %>
                        <a href="#" onclick="deleteConfirm('<%=rs.getString("p_id")%>')" class="btn btn-danger" role="button">삭제 &raquo;></a>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
            <%
            productCount++;
            if (productCount == 3) {
                // 3개의 상품이 출력되면 새로운 줄로 넘어갑니다.
                %>
                </div><div class="row">
                <%
                productCount = 0; // 상품 카운트 초기화
            }
        }
        if (rs != null)
            rs.close();
        if (pstmt != null)
            pstmt.close();
        if (conn != null)
            conn.close();
        %>
    </div>
</div>


	<br>
<%-- 	<jsp:include page="footer.jsp" /> --%>
</body>
</html>













