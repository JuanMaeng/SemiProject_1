<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dao" class="data.dao.DetailProductDao"/>
<jsp:useBean id="dto" class="data.dto.DetailProductDto"/>
<jsp:setProperty property="*" name="dto"/>

<%
dao.insertProduct(dto);
response.sendRedirect("../index.jsp?main=product/addform.jsp");
%>