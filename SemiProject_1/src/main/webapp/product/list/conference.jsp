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
		/* height: 200px !important; */
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
	
	$(document).on("click",".resblock",function() {
		
		if($("#rescon").is(":visible") != true) {
			$("#ires").attr("class","fa fa-fw fa-plus");
			$("#rescon").slideDown(200);
			
		}
		else {
			$("#ires").attr("class","fa fa-fw fa-minus");
			$("#rescon").slideUp(200);
			
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
			<img src="https://resource.logitech.com/w_1800,h_1800,c_limit,q_auto,f_auto,dpr_2.0/d_transparent.gif/content/dam/logitech/en/plp/conference-cameras/conference-cameras-hero-desktop-2.png?v=1">	
		</div>
		<div class="banner-text">
			<b class="b1">컨퍼런스 카메라</b>
			<p>올인원 비디오 바, 화상 회의 카메라 시스템<br>스피커폰 탑재 휴대용 카메라.</p>
		</div>
	</div>
	

    <input type="hidden" id="showFilter"/>
    
    <div class="container-xl py-5">
        <div class="row">

            <!-- <div class="col-lg-3">
                <h1 class="h2 pb-4">Categories</h1>
                
                <div class="row" style="padding:5px 20px 5px 10px; align-items: center;">
                	<hr style="width: 95%;">
					<div class="collectionblock titleblock row pb-2" style="cursor: pointer;">
						<div class="col">
							<span class="collapse show pl-3"><strong>컬렉션</strong></span>
						</div>
						<div class="col" style="text-align: right;">
							<i class="fa fa-fw fa-plus" id="icollection"></i>
						</div>
					</div>
					<div id="collectioncon" style="margin-left: 20px;">
						<p><label for="meeting" style="cursor: pointer;"><input type="checkbox" class="filters" id="meeting" value="화상회의" onchange="makeFilter(this);">&nbsp;&nbsp;화상 회의</label></p>
						<p><label for="edu" style="cursor: pointer;"><input type="checkbox" class="filters" id="edu" value="교육용" onchange="makeFilter(this);">&nbsp;&nbsp;교육용</label></p>
						<p><label for="game" style="cursor: pointer;"><input type="checkbox" class="filters" id="game" value="게임" onchange="makeFilter(this);">&nbsp;&nbsp;게임</label></p>
					</div>
					<hr style="width: 95%;">
					
					<div class="resblock titleblock row pb-2" style="cursor: pointer;">
						<div class="col">
							<span class="collapse show pl-3"><strong>화질, 프레임</strong></span>
						</div>
						<div class="col" style="text-align: right;">
							<i class="fa fa-fw fa-plus" id="ires"></i>
						</div>
					</div>
					<div id="rescon" style="margin-left: 20px;">
						<p><label for="4k1" style="cursor: pointer;"><input type="checkbox" class="filters" id="4k1" value="4k30fps" onchange="makeFilter(this);">&nbsp;&nbsp;4k 30fps</label></p>
						<p><label for="1080p60" style="cursor: pointer;"><input type="checkbox" class="filters" id="1080p60" value="1080p60fps" onchange="makeFilter(this);">&nbsp;&nbsp;1080p 60fps</label></p>
						<p><label for="1080p30" style="cursor: pointer;"><input type="checkbox" class="filters" id="1080p30" value="1080p30fps" onchange="makeFilter(this);">&nbsp;&nbsp;1080p 30fps</label></p>
						<p><label for="720p90" style="cursor: pointer;"><input type="checkbox" class="filters" id="720p90" value="720p90fps" onchange="makeFilter(this);">&nbsp;&nbsp;720p 90fps</label></p>
						<p><label for="720p60" style="cursor: pointer;"><input type="checkbox" class="filters" id="720p60" value="720p60fps" onchange="makeFilter(this);">&nbsp;&nbsp;720p 60fps</label></p>
						<p><label for="720p30" style="cursor: pointer;"><input type="checkbox" class="filters" id="720p30" value="720p30fps" onchange="makeFilter(this);">&nbsp;&nbsp;720p 30fps</label></p>
					</div>
					<hr style="width: 95%;">
				</div>
            </div> -->

            <div class="col-lg-8" style="width: 100% !important;">
                <div class="row">
                <!-- start product -->
                <%
                	for(ProductDto dto:list) {
                		
                		if(dto.getCategory().equals("컨퍼런스 카메라")) {
                	%>
                	
                    <div class="col-md-5 <%=dto.getCollection()%> lists" id="p1" filter="<%=dto.getFilter() %>" style="width: 33.333%;">
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