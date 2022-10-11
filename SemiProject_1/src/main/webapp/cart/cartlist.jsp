<%@page import="data.dao.MemberDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.CartDao"%>
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

<script type="text/javascript">
	$(function(){
		
		// 휴지통 아이콘으로 삭제 >> 삭제 후 목록으로 reload를 해도 데이터가 안지워짐 보수 필요
		$("i.deletecart").click(function(){
			
			var idx = $(this).attr("idx");
			// alert(idx);
			
			var a = confirm("정말 삭제하시겠습니까 ?");
			
			if(a){
				
				del(idx);
			}
				location.reload();
		});
		
		// 전체체크, 전체해제
		$("#checkall").click(function(){
			
			var check = $(this).is(":checked");
			
			// alert(check);

			$(".del-chk").prop("checked", check);
		});
		
		
		// 선택삭제
		$("#chkdel").click(function(){
			
			var cnt = $(".del-chk:checked").length;
			
			// alert(cnt);
			
			if(cnt == 0){
				
				alert("삭제할 상품을 선택해 주세요");
				return;
				
			} else {
				
				var a = confirm("정말 삭제하시겠습니까 ?");
				
				if(a){
					
					$(".del-chk:checked").each(function(index, element){
						
						var idx = $(this).val();
						// alert(idx);
						
						del(idx);
					});
						location.reload();
				}
			}
		});
		
		
		$("button.cart-to-order").click(function(){

			var a = confirm("상품을 주문하시겠습니까 ?");
			
			if(a){
				
	 			$("tr.list").each(function(index, element){
				
					var p_num = $(this).attr("p_num");
					var m_num = $(this).attr("m_num");
					var cnt = $(this).attr("cnt");
					var price = $(this).attr("price");
					var idx = $(this).attr("idx");
					
					// alert(p_num + ", " + m_num + ", " + cnt + ", " + price);
				
					cartorder(idx, p_num, m_num, cnt, price);
	 			});
			} else {
				
				return;
			}
			
			location.href="index.jsp?main=orderpage/orderSuccess.jsp"
		});
		
		
		
		function del(idx){
			
			$.ajax({
				
				type: "get",
				dataType: "html",
				url: "cart/deletecart.jsp",
				data: {"idx":idx},
				success: function(){
					
				}
			});
		}
		
		function cartorder(idx, p_num, m_num, cnt, price){
			
			$.ajax({
				
				type: "post",
				dataType: "html",
				url: "orderpage/orderaction.jsp",
				data: {"idx":idx, "p_num":p_num, "m_num":m_num, "cnt":cnt, "price":price},
				success: function(){
					
				}
			});
		}
	});
</script>

</head>
<%
String id = (String)session.getAttribute("idok");
NumberFormat nf = NumberFormat.getCurrencyInstance();
SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");

CartDao dao = new CartDao();
List<HashMap<String, String>> list = dao.getCartList(id);

MemberDao mdao = new MemberDao();
String m_num = mdao.getMemberInfo(id).getM_num();
%>
<body>

	<div class="banner-wrap">
		<div class="banner-img">
			<img src="https://images-ext-2.discordapp.net/external/sf-sqIxnhHN0a3jRb3_Kih_MZij0WtPbCCkGr__kLaQ/%3Fv%3D1/https/resource.logitech.com/w_1800%2Ch_1800%2Cc_limit%2Cq_auto%3Abest%2Cf_jpg%2Cdpr_2.0/d_transparent.gif/content/dam/logitech/en/mx/mx-for-creativity/2022-update/september-update/mx-for-creativity-shortcuts-background-desktop.jpg?width=1092&height=447">	
		</div>
		<div class="banner-text">
			<b class="b1" style="color: white;"><%= id %>님의 장바구니</b>
			<p style="color: lightgray;"><%= nf.format(30000) %> 이상 구매 시 배송비 무료</p>
		</div>
	</div>

	<section class="ftco-section">
		<div class="container" id="cartcontainer">
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
								<th style="text-align: center;" width="200">단가</th>
								<th style="text-align: center;" width="160">수량</th>
								<th style="text-align: center;" width="200">총액</th>
								<th width="100">
									<button class="btn btn-outline-danger btn-sm" id="chkdel">선택삭제</button>
								</th>
							</tr>
							
							<%
							int totalprice = 0;
							
							CartDao cdao = new CartDao();
							int cartSize = cdao.getCartList(id).size();
							
							if(cartSize == 0) {
							%>
								<tr>
									<td colspan="6" align="center">
										<div class="alert alert-secondary" role="alert">
											장바구니에 등록된 상품이 없습니다 !
										</div>
									</td>
								</tr>
							<%
							} else {
								
								for(int i = 0; i < list.size(); i++){
							
									HashMap<String, String> map = list.get(i);
									
									int sum = (Integer.parseInt(map.get("price")) * Integer.parseInt(map.get("cnt")));
									totalprice += sum;
							%>
									<tr class="list" idx="<%= map.get("idx") %>" p_num="<%= map.get("p_num") %>" m_num="<%= m_num %>" cnt="<%= map.get("cnt") %>" price="<%= map.get("price") %>">
										<td>
											<input type="checkbox" class="del-chk" value="<%= map.get("idx") %>">
										</td>
										
										<td style="text-align: left !important;">
											<a href="index.jsp?main=product/detailpage.jsp?p_num=<%= map.get("p_num") %>">
												<img src="<%= map.get("thumbnail") %>">
												<%= map.get("name") %>
											</a>
										</td>

										<td>
											<%= map.get("price") %>
										</td>

										<td>
											<%= map.get("cnt") %>
										</td>

										<td>
											<%= sum %>
										</td>
										
										<td>
											<i class="fa fa-trash-alt deletecart" idx="<%= map.get("idx") %>"></i>
										</td>
									</tr>
									<!-- 장바구니에 담긴 상품목록 End -->
								<%
								}
								%>
								
								<!-- 주문서 Start -->
								<%
								int delivery = 3000;
								
								if(totalprice > 30000){
									delivery = 0;
								}
								%>
								<tr>
									<td colspan="3" align="center">
										상품금액 <strong><%= nf.format(totalprice) %></strong> + 배송비 <strong class="delivery"><%= nf.format(delivery) %></strong> 
									</td>
									
									<td colspan="3" align="center">
										총 주문금액 <b><%= nf.format(totalprice + delivery) %></b>&nbsp;&nbsp;&nbsp;&nbsp;
										<button class="btn btn-outline-success cart-to-order">주문하기</button>
									</td>
								</tr>
								<!-- 주문서 End -->
							<%
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