<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="data.dao.MemberDao"%>
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
String id=request.getParameter("id");
String pw=request.getParameter("pw");
String save=request.getParameter("savechk");

//아이디와 비번 맞는지
MemberDao db=new MemberDao();
boolean b=db.isLogin(id, pw);

//맞으면 세션 저장후 로그인 메인으로 이동
if(b)
{
	//로그인중이니
	session.setAttribute("loginok", "yes");
	//아이디와 체크값 저장
	session.setAttribute("idok", id);
	//체크하면 값으로 on 체크안하면 null
	session.setAttribute("saveok", save);
	
	//세션유지시간
	session.setMaxInactiveInterval(60*60*8); //8시간유지
	
	//로그인 메인으로이동 
	response.sendRedirect("../index.jsp");


}else
{%>
	<script type="text/javascript">
	alert("아이디와 비밀번호가 맞지않습니다");
	history.back();
	</script>
<%}
%>
</body>
</html>