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
  color:blue; 
  border: 1px solid gray; 
  color: white; 
  cursor: pointer;
  float: left;
}

a.gologin{
	color: black;
	text-decoration: none;
}

.idchk{
	position: absolute;
	left: 405px;
	top: 0px;
	height: 50px;
}
</style>

<script type="text/javascript">
	$(function(){
		
		/* $("#check").click(function(){
			
			var id = $("#id").val();
			// alert(id);
			
			$.ajax({
				
				type: "get",
				dataType: "json",
				url: "login/checkid.jsp",
				data: {"id":id},
				success: function(response){
					
					if(response.count == 1){
						
						// alert("중복됨");
						$("#check").removeClass("btn-outline-primary");
						$("#check").removeClass("btn-success");
						$("#check").addClass("btn-danger");
						$("#check").val("사용 불가");
						
					} else {
						
						// alert("중복안됨");
						$("#check").removeClass("btn-outline-primary");
						$("#check").removeClass("btn-danger");
						$("#check").addClass("btn-success");
						$("#check").val("사용 가능");
					}
				}
			});
		}); */
		
		
		// 아이디 입력하면 자동으로 옆에 버튼 바뀌도록
		$("#id").keyup(function(){
			
			var id = $("#id").val();
			// alert(id);
			
			$.ajax({
				
				type: "get",
				dataType: "json",
				url: "login/checkid.jsp",
				data: {"id":id},
				success: function(response){
					
					if(response.count == 1){
						
						// alert("중복됨");
						$("#check").removeClass("btn-outline-primary");
						$("#check").removeClass("btn-success");
						$("#check").addClass("btn-danger");
						$("#check").val("사용 불가");
						
					} else {
						
						// alert("중복안됨");
						$("#check").removeClass("btn-outline-primary");
						$("#check").removeClass("btn-danger");
						$("#check").addClass("btn-success");
						$("#check").val("사용 가능");

					}
				}
			});
		});
	});

</script>

<body>
	<div class="logform">
			<form action="login/joinaction.jsp" method="post">
			
				<img class="mb-4" src="assets/img/mainimg/logitechG.png" alt="" width="80" height="80" style="margin-left: 200px;">
				<h1 class="h3 mb-3 fw-normal" style="text-align: center;">Logitech 회원가입</h1>
	        
				<div class="form-floating">
					<input type="text" class="form-control" name="name" id="name" placeholder="이름 입력..." required="required">
					<label for="name">이름</label>
				</div>
		         
				<br>
		         
				<div class="form-floating">
					<input type="text" class="form-control" name="id" id="id" placeholder="아이디 입력..." required="required" style="width: 395px;">
					<input style="float: right; height: 57px !important;" class="btn btn-outline-primary idchk" type="button" id="check" value="중복 체크">
					<label for="id">아이디</label>
				</div>
				<br>
		        <br>
		         
		        <div class="form-floating">
					<input type="password" class="form-control" name="pw" id="pw" placeholder="비밀번호 입력..." required="required">
					<label for="pw">비밀번호</label>
				</div>
		         
		        <br>
		         
				<div class="form-floating">
					<input type="text" class="form-control" name="phone" id="phone" placeholder="전화번호 입력..." required="required">
					<label for="phone">전화번호&nbsp;<sub>010-1234-5678</sub></label>
				</div>
		         
		        <br>
		         
		         <div class="form-floating">
					<!-- <input type="text" class="form-control" name="email" id="email" placeholder="이메일 입력..." required="required"> -->
					<input type="email" class="form-control" name="email" id="email" placeholder="이메일 입력..." required="required">
					<label for="email">이메일&nbsp;<sub>google@gmail.com</sub></label>
				</div>
		         
		         <br>
		         
		         <div class="form-floating">
					<input type="text" class="form-control" name="addr" id="addr" placeholder="주소 입력..." required="required">
					<label for="addr">주소</label>
				</div>
		         
		         <br>
		         
		         <button class="w-100 btn btn-lg btn-primary" type="submit" id="submit">가입</button>
		         
		         <br><br>
		         
		         <a href="index.jsp?main=login/loginform.jsp" class="gologin">이미 로지텍의 회원이신가요?</a>
		</form>
	</div>
</body>
</html>


<%-- <br>
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
<br> --%>