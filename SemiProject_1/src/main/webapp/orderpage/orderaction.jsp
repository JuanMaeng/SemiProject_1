<%@page import="data.dao.CartDao"%>
<%@page import="data.dao.CartOrderDao"%>
<%@page import="data.dto.CartOrderDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String idx = request.getParameter("idx");
String p_num = request.getParameter("p_num");
String m_num = request.getParameter("m_num");
int cnt = Integer.parseInt(request.getParameter("cnt"));
int price = Integer.parseInt(request.getParameter("price"));

// System.out.println(p_num + ", " + m_num + ", " + cnt + ", " + price);

CartOrderDto dto = new CartOrderDto();
dto.setP_num(p_num);
dto.setM_num(m_num);
dto.setCnt(cnt);
dto.setPrice(price);

CartOrderDao dao = new CartOrderDao();
CartDao cartdao = new CartDao();

dao.insertOrder(dto);

if(idx != null){
	
	cartdao.deleteCart(idx); // 주문목록으로 이동된 장바구니 내역 삭제
}
%>