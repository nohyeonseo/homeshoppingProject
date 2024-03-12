<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<!-- 장바구니에 등록하는 페이지를 만들기 -->
<%
    String id = request.getParameter("id");
    if (id == null || id.trim().equals(""))
    {
        response.sendRedirect("mainpage.jsp");
        return;
    }

    ProductRepository dao = ProductRepository.getInstance();

    Product product = dao.getProductByIdFromDB(id); // 수정: DB에서 상품 정보 가져오기

    if (product == null) {
        response.sendRedirect("NoProductId.jsp");
        // 해당상품이 존재하지 않습니다.?
        return; // 중요: 위에서 product가 null이면 종료합니다.
    }

    ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");
    if (list == null) {
        list = new ArrayList<Product>();
        session.setAttribute("cartlist", list);
    }

    int cnt = 0;
    Product goodsQnt = null; // 수정: goodsQnt 객체를 null로 초기화

    for (int i = 0; i < list.size(); i++)
    {
        Product tempGoodsQnt = list.get(i); // 수정: 임시 변수에 장바구니 상품 정보 저장
        String tempGoodsQntId = tempGoodsQnt.getProductId(); // 수정: 임시 변수에 상품 ID 저장

        if (tempGoodsQntId != null && tempGoodsQntId.equals(id))
        {
            goodsQnt = tempGoodsQnt; // 수정: 일치하는 상품을 goodsQnt 변수에 저장
            cnt++;
            int orderQuantity = goodsQnt.getQuantity() + 1;
            goodsQnt.setQuantity(orderQuantity);
            break; // 수정: 일치하는 상품을 찾았으면 루프 종료
        }
    }

    if (cnt == 0)
    {
        product.setQuantity(1);
        list.add(product); // 수정: 상품을 리스트에 추가
    }

    // 리다이렉트를 이동할 URL로 미리 구성합니다.
    String redirectURL = "cart.jsp?id=" + id;

    // 응답 커밋 전에 sendRedirect()를 호출합니다.
    if (!response.isCommitted())
    {
        response.sendRedirect(redirectURL);
    }
%>