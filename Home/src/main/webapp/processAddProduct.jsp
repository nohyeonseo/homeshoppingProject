<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import ="com.oreilly.servlet.*"%>
<%@ page import ="com.oreilly.servlet.multipart.*"%>
<%@ page import ="java.util.*" %>
<%@ page import ="java.sql.*" %>

<%@ include file ="dbconn.jsp" %>

<%
	request.setCharacterEncoding("utf-8");

	String filename= "";
	String realFolder = getServletContext().getRealPath("/")+"upload3";
	System.out.println("경로 확인 --->"+realFolder);

	int maxSize = 5*1024*1024;
	String encType="utf-8";
	// MultiPartRequest 객체 생성 부분
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	String productId = multi.getParameter("productId");
    String name = multi.getParameter("name");
    String productImage = multi.getFilesystemName("productImage");
    String desciption = multi.getParameter("desciption");
    String detail = multi.getParameter("detail");
    String category = multi.getParameter("category");
    //가격을 문자열로 저장
    String unitPriceStr = multi.getParameter("unitPrice");
    String type = multi.getParameter("type");
    
	 // 가격을 정수형으로 변환해서 저장할 변수 선언
    int unitPriceInt;

    try 
    {	
    	// 문자열을 정수로 변환
    	unitPriceInt = Integer.parseInt(unitPriceStr);
    } 
    catch (NumberFormatException e) 
    {
    	unitPriceInt = 0;	 // 문자열을 정수로 변환
    	e.printStackTrace(); // 예외 메시지와 스택 트레이스 출력
    }

	Enumeration files = multi.getFileNames();
	String fname =  (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);

	PreparedStatement pstmt = null;
	
	String sql = "insert into product values(?,?,?,?,?,?,?,?)";
	
	try 
	{
	    pstmt=conn.prepareStatement(sql);
	    
	    pstmt.setString(1, productId);
	    pstmt.setString(2, name);
	    pstmt.setString(3, productImage);
	    pstmt.setString(4, desciption);
	    pstmt.setString(5, detail);
	    pstmt.setString(6, category);
	    pstmt.setInt(7, unitPriceInt);
	    pstmt.setString(8, type);
	    
	    pstmt.executeUpdate();
	} 
	catch (SQLException e)
	{
	    e.printStackTrace();
	} 
	finally 
	{
	    if (pstmt != null) 
	    {
	        pstmt.close();
	    }
	    if (conn != null)
	    {
	        conn.close();
	    }
	}
	
	response.sendRedirect("mainpage.jsp");
%>