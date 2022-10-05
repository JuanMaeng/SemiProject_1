<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="data.dto.QnaAnswerDto"%>
<%@page import="data.dao.QnaAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String num = request.getParameter("num");

QnaAnswerDao dao = new QnaAnswerDao();

List<QnaAnswerDto> list = dao.getAllAnswers(num);

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

//member에서 id를 통해 이름도 가져오기
MemberDao mdao = new MemberDao();
 
JSONArray arr = new JSONArray();

for(QnaAnswerDto dto:list){
	JSONObject ob = new JSONObject();
	
	ob.put("idx",dto.getIdx());
	ob.put("num", dto.getNum());
	ob.put("name", mdao.getName(dto.getId()));
	ob.put("id", dto.getId());
	ob.put("content", dto.getContent());
	ob.put("writeday", sdf.format(dto.getWriteday()));
	
	arr.add(ob);
	
}

%>

<%=arr.toString() %>
