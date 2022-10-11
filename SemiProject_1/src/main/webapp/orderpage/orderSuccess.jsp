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
	div.succ{
		width: 500px;
		margin-top: 150px;
	    margin-bottom: 200px;
	    margin-left: 35%;	
	}
</style>

<script type="text/javascript">
	$(function(){
		
		$("button.olist").click(function(){
			
			location.href="index.jsp?main=orderpage/myorder.jsp";
		});
		
		$("button.mainpage").click(function(){
			location.href="index.jsp";
		});
	});

</script>

<body>
	<div class="succ">
		<img class="mb-4" src="assets/img/mainimg/success.png" alt="" width="80" height="80" style="margin-left: 200px;">
		<h1 class="h3 mb-3 fw-normal" style="text-align: center;">주문이 완료되었습니다.</h1>
       
		<div align="center">
			<button class="btn btn-lg btn btn-outline-secondary olist" style="width: 230px;" type="button">주문 목록</button>
			<button class="btn btn-lg btn btn-outline-secondary mainpage" style="width: 230px;" type="button">메인 화면</button>
		</div>
	</div>
</body>
</html>