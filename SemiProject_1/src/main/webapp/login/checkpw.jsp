<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String pw = request.getParameter("pw");
String pwchk = request.getParameter("pwchk");

int flag = 0;

if(pw.equals(pwchk)) {
	
	flag = 1;
}

JSONObject obj = new JSONObject();

obj.put("flag", flag);
%>

<%= obj.toString() %>