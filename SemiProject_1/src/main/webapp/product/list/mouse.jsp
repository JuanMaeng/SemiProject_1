<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ProductDao"%>
<%@page import="data.dto.ProductDto"%>
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

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="assets/css/fontawesome.min.css">
<title>Insert title here</title>
<style type="text/css">
	a{
		cursor: pointer;
		color: black;
	}
	
	div.subtitle{
		/* font-family: 'Noto Sans'; */
		font-size: 0.9em !important;
		color: gray;
	}
	.banner-wrap{
		margin: 10px auto;
		position: relative;
	}
	.banner-wrap img {
		width: 100%;
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
	.body {
		height: 180px;
	}
	.body-price{
		position: absolute;
		bottom: 10px;
	}
	.titleblock{
		margin-bottom: 5px;
	}
</style>
<script type="text/javascript">
$(function(){
	flag = true;
	
	$(document).on("click",".collectionblock",function() {
		
		if($("#collectioncon").is(":visible") != true) {
			$("#icollection").attr("class","fa fa-fw fa-plus");
			$("#collectioncon").slideDown(200);
			
		}
		else {
			$("#icollection").attr("class","fa fa-fw fa-minus");
			$("#collectioncon").slideUp(200);
			
		}
		
	});
	
	
});


</script>
</head>
<%
ProductDao dao = new ProductDao();
List<ProductDto> list= dao.getAllProduct();
NumberFormat nf=NumberFormat.getCurrencyInstance();
request.setCharacterEncoding("utf-8");
%>
<body>
<!-- Start Content -->
	
	<div class="banner-wrap">
		<div class="banner-img">
			<img src="https://resource.logitech.com/w_1800,h_1800,c_limit,q_auto,f_auto,dpr_2.0/d_transparent.gif/content/dam/logitech/en/plp/mice/hero-desktop.png?v=1">	
		</div>
		<div class="banner-text">
			<b class="b1">마우스</b>
			<p>나에게 맞는 마우스를 찾아보세요</p>
		</div>
	</div>
	

    
    <div class="container-xl py-5">
	    필터입력값 : <input type="text" id="showFilter"/>
        <div class="row">

            <div class="col-lg-3">
                <h1 class="h2 pb-4">Categories</h1>
                
                <div class="row" style="padding:5px 20px 5px 10px; align-items: center;">
					<div class="collectionblock titleblock row" style="cursor: pointer;">
						<div class="col">
							<span class="collapse show pl-3"><strong>컬렉션</strong></span>
						</div>
						<div class="col" style="text-align: right;">
							<i class="fa fa-fw fa-plus" id="icollection"></i>
						</div>
					</div>
					<div id="collectioncon" style="margin-left: 20px;">
						<p><label for="master" style="cursor: pointer;"><input type="checkbox" class="filters" id="master" value="마스터 시리즈" onchange="makeFilter(this);")>&nbsp;&nbsp;마스터 시리즈</label></p>
						<p><label for="ergo" style="cursor: pointer;"><input type="checkbox" class="filters" id="ergo" value="Ergo 시리즈" onchange="makeFilter(this);">&nbsp;&nbsp;Ergo 시리즈</label></p>
						<p><label for="wireless" style="cursor: pointer;"><input type="checkbox" class="filters" id="wireless" value="무선" onchange="makeFilter(this);">&nbsp;&nbsp;무선</label></p>
					</div>
					
				</div>
            </div>

            <div class="col-lg-9">
                <div class="row">
                <!-- start product -->
                <%
                	for(ProductDto dto:list) {
                		if(dto.getCategory().equals("마우스")) {
                	%>
                    <div class="col-md-4 <%=dto.getCollection()%> lists">
                        <div class="card mb-4 product-wap rounded-0" style="border:0;">
                        	
                            <div class="card rounded-0" style="border: 0;">
                            	<a href="index.jsp?main=product/detailpage.jsp?p_num=<%=dto.getP_num() %>" class="h3 text-decoration-none">
                                	<img class="card-img rounded-0 img-fluid" src="<%=dto.getThumbnail()%>">
                                    <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">

                                	</div>
                                </a>
                            </div>
                            <div class="card-body rounded-0 body">
                            	<div class="subtitle"><%=dto.getCollection() %></div>
                            	<div style="margin-bottom: 10px;">
	                            	<a href="index.jsp?main=product/detailpage.jsp?p_num=<%=dto.getP_num() %>" class="h3 text-decoration-none">
	                                	<b><%=dto.getName() %></b>
	                                </a>
                            	</div>
                                <div class="subtitle"><%=dto.getDescription() %></div>
                                <div class="body-price">
                                	<p class="text-center mb-0"><%=nf.format(dto.getPrice()) %></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%	}
                	}
                    %>
                    <!-- end product -->
                </div>
            </div>

        </div>
    </div>
    <script type="text/javascript">
    /* $(document).ready(function() {
    	
    	$("input:checkbox").on('click', function() {
    		
			if ( $(this).prop('checked') ) {
				
				console.log($(this).val());
				var filter = $(this).val();
				$(".lists").hide();
				$("."+filter).show();
				
				
				
			} else {
				var filter = $(this).val();
				$(".lists").show();
				
			}
		});
	}); */
	
	var filterArr = new Array(); //필터 내용을 저장하는 배열
    var showFilterValue = document.getElementById("showFilter");//필터입력값 보여주기 위한 text
    
    function makeFilter(target) {
    	
    	var filterVal = target.value;
    	var confirmCheck = target.checked;
    	console.log("필터 선택값 : " + filterVal);
    	console.log("선택 여부 : " + confirmCheck);
    	
    	if(confirmCheck == true) {
    		
    		console.log("check");
    		filterArr.push(filterVal);
    	} else {
    		
    		filterArr.splice(filterArr.indexOf(filterVal), 1);
    	}
    	showFilterValue.value = filterArsr;
    	
		
    }
    
	/* $(document).ready(function() {
    	
    	$("input:checkbox").on('click', function() {
    		
    		if(filterArr.length == null) {
    			alert();
    		}
    	}
	}); */
    </script>
</body>
</html>