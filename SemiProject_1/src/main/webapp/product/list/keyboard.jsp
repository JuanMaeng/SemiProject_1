<%@page import="java.util.StringTokenizer"%>
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
		left: 30%;
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
	.thumb{
		height: 200px !important;
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
	
	$(document).on("click",".typeblock",function() {
		
		if($("#typecon").is(":visible") != true) {
			$("#itype").attr("class","fa fa-fw fa-plus");
			$("#typecon").slideDown(200);
			
		}
		else {
			$("#itype").attr("class","fa fa-fw fa-minus");
			$("#typecon").slideUp(200);
			
		}
		
	});
	
	$(document).on("click",".layoutblock",function() {
		
		if($("#layoutcon").is(":visible") != true) {
			$("#ilayout").attr("class","fa fa-fw fa-plus");
			$("#layoutcon").slideDown(200);
			
		}
		else {
			$("#ilayout").attr("class","fa fa-fw fa-minus");
			$("#layoutcon").slideUp(200);
			
		}
		
	});
	
	$(document).on("click",".platformblock",function() {
		
		if($("#platformcon").is(":visible") != true) {
			$("#iplatform").attr("class","fa fa-fw fa-plus");
			$("#platformcon").slideDown(200);
			
		}
		else {
			$("#iplatform").attr("class","fa fa-fw fa-minus");
			$("#platformcon").slideUp(200);
			
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
	<script type="text/javascript">
	var i=1;
	</script>
	<div class="banner-wrap">
		<div class="banner-img">
			<img src="https://resource.logitech.com/w_1800,h_1800,c_limit,q_auto,f_auto,dpr_2.0/d_transparent.gif/content/dam/logitech/en/plp/keyboards/keyboards-hero-desktop-2022-2.png?v=1">	
		</div>
		<div class="banner-text">
			<b class="b1">?????????</b>
			<p>????????? ?????? ???????????? ??????????????????.</p>
		</div>
	</div>
	

    <input type="hidden" id="showFilter"/>
    
    <div class="container-xl py-5">
        <div class="row">

            <div class="col-lg-3">
                <h1 class="h2 pb-4">Categories</h1>
                
                <div class="row" style="padding:5px 20px 5px 10px; align-items: center;">
                	<hr style="width: 95%;">
					<div class="collectionblock titleblock row pb-2" style="cursor: pointer;">
						<div class="col">
							<span class="collapse show pl-3"><strong>?????????</strong></span>
						</div>
						<div class="col" style="text-align: right;">
							<i class="fa fa-fw fa-plus" id="icollection"></i>
						</div>
					</div>
					<div id="collectioncon" style="margin-left: 20px;">
						<p><label for="master" style="cursor: pointer;"><input type="checkbox" class="filters" id="master" value="??????????????????" onchange="makeFilter(this);">&nbsp;&nbsp;??????????????????</label></p>
						<p><label for="ergo" style="cursor: pointer;"><input type="checkbox" class="filters" id="ergo" value="Ergo?????????" onchange="makeFilter(this);">&nbsp;&nbsp;Ergo?????????</label></p>
						<p><label for="wireless" style="cursor: pointer;"><input type="checkbox" class="filters" id="wireless" value="??????" onchange="makeFilter(this);">&nbsp;&nbsp;??????</label></p>
						<p><label for="wired" style="cursor: pointer;"><input type="checkbox" class="filters" id="wired" value="??????" onchange="makeFilter(this);">&nbsp;&nbsp;??????</label></p>
					</div>
					<hr style="width: 95%;">
					
					<div class="typeblock titleblock row pb-2" style="cursor: pointer;">
						<div class="col">
							<span class="collapse show pl-3"><strong>????????? ??????</strong></span>
						</div>
						<div class="col" style="text-align: right;">
							<i class="fa fa-fw fa-plus" id="itype"></i>
						</div>
					</div>
					<div id="typecon" style="margin-left: 20px;">
						<p><label for="notebook" style="cursor: pointer;"><input type="checkbox" class="filters" id="notebook" value="?????????" onchange="makeFilter(this);">&nbsp;&nbsp;????????? ?????? ???</label></p>
						<p><label for="deep" style="cursor: pointer;"><input type="checkbox" class="filters" id="deep" value="???" onchange="makeFilter(this);">&nbsp;&nbsp;??? ???????????? ???</label></p>
						<p><label for="mecha" style="cursor: pointer;"><input type="checkbox" class="filters" id="mecha" value="?????????" onchange="makeFilter(this);">&nbsp;&nbsp;????????? ???</label></p>
					</div>
					<hr style="width: 95%;">
					
					<div class="layoutblock titleblock row pb-2" style="cursor: pointer;">
						<div class="col" >
							<span class="collapse show pl-3"><strong>???????????? ??????</strong></span>
						</div>
						<div class="col" style="text-align: right;">
							<i class="fa fa-fw fa-plus" id="ilayout"></i>
						</div>
					</div>
					<div id="layoutcon" style="margin-left: 20px;">
						<p><label for="full" style="cursor: pointer;"><input type="checkbox" class="filters" id="full" value="full" onchange="makeFilter(this);">&nbsp;&nbsp;??? ????????? ?????? ?????????</label></p>
						<p><label for="compact" style="cursor: pointer;"><input type="checkbox" class="filters" id="compact" value="compact" onchange="makeFilter(this);">&nbsp;&nbsp;???????????? ?????? ?????????</label></p>
						<p><label for="minimal" style="cursor: pointer;"><input type="checkbox" class="filters" id="minimal" value="minimal" onchange="makeFilter(this);">&nbsp;&nbsp;???????????? ????????????</label></p>
					</div>
					<hr style="width: 95%;">
					
					<div class="platformblock titleblock row pb-2" style="cursor: pointer;">
						<div class="col">
							<span class="collapse show pl-3"><strong>?????????</strong></span>
						</div>
						<div class="col" style="text-align: right;">
							<i class="fa fa-fw fa-plus" id="iplatform"></i>
						</div>
					</div>
					<div id="platformcon" style="margin-left: 20px;">
						<p><label for="windows" style="cursor: pointer;"><input type="checkbox" class="filters" id="windows" value="windows" onchange="makeFilter(this);">&nbsp;&nbsp;Windows</label></p>
						<p><label for="mac" style="cursor: pointer;"><input type="checkbox" class="filters" id="mac" value="mac" onchange="makeFilter(this);">&nbsp;&nbsp;Mac</label></p>
					</div>
					<hr style="width: 95%;">
				</div>
            </div>

            <div class="col-lg-9">
                <div class="row">
                <!-- start product -->
                <%
                	for(ProductDto dto:list) {
                		
                		if(dto.getCategory().equals("?????????")) {
                	%>
                	
                    <div class="col-md-4 <%=dto.getCollection()%> lists" id="p1" filter="<%=dto.getFilter() %>">
	                    <script type="text/javascript">
	                    	document.getElementById("p1").setAttribute("id", "p"+i);
	                    	i++;
	                    	//console.log($(".lists").attr("id"));
	                	</script>
                        <div class="card mb-4 product-wap rounded-0" style="border:0;">
                        	
                            <div class="card rounded-0 thumb" style="border: 0; align-items: center;">
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

	var filterArr = new Array(); //?????? ????????? ???????????? ??????
	var showFilterValue = document.getElementById("showFilter");//??????????????? ???????????? ?????? text
	
    function makeFilter(target) {
    	
    	var filterVal = target.value;
    	var confirmCheck = target.checked;
    	//console.log("?????? ????????? : " + filterVal);
    	//console.log("?????? ?????? : " + confirmCheck);
    	
    	if(confirmCheck == true) {
    		
    		//console.log("check");
    		filterArr.push(filterVal);
    	} else {
    		
    		filterArr.splice(filterArr.indexOf(filterVal), 1);
    	}
    	showFilterValue.value = filterArr; // textBox??? ?????? ?????? ??????
    	//console.log("??????????????? ?????? : "+filterArr);
    	
    	
    	
    	
   		if(filterArr.length == 0) { //????????? ????????? ?????? ?????? ??????
   	    	
			$(".lists").show();
   		} else { //????????? ?????? ???????????? ????????? ??????
   			
   			$(".lists").hide(); //?????? div ??????
	   			
			for(var x=0; x<filterArr.length; x++){ //?????? ????????? ???????????? ??????
				
				//console.log(x);
   				$("."+filterArr[x]).show(); //?????? ???????????? div ?????????
		
				for(var y=1; y<=i-1; y++){ //div??? ???????????? ??????
					
   					var filter = $("#p"+y).attr("filter");
					//console.log($("#p"+y).attr("filter"));
					
   					var filSplit = (filter||'').split(','); //?????? ??????
   	   				//var filSplit = filter.split(','); //????????? ?????? ,??? ??????
   	   				
   	   				//console.log(filSplit);
   	   				for(var z=0; z<filSplit.length; z++){
   	   					
   	   					if(filterArr[x] == filSplit[z]){
	   	   					//console.log(filSplit[z]);
	  						//console.log(filterArr[x]);
	  						$("#p"+y).show();
   	   					}
   	   				}
   				}
   			}
   		}
   		
    }
    </script>
</body>
</html>