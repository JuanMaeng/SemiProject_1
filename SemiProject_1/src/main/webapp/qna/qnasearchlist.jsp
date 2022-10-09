<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@page import="data.dto.QnaBoardDto"%>
<%@page import="data.dao.QnaBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String subject = request.getParameter("subject");
QnaBoardDao dao = new QnaBoardDao();
List<QnaBoardDto> list = dao.getSearchQnas(subject);

JSONArray arr = new JSONArray();

for(QnaBoardDto dto:list){
	
	JSONObject ob = new JSONObject();
	
	ob.put("num",dto.getNum());
	ob.put("id",dto.getId());
	ob.put("subject",dto.getSubject());
	ob.put("content",dto.getContent());
	ob.put("readcount",dto.getReadcount());
	ob.put("writeday",dto.getWriteday());
	
	arr.add(ob);
}
%>

<%=arr.toString()%>
