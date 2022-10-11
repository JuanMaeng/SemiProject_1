<%@page import="data.dao.ProductDao"%>
<%@page import="data.dto.ProductDto"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.CartOrderDao"%>
<%@page import="data.dto.CartOrderDto"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
		margin-top: 50px;
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
	
	.banner-wrap{
		margin: 10px auto;
		position: relative;
	}
	
	.banner-wrap img {
		width: 100%;
		height: 400px;
		vertical-align: middle;
	}
	
	.banner-text {
		position: absolute;
		top: 50%;
		left: 50%;
		width: 100%;
		transform: translate(-50%, -50%);
		text-align: center;
	}
	
	b.b1 {
		font-size: 44pt;
		font-weight: bolder;
		margin-bottom: 20px;
	}
</style>

</head>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm");
NumberFormat nf = NumberFormat.getCurrencyInstance();

String id = (String)session.getAttribute("idok");
MemberDao mdao = new MemberDao();
String m_num = mdao.getMemberInfo(id).getM_num();

CartOrderDao dao = new CartOrderDao();
List<CartOrderDto> list = dao.getAllList(m_num);

ProductDto pdto = new ProductDto();
ProductDao pdao = new ProductDao();
%>
<body>

	<div class="banner-wrap">
		<div class="banner-img">
			<img src="https://images-ext-2.discordapp.net/external/sf-sqIxnhHN0a3jRb3_Kih_MZij0WtPbCCkGr__kLaQ/%3Fv%3D1/https/resource.logitech.com/w_1800%2Ch_1800%2Cc_limit%2Cq_auto%3Abest%2Cf_jpg%2Cdpr_2.0/d_transparent.gif/content/dam/logitech/en/mx/mx-for-creativity/2022-update/september-update/mx-for-creativity-shortcuts-background-desktop.jpg?width=1092&height=447">	
		</div>
		<div class="banner-text">
			<b class="b1" style="color: white;"><%= id %>님의 주문 목록</b>
			<p style="color: lightgray;">최근 3개월 내의 주문목록만 표시합니다.</p>
		</div>
	</div>

	<section class="ftco-section">
		<div class="container" id="cartcontainer">
			<div class="row">
				<div class="col-md-12">
					<div class="table-wrap">
					
						<!-- 주문목록 Start -->
						<table class="table">
							<tr>
								<th style="text-align: center;" width="100">주문 정보</th>
								<th style="text-align: center;" width="250">제품정보</th>
								<th style="text-align: center;" width="100">금액</th>
								<th style="text-align: center;" width="100">수량</th>
								<th style="text-align: center;" width="150">총액</th>
								<th style="text-align: center;" width="100">배송 상태</th>
							</tr>
							
							<%
							int totalprice = 0;
							
							
							if(list.size() == 0) {
							%>
								<tr>
									<td colspan="6" align="center">
										<div class="alert alert-secondary" role="alert">
											아직 주문한 상품이 없습니다 !
										</div>
									</td>
								</tr>
							<%
							} else {
								
								for(int i = 0; i < list.size(); i++){

									CartOrderDto dto = list.get(i);
									String p_num = dto.getP_num();
									totalprice = dto.getCnt() * dto.getPrice();
									
									pdto = pdao.getData(p_num);
							%>
									<tr>
										<td>
											<%= sdf.format(dto.getOrderday()) %>
										</td>
										
										<td style="text-align: left !important;">
											<a href="index.jsp?main=product/detailpage.jsp?p_num=<%= p_num %>">
												<img src="<%= pdto.getThumbnail() %>">
												<%= pdto.getName() %>
											</a>
										</td>

										<td>
											<%= nf.format(dto.getPrice()) %>
										</td>

										<td>
											<%= dto.getCnt() %>
										</td>

										<td>
											<%= nf.format(totalprice) %>
										</td>
										
										<td>
											<!-- 배송상태 어떻게 할건지 ... -->
										</td>
									</tr>
									<!-- 주문목록 End -->
							<%
								}
							}
							%>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>