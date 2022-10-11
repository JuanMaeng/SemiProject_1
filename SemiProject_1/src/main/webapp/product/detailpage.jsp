<%@page import="data.dto.DetailProductDto"%>
<%@page import="data.dao.DetailProductDao"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ProductDao"%>
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
	div.div-item{
		text-align: center;
	}
	.item{
		width:130px !important;
		margin: 5px auto;
	}
	.photo, .bigphoto {
		cursor: pointer;
	}
	hr.divider { 
		margin: 5px;
		border-width: 1px;
	}
	.sysblock, .compoblock {
		cursor: pointer;
		margin-top:5px;
		margin-bottom:5px;
	}
	#sysreq, #components{
		padding: 10px;
		margin-bottom: 0px !important;
		font-size: 12pt !important;
	}
	.count{
		margin: 0 !important;
	}
</style>
<script type="text/javascript">
$(function (){
	
	var flag1 = true;
	var flag2 = true;
	
	$("img.photo").click(function() {
		
		var pho = $(this).attr("src");
		//alert(pho);
		
		$("#product-detail").attr("src",pho);
	});
	
	$(document).on("click",".sysblock",function() {
		
		$("#sysreq").slideToggle(100);
		
		if(flag1){
			$("#isys").attr("class","fa fa-fw fa-minus");
			flag1 = false;
		}
		else {
			$("#isys").attr("class","fa fa-fw fa-plus");
			flag1 = true;
		}
		
	});
	
	$(document).on("click",".compoblock",function() {

		$("#components").slideToggle(100);
		
		if(flag2){
			$("#icompo").attr("class","fa fa-fw fa-minus");
			flag2 = false;
		}
		else {
			$("#icompo").attr("class","fa fa-fw fa-plus");
			flag2 = true;
;
		}
	});
	
	$("#cart").click(function() {
		var p_num = $(this).attr("p_num");
		var cnt = $("#count").val();
		
		//alert(p_num+", "+cnt);
		<%
		String loginok=(String)session.getAttribute("loginok");

		if(loginok==null) {%>
			
			alert("로그인이 필요한 서비스입니다.");
			location.href="index.jsp?main=login/loginmain.jsp";
		<%}
		else {%>
			
			location.href="index.jsp?main=cart/cartlist.jsp?p_num="+p_num+"&cnt="+cnt;
		<%}
		%>
	});
	
	$("#order").click(function() {
		<%

		if(loginok==null) {%>
			
			alert("로그인이 필요한 서비스입니다.");
			location.href="index.jsp?main=login/loginmain.jsp";
		<%}
		
		%>
	});
});


</script>
</head>
<%
String p_num = request.getParameter("p_num");
ProductDao dao = new ProductDao();
ProductDto dto = dao.getData(p_num);

DetailProductDao ddao = new DetailProductDao();
DetailProductDto ddto = ddao.getData(p_num);

NumberFormat nf=NumberFormat.getCurrencyInstance();
%>
<body>

<section class="bg-light">
        <div class="container pb-5">
            <div class="row">
                <div class="col-lg-7 mt-5">
                	<div class="row">
	                    <div class="active">
	                        <div class="row mb-3" style="justify-content: center;">
	                        	<div class="col-3 item card">
                                    <img class="card-img img-fluid photo" src="<%=dto.getThumbnail() %>" onerror="this.parentNode.remove(parentNode)">
	                            </div>
	                            <div class="col-3 item card">
                                    <img class="card-img img-fluid photo" src="<%=ddto.getPhoto1() %>" onerror="this.parentNode.remove(parentNode)">
	                            </div>
	                            <div class="col-3 item card">
                                    <img class="card-img img-fluid photo" src="<%=ddto.getPhoto2() %>" onerror="this.parentNode.remove(parentNode)">
	                            </div>
	                            <div class="col-3 item card">
                                    <img class="card-img img-fluid photo" src="<%=ddto.getPhoto3() %>" onerror="this.parentNode.remove(parentNode)">
	                            </div>
	                            <div class="col-3 item card">
                                    <img class="card-img img-fluid photo" src="<%=ddto.getPhoto4() %>" onerror="this.parentNode.remove(parentNode)">
	                            </div>
	                        </div>
	                    </div>


                    </div>
                    <div class="card mb-3" style="padding:100px;">
                        <img class="card-img img-fluid" src="<%=dto.getThumbnail() %>" alt="Card image cap" id="product-detail" style="height:50%;" >
                    </div>
                    
                </div>

                <div class="col-lg-5 mt-5">
                    <div class="card">
                        <div class="card-body">
                        	<p class="text-muted"><strong><%=dto.getCollection() %></strong></p>
                            <h1 class="h2"><%=dto.getName() %></h1>
                            <p class="text-muted"><%=dto.getDescription() %></p>
                            <p class="h3 py-3"><%=nf.format(dto.getPrice()) %></p>

                            <p class="text-muted" style="font-size: 11pt !important;"> &nbsp;&nbsp;<%=ddto.getDescription() %></p>
							
							
							<hr class="divider">
							<div class="row" style="padding:5px 20px 5px 10px; align-items: center;">
								<div class="sysblock row">
									<div class="col">
										<span>시스템 요구사항</span>
									</div>
									<div class="col" style="text-align: right;">
										<i class="fa fa-fw fa-plus" id="isys"></i>
									</div>
								</div>
								<div>
									<p class="text-muted" id="sysreq"><%=ddto.getSysreq().replace("\n","<br>") %></p>
								</div>
							</div>
							<hr class="divider" style="margin-top:0 !important;">
							<div class="row" style="padding:5px 20px 5px 10px; align-items: center;">
								<div class="compoblock row">
									<div class="col">
										<span>구성품</span>
									</div>
									<div class="col" style="text-align: right;">
										<i class="fa fa-fw fa-plus" id="icompo"></i>
									</div>
								</div>
								<div>
									<p class="text-muted" id="components"><%=ddto.getComponents().replace("\n","<br>") %></p>
								</div>
							</div>
							<hr class="divider" style="margin-top:0 !important;">
							

                            <form action="" method="get">
	                            <input type="hidden" name="p_num" value="<%=dto.getP_num()%>">
	                            
	                            <div class="mt-5 row">
	                            	<div class="col" style="align-items: center;">
	                                	<p style="font-size: 14pt !important; margin-bottom: 0 !important; display: inline;"><strong>수량 : </strong></p>
	                                	<input type="button" class="btn btn-light btn-sm" value=" - " onclick="del();">
										<input type="text" name="cnt" class="count" id="count" value="1" size="3" style="text-align: center; width: 40px;">
										<input type="button" class="btn btn-light btn-sm" value=" + " onclick="add();">
                                	</div>
								</div>
											
                                <div class="row pb-3 mt-4">
                                    <div class="col d-grid">
                                        <button type="button" class="btn btn-outline-secondary" id="cart" p_num="<%=dto.getP_num()%>">장바구니</button>
                                    </div>
                                    <div class="col d-grid">
										<button type="button" class="btn btn-outline-info" id="order" p_num="<%=dto.getP_num()%>">바로구매</button>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Close Content -->
    
	<script type="text/javascript">
		$("#sysreq").hide();
		$("#components").hide();
		
		$("#cart").click(function (){
			if(loginok!=null) {
				alert("로그인이 필요한 서비스입니다.");
				location.href='index.jsp?main=login/loginmain.jsp';
			}
		});
		
		function del() {
			
			var cnt = $("#count").val();
			if(cnt > 1){
				cnt--;
			}
			$("#count").val(cnt);
		}

		function add() {
			
			var cnt = $("#count").val();
			if(cnt < 10){
				cnt++;
			}
			$("#count").val(cnt);
		}
	</script>
  
</body>
</html>
