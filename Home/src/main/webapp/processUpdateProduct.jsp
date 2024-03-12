<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<%@ include file="dbconn.jsp" %>
<%
	String filename = "";
	String realFolder = getServletContext().getRealPath("/") + "upload3";
	System.out.println("경로확인---->"+realFolder);

	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb

	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	
	String productId = multi.getParameter("productId");
	String name = multi.getParameter("name");
	String description = multi.getParameter("description");
	String detail = multi.getParameter("detail");
	String category = multi.getParameter("category");
	//가격을 문자열로 저장
    String unitPriceStr = multi.getParameter("unitPrice");
	String type = multi.getParameter("type");
	String newFileName = multi.getFilesystemName("newProductImage"); // 새 이미지 파일 이름

	 // 가격을 정수형으로 변환해서 저장할 변수 선언
    int unitPriceInt;

	if (unitPriceStr.isEmpty())
		unitPriceInt = 0;
	else
		unitPriceInt = Integer.valueOf(unitPriceStr);

	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);	

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
    String sql = "select * from product where p_id = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, productId);
    rs = pstmt.executeQuery();
    
    if (fileName != null) 
    {
        sql = "UPDATE product SET p_name=?, p_unitPrice=?, p_description=?, p_detail=? , p_category=?, p_fileName=?, p_type=? WHERE p_id=?";
        pstmt = conn.prepareStatement(sql);
        
        pstmt.setString(1, name);
        pstmt.setInt(2, unitPriceInt);
        pstmt.setString(3, description);
        pstmt.setString(4, detail);
        pstmt.setString(5, category);
        pstmt.setString(6, newFileName); // 수정된 부분
        pstmt.setString(7, type);
        pstmt.setString(8, productId);
        pstmt.executeUpdate();
    } 
    else 
    {
        sql = "UPDATE product SET p_name=?, p_unitPrice=?, p_description=?, p_category=?, p_type=? WHERE p_id=?";
        pstmt = conn.prepareStatement(sql);
        
        pstmt.setString(1, name);
        pstmt.setInt(2, unitPriceInt);
        pstmt.setString(3, description);
        pstmt.setString(4, category);
        pstmt.setString(5, type);
        pstmt.setString(6, productId);
        pstmt.executeUpdate();
    }
	
	if (rs != null)
		rs.close();
 	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();

	response.sendRedirect("editProduct.jsp?edit=update");
%>