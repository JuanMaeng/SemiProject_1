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
	
	$(document).on("click",".connectionblock",function() {
		
		if($("#connectioncon").is(":visible") != true) {
			$("#iconnection").attr("class","fa fa-fw fa-plus");
			$("#connectioncon").slideDown(200);
			
		}
		else {
			$("#iconnection").attr("class","fa fa-fw fa-minus");
			$("#connectioncon").slideUp(200);
			
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
	
	$(document).on("click",".mouseblock",function() {
		
		if($("#mousecon").is(":visible") != true) {
			$("#imouse").attr("class","fa fa-fw fa-plus");
			$("#mousecon").slideDown(200);
			
		}
		else {
			$("#imouse").attr("class","fa fa-fw fa-minus");
			$("#mousecon").slideUp(200);
			
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
			<img src="https://resource.logitech.com/w_1800,h_1800,c_limit,q_auto,f_auto,dpr_2.0/d_transparent.gif/content/dam/logitech/en/plp/combos/combos-hero-desktop.png?v=1">	
		</div>
		<div class="banner-text">
			<b class="b1">키보드 및 마우스<br>콤보</b>
			<p>키보드 및 마우스 콤보를 선택해보세요.</p>
		</div>
	</div>
	

    <input type="hidden" id="showFilter"/>
    
    <div class="container-xl py-5">
        <div class="row">

            <div class="col-lg-3">
                <h1 class="h2 pb-4">Categories</h1>
                
                <div class="row" style="padding:5px 20px 5px 10px; align-items: center;">
                	<hr style="width: 95%;">
					<div class="connectionblock titleblock row pb-2" style="cursor: pointer;">
						<div class="col">
							<span class="collapse show pl-3"><strong>연결</strong></span>
						</div>
						<div class="col" style="text-align: right;">
							<i class="fa fa-fw fa-plus" id="iconnection"></i>
						</div>
					</div>
					<div id="connectioncon" style="margin-left: 20px;">
						<p><label for="bluetooth" style="cursor: pointer;"><input type="checkbox" class="filters" id="bluetooth" value="bluetooth" onchange="makeFilter(this);">&nbsp;&nbsp;Bluetooth</label></p>
						<p><label for="usb" style="cursor: pointer;"><input type="checkbox" class="filters" id="usb" value="usb" onchange="makeFilter(this);">&nbsp;&nbsp;USB 수신기</label></p>
						<p><label for="wired" style="cursor: pointer;"><input type="checkbox" class="filters" id="wired" value="유선" onchange="makeFilter(this);">&nbsp;&nbsp;유선</label></p>
					</div>
					<hr style="width: 95%;">
					
					<div class="platformblock titleblock row pb-2" style="cursor: pointer;">
						<div class="col">
							<span class="collapse show pl-3"><strong>플랫폼</strong></span>
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
					
					<div class="typeblock titleblock row pb-2" style="cursor: pointer;">
						<div class="col">
							<span class="collapse show pl-3"><strong>타이핑 느낌</strong></span>
						</div>
						<div class="col" style="text-align: right;">
							<i class="fa fa-fw fa-plus" id="itype"></i>
						</div>
					</div>
					<div id="typecon" style="margin-left: 20px;">
						<p><label for="notebook" style="cursor: pointer;"><input type="checkbox" class="filters" id="notebook" value="노트북" onchange="makeFilter(this);">&nbsp;&nbsp;노트북 같은 키</label></p>
						<p><label for="deep" style="cursor: pointer;"><input type="checkbox" class="filters" id="deep" value="딥" onchange="makeFilter(this);">&nbsp;&nbsp;딥 프로파일 키</label></p>
					</div>
					<hr style="width: 95%;">
					
					<div class="layoutblock titleblock row pb-2" style="cursor: pointer;">
						<div class="col" >
							<span class="collapse show pl-3"><strong>레이아웃 크기</strong></span>
						</div>
						<div class="col" style="text-align: right;">
							<i class="fa fa-fw fa-plus" id="ilayout"></i>
						</div>
					</div>
					<div id="layoutcon" style="margin-left: 20px;">
						<p><label for="full" style="cursor: pointer;"><input type="checkbox" class="filters" id="full" value="full" onchange="makeFilter(this);">&nbsp;&nbsp;풀 사이즈 숫자 키패드</label></p>
						<p><label for="compact" style="cursor: pointer;"><input type="checkbox" class="filters" id="compact" value="compact" onchange="makeFilter(this);">&nbsp;&nbsp;컴팩트형 숫자 키패드</label></p>
					</div>
					<hr style="width: 95%;">
					
					<div class="mouseblock titleblock row pb-2" style="cursor: pointer;">
						<div class="col" >
							<span class="collapse show pl-3"><strong>마우스 크기</strong></span>
						</div>
						<div class="col" style="text-align: right;">
							<i class="fa fa-fw fa-plus" id="imouse"></i>
						</div>
					</div>
					<div id="mousecon" style="margin-left: 20px;">
						<p><label for="small" style="cursor: pointer;"><input type="checkbox" class="filters" id="small" value="소형" onchange="makeFilter(this);">&nbsp;&nbsp;소형 휴대용</label></p>
						<p><label for="large" style="cursor: pointer;"><input type="checkbox" class="filters" id="large" value="대형" onchange="makeFilter(this);">&nbsp;&nbsp;대형</label></p>
					</div>
					<hr style="width: 95%;">
				</div>
            </div>

            <div class="col-lg-9">
                <div class="row">
                <!-- start product -->
                <%
                	for(ProductDto dto:list) {
                		
                		if(dto.getCategory().equals("콤보")) {
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

	var filterArr = new Array(); //필터 내용을 저장하는 배열
	var showFilterValue = document.getElementById("showFilter");//필터입력값 보여주기 위한 text
	
    function makeFilter(target) {
    	
    	var filterVal = target.value;
    	var confirmCheck = target.checked;
    	//console.log("필터 선택값 : " + filterVal);
    	//console.log("선택 여부 : " + confirmCheck);
    	
    	if(confirmCheck == true) {
    		
    		//console.log("check");
    		filterArr.push(filterVal);
    	} else {
    		
    		filterArr.splice(filterArr.indexOf(filterVal), 1);
    	}
    	showFilterValue.value = filterArr; // textBox에 필터 배열 추가
    	//console.log("필터입력값 출력 : "+filterArr);
    	
    	
    	
    	
   		if(filterArr.length == 0) { //선택한 필터의 값이 없을 경우
   	    	
			$(".lists").show();
   		} else { //필터의 값을 하나라도 선택한 경우
   			
   			$(".lists").hide(); //전체 div 숨김
	   			
			for(var x=0; x<filterArr.length; x++){ //필터 배열의 크기만큼 반복
				
				//console.log(x);
   				$("."+filterArr[x]).show(); //해당 클래스의 div 보이기
		
				for(var y=1; y<=i-1; y++){ //div의 갯수만큼 반복
					
   					var filter = $("#p"+y).attr("filter");
					//console.log($("#p"+y).attr("filter"));
					
   					var filSplit = (filter||'').split(','); //이게 되네
   	   				//var filSplit = filter.split(','); //입력된 필터 ,로 분리
   	   				
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