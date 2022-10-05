<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="data.dao.QnaAnswerDao"/>
<jsp:useBean id="dto" class="data.dto.QnaAnswerDto"/>
<jsp:setProperty property="*" name="dto"/>

<%
dao.insertAnswer(dto);
%>
