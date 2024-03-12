<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<%
    String productId = request.getParameter("id");

    PreparedStatement pstmt = null;

    String sql = "delete from product where p_id=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, productId);
    int rowsAffected = pstmt.executeUpdate();

    if (rowsAffected > 0) {
        response.sendRedirect("editProduct.jsp?edit=delete");
    } else {
        out.println("일치하는 상품이 없습니다.");
    }

    if (pstmt != null)
        pstmt.close();
    if (conn != null)
        conn.close();
%>