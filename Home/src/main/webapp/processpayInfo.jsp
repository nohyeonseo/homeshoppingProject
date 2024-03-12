<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLEncoder"%>
<%
	request.setCharacterEncoding("utf-8");

	Cookie cartId = new Cookie("Shipping_cartId", URLEncoder.encode(request.getParameter("cartId"), "utf-8"));
	Cookie name = new Cookie("Shipping_name", URLEncoder.encode(request.getParameter("name"), "utf-8"));
	Cookie phonenumber = new Cookie("Shipping_phonenumber",	URLEncoder.encode(request.getParameter("phonenumber"), "utf-8"));
	Cookie deliverydate = new Cookie("Shipping_deliverydate",URLEncoder.encode(request.getParameter("deliverydate"), "utf-8"));
	Cookie country = new Cookie("Shipping_country",	URLEncoder.encode(request.getParameter("country"), "utf-8"));
	Cookie zipCode = new Cookie("Shipping_zipCode",	URLEncoder.encode(request.getParameter("zipCode"), "utf-8"));
	Cookie address = new Cookie("Shipping_address",	URLEncoder.encode(request.getParameter("address"), "utf-8"));
	Cookie bankname = new Cookie("Shipping_bankname",URLEncoder.encode(request.getParameter("bankname"), "utf-8"));
	Cookie cdnumber = new Cookie("Shipping_cdnumber",URLEncoder.encode(request.getParameter("cdnumber"), "utf-8"));
	
	cartId.setMaxAge(24 * 60 * 60);
    name.setMaxAge(24 * 60 * 60);
    phonenumber.setMaxAge(24 * 60 * 60);
    deliverydate.setMaxAge(24 * 60 * 60);
    country.setMaxAge(24 * 60 * 60);
    zipCode.setMaxAge(24 * 60 * 60);
    address.setMaxAge(24 * 60 * 60);
    bankname.setMaxAge(24 * 60 * 60);
    cdnumber.setMaxAge(24 * 60 * 60);

    response.addCookie(cartId);
    response.addCookie(name);
    response.addCookie(phonenumber);
    response.addCookie(deliverydate);
    response.addCookie(country);
    response.addCookie(zipCode);
    response.addCookie(address);
    response.addCookie(bankname);
    response.addCookie(cdnumber);

	response.sendRedirect("orderCompleted.jsp");
%>
