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
	
	$(document).on("click",".categoryblock",function() {
		
		if($("#categorycon").is(":visible") != true) {
			$("#icategory").attr("class","fa fa-fw fa-plus");
			$("#categorycon").slideDown(200);
			
		}
		else {
			$("#icategory").attr("class","fa fa-fw fa-minus");
			$("#categorycon").slideUp(200);
			
		}
		
	});
	
	$(document).on("click",".productblock",function() {
		
		if($("#productcon").is(":visible") != true) {
			$("#iproduct").attr("class","fa fa-fw fa-plus");
			$("#productcon").slideDown(200);
			
		}
		else {
			$("#iproduct").attr("class","fa fa-fw fa-minus");
			$("#productcon").slideUp(200);
			
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
			<img src="https://resource.logitech.com/w_1800,h_1800,c_limit,q_auto,f_auto,dpr_2.0/d_transparent.gif/content/dam/logitech/en/plp/vc-accessories/vc-accessories-hero-desktop.png?v=1">	
		</div>
		<div class="banner-text">
			<b class="b1">비디오 액세서리</b>
			<p>케이블, 스피커, 마이크, 마운트, 교체용 부품 등의<br>화상 회의 액세서리로 기능과 유연성을 더해보세요.</p>
		</div>
	</div>
	

    <input type="hidden" id="showFilter"/>
    
    <div class="container-xl py-5">
        <div class="row">

            <div class="col-lg-3">
                <h1 class="h2 pb-4">Categories</h1>
                
                <div class="row" style="padding:5px 20px 5px 10px; align-items: center;">
                	<hr style="width: 95%;">
					<div class="categoryblock titleblock row pb-2" style="cursor: pointer;">
						<div class="col">
							<span class="collapse show pl-3"><strong>범주</strong></span>
						</div>
						<div class="col" style="text-align: right;">
							<i class="fa fa-fw fa-plus" id="icategory"></i>
						</div>
					</div>
					<div id="categorycon" style="margin-left: 20px;">
						<p><label for="mount" style="cursor: pointer;"><input type="checkbox" class="filters" id="mount" value="마운트" onchange="makeFilter(this);">&nbsp;&nbsp;마운트</label></p>
						<p><label for="conf" style="cursor: pointer;"><input type="checkbox" class="filters" id="conf" value="회의실용" onchange="makeFilter(this);">&nbsp;&nbsp;회의실용</label></p>
						<p><label for="cable" style="cursor: pointer;"><input type="checkbox" class="filters" id="cable" value="케이블" onchange="makeFilter(this);">&nbsp;&nbsp;케이블</label></p>
					</div>
					<hr style="width: 95%;">
					
					<div class="productblock titleblock row pb-2" style="cursor: pointer;">
						<div class="col">
							<span class="collapse show pl-3"><strong>제품</strong></span>
						</div>
						<div class="col" style="text-align: right;">
							<i class="fa fa-fw fa-plus" id="iproduct"></i>
						</div>
					</div>
					<div id="productcon" style="margin-left: 20px;">
						<p><label for="group" style="cursor: pointer;"><input type="checkbox" class="filters" id="group" value="group" onchange="makeFilter(this);">&nbsp;&nbsp;GROUP</label></p>
						<p><label for="meetup" style="cursor: pointer;"><input type="checkbox" class="filters" id="meetup" value="meetup" onchange="makeFilter(this);">&nbsp;&nbsp;MeetUp</label></p>
						<p><label for="rally" style="cursor: pointer;"><input type="checkbox" class="filters" id="rally" value="rally" onchange="makeFilter(this);">&nbsp;&nbsp;Rally</label></p>
						<p><label for="tap" style="cursor: pointer;"><input type="checkbox" class="filters" id="tap" value="tap" onchange="makeFilter(this);">&nbsp;&nbsp;Tap</label></p>
					</div>
					<hr style="width: 95%;">
				</div>
            </div>

            <div class="col-lg-9">
                <div class="row">
                <!-- start product -->
                <%
                	for(ProductDto dto:list) {
                		
                		if(dto.getCategory().equals("화상회의용")) {
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
                            	<%-- <div class="subtitle"><%=dto.getCollection() %></div> --%>
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