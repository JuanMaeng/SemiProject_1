<%@page import="data.dto.QnaAnswerDto"%>
<%@page import="data.dao.QnaAnswerDao"%>
<%@page import="org.json.simple.JSONObject"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String idx = request.getParameter("idx");
QnaAnswerDao dao = new QnaAnswerDao();
QnaAnswerDto dto = dao.getAnswer(idx);

JSONObject ob = new JSONObject();

ob.put("idx",dto.getIdx());
ob.put("content",dto.getContent());
%>

<%=ob.toString()%>