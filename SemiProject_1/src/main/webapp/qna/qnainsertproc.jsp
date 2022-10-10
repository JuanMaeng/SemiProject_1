
<%@page import="data.dao.QnaBoardDao"%>
<%@page import="data.dto.QnaBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" href="assets/css/templatemo.css">
<link rel="stylesheet" href="assets/css/custom.css">

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="assets/css/fontawesome.min.css">
<title>Insert title here</title>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String subject = request.getParameter("subject");
String content = request.getParameter("content");
String category = request.getParameter("category");

QnaBoardDto dto = new QnaBoardDto();

dto.setId(id);
dto.setSubject(subject);
dto.setContent(content);
dto.setCategory(category);

QnaBoardDao dao = new QnaBoardDao();

dao.insertQna(dto);

response.sendRedirect("../index.jsp?main=qna/qnaboard.jsp");

%>
</body>
</html>