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
<style type="text/css">
div.logform{
	width: 500px;
	margin-top: 150px;
    margin-bottom: 200px;
    margin-left: 35%;	
}
div.loginbutton {
  background-color:blue; 
  border: 1px solid gray; 
  color: white; 
  cursor: pointer;
  float: left;
  button:hover;{  
  color: white;
	}
}
</style>

<body>
<%
//세션으로부터 아이디와 체크값 획득
String myid = (String)session.getAttribute("idok");
String saveok = (String)session.getAttribute("saveok");

System.out.println(saveok);


if(saveok == null) {
	
	myid = "";
}
%>
	<div class="logform">
		<form action="login/loginaction.jsp" method="post">
			<img class="mb-4" src="assets/img/mainimg/logitechG.png" alt="" width="80" height="80" style="margin-left: 200px;">
			<h1 class="h3 mb-3 fw-normal" style="text-align: center;">Logitech 회원 로그인</h1>
        
	         <div class="form-floating">
	            <input type="text" class="form-control" name="id" id="id" placeholder="아이디 입력..." value="<%= myid %>">
	            <label for="id">id</label>
	         </div>
	         
	         <div class="form-floating">
	            <input type="password" class="form-control" name="pw" id="pw" placeholder="Password">
	            <label for="pwd">password</label>
	         </div>
	         
	         <div class="checkbox mb-3">
	               <input type="checkbox" name="savechk" <%= saveok == null  ? "" : "checked" %>> 아이디 저장
	         </div>
	         
	         <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
		</form>
	</div>
</body>
</html>

<%-- <input type="text" name="id" style="width: 300px;"
class="form-control input-lg"
	placeholder="id" required="required" value="<%=myid%>">
<div style="padding: 5px;">
</div>
<br>
	<input type="password" name="pw" style="width: 300px;"
	class="form-control input-lg"
	placeholder="password" required="required">
<br>
	<div class="loginbutton"> 
	<button type="submit" class="btn-btn-success btn-lg"
	style="width: 200px; height: 50px;">로그인</button>
</div>
<br>
	<div style="padding:30px 30px;">
	<input type="checkbox" name="savechk">아이디저장
</div> --%>