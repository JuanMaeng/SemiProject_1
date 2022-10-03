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
<title>Insert title here</title>
</head>
<body>
	<%
	String loginok = (String)session.getAttribute("loginok");
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
	String pw = (String)session.getAttribute("pw"); 
	
	if(loginok == null){
		
		session.setMaxInactiveInterval(60 * 60 * 8); // 생략 시 30분
		session.setAttribute("loginok", "yes");
		session.setAttribute("id", "won");
		
	} else {
		
		session.removeAttribute("loginok");
		session.removeAttribute("id");
		//이거 세션 지울 때 초기화하는 session.invalidate(); 이거 써야 확실히 세션이 지워지는 것 같음
		
	}
	
	response.sendRedirect("../index.jsp");
	%>
</body>
</html>