<%@page import="data.dao.CartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String idx = request.getParameter("idx");

CartDao dao = new CartDao();
dao.deleteCart(idx);
%>