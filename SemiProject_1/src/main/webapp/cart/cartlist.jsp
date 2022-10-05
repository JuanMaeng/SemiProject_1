<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.NumberFormat"%>
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

<style type="text/css">
	#cartcontainer{
		margin-top: 100px;
		margin-bottom: 200px;
	}
	
	td>a>img{
		width: 50px;
		height: 50px;
	}
	
	td>a{
		text-decoration: none;
		color: black;
	}
	
	td{
		text-align: center;
		line-height: 50px;
	}
	
	.deletecart{
		cursor: pointer;
	}
</style>

<script type="text/javascript">
	$(function(){
		
		// 휴지통 아이콘 클릭시
		$(".deletecart").click(function(){
			
			var idx = $(this).attr("idx");
			alert("idx : " + idx);
			
		});
		
		
		// 전체체크, 전체해제
		$("#checkall").click(function(){
			
			var check = $(this).is(":checked");
			
			// alert(check);
			
			// 전체 체크값을 글 앞에있는 체크박스에 일괄전달
			$(".order-del-chk").prop("checked", check);
		});
	});
</script>

</head>
<%
String id = (String)session.getAttribute("idok");
NumberFormat nf = NumberFormat.getCurrencyInstance();
SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
%>
<body>
	<section class="ftco-section">
		<div class="container" id="cartcontainer">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-4">
					<h2 class="heading-section"><%= id %>님의 장바구니</h2>
					
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<div class="table-wrap">
					
						<!-- 장바구니에 담긴 상품목록 Start -->
						<table class="table">
							<tr>
								<th width="100" style="text-align: center;">
									<input type="checkbox" id="checkall">
								</th>
								<th>제품 정보</th>
								<th>단가</th>
								<th>수량</th>
								<th>총액</th>
								<th width="100">
									<button class="btn btn-outline-danger btn-sm">선택삭제</button>
								</th>
							</tr>
							
							<tr>
								<td>
									<input type="checkbox" class="order-del-chk">
								</td>
								
								<td style="text-align: left !important;">
									<a href="#">
										<img src="./assets/img/mainimg/recommend_mouse.jpg">
										신기한 마우스
									</a>
								</td>
								
								<td>
									단가
								</td>
								
								<td>
									수량
								</td>
								
								<td>
									총액
								</td>
								
								<td>
									<i class="fa fa-trash-alt deletecart" idx="1"></i>
								</td>
							</tr>
							<!-- 장바구니에 담긴 상품목록 End -->
							
							
							<!-- 주문서 Start -->
							<tr>
								<td colspan="4" align="center">
									선택상품금액 <strong><%= nf.format(200000) %></strong> + 배송비 <strong><%= nf.format(3000) %></strong> 
								</td>
								
								<td colspan="2" align="center">
									총 주문금액 <b><%= nf.format(203000) %></b>
									<button class="btn btn-outline-success">주문하기</button>
								</td>
							</tr>
							<!-- 주문서 End -->
							
						</table>
						
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>

<%-- <%
String id = (String)session.getAttribute("idok");
%>
<body>
	CartList<br>
	
	<%= id %>님의 장바구니
</body> --%>