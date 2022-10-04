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
	margin-top: 600px;
    margin-right: 200px;
    margin-bottom: 400px;
    margin-left: 800px;	
}
div.loginbutton {
  color:blue; 
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
String myid=(String)session.getAttribute("idok");
String saveid=(String)session.getAttribute("saveok");
boolean save=true;
if(saveid==null || saveid.equals("no"))
{
	myid="";
	save=false;	//체크하지않을경우 false 그 외에는 초기값이 true
}
%>
	<div class="logform">
		<h2><span>Logitech 회원가입</span></h2>
			<form action="joinaction.jsp" method="post">
				<br>
				<input type="text" name="name" style="width: 300px;"
				class="form-control input-lg"
					placeholder="이름" required="required">
				<div style="padding: 5px;">
				</div>
				<br>
				<br>
				<input type="text" name="id" style="width: 300px;"
					class="form-control input-lg"
					placeholder="로그인시 사용할 Logitech ID" required="required" value="<%=myid%>">
					<div style="padding: 3px;">
				</div>
				<br>
					<input type="password" name="pw" style="width: 300px;"
					class="form-control input-lg"
					placeholder="비밀번호" required="required">
					<div style="padding: 3px;">
				</div>
				<br>
				<br>
					<input type="text" name="email" style="width: 300px;"
					class="form-control input-lg"
					placeholder="이메일" required="required">
					<div style="padding: 3px;">
				</div>
				<br>
				<br>
					<input type="text" name="hp" style="width: 300px;"
					class="form-control input-lg"
					placeholder="핸드폰번호" required="required">
				<div style="padding: 3px;">
				</div>
				<br>
				<br>
					<input type="text" name="Addr" style="width: 300px;"
					class="form-control input-lg"
					placeholder="주소" required="required">
					<div style="padding: 3px;">
				</div>
				<br>
				<br>
					<div class="loginbutton"> 
					<button type="submit" class="btn-btn-success btn-lg"
					style="width: 200px; height: 50px;">회원가입</button>
				</div>
			<br>
			<br>
		</form>
	</div>
</body>
</html>