<%@page import="data.dao.CartDao"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.CartDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String p_num = request.getParameter("p_num");

MemberDao mdao = new MemberDao();
String m_num = mdao.getMemberInfo((String)session.getAttribute("idok")).getM_num();

int cnt = Integer.parseInt(request.getParameter("cnt"));

// System.out.println(shopnum + ", " + num + ", " + cnt);

CartDto dto = new CartDto();

dto.setP_num(p_num);
dto.setM_num(m_num);
dto.setCnt(cnt);

CartDao dao = new CartDao();
dao.InsertCart(dto);

response.sendRedirect("index.jsp?main=cart/cartlist.jsp");
%>