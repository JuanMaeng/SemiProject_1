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

<!-- 파비콘 -->
<link rel="shortcut icon" href="assets/img/mainimg/favicon.ico" type="image/x-icon"/>

<title>Insert title here</title>
</head>
<%
String root =request.getContextPath();

String mainPage = "layout/main.jsp";

//url을 통해서 main값을 읽어 메인페이지에 출력
if(request.getParameter("main")!=null){
	
	mainPage=request.getParameter("main");
}
%>
<body>

<div class="layout header">
	<jsp:include page="layout/header.jsp"/>
</div>
<div class="layout main">
	<jsp:include page="<%=mainPage %>"/>
</div>
<div class="layout footer">
	<jsp:include page="layout/footer.jsp"/>
</div>

</body>
</html>