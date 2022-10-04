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
	@media all and (min-width: 992px) {
		.navbar .nav-item .dropdown-menu{display: none;}
		.navbar .nav-item:hover .nav-link{}
		.navbar .nav-item:hover .dropdown-menu{display: block;}
		.navbar .nav-item .dropdown-menu{margin-top:0;}
	}
	
	#welcome{
		position: absolute;
		top: 30px;
		left: 0px;
		width: 110px;
		font-size: 12px;
		text-align: center;
	}
	
</style>

<script type="text/javascript">
	
	$(function(){
		
		$("i.stemp").click(function(){
			
			location.href="index.jsp?main=login/loginmain.jsp";
		});
		
		
		$("button.search").click(function(){
			
			var keyword = $("#keyword").val();
			
			// alert(keyword);
			
			location.href="index.jsp?main=product/searchresult.jsp?keyword=" + keyword;
		});
		
		
		/* 검색창에서 엔터키 누르면 검색기능 Start */
		$("#keyword").keypress(function(event){
			
			var keycode = event.keyCode;
			// alert(keycode);
			
			if(keycode == 13){
				
				var keyword = $("#keyword").val();
				$("#keyword").val("");
				
				location.href="index.jsp?main=product/searchresult.jsp?keyword=" + keyword;
			}
		});
		/* 검색창에서 엔터키 누르면 검색기능 End */
		
	});
</script>

</head>
<%
String loginok = (String)session.getAttribute("loginok");
// String myid = (String)session.getAttribute("myid");
String myid = (String)session.getAttribute("id");

%>
<body>
<!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center">

            <a class="navbar-brand text-default logo h2 align-self-center" href="index.jsp">
                LOGITECH
            </a>

            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="align-self-center collapse navbar-collapse flex-fill d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <div class="flex-fill">
					<ul class="nav justify-content-center">
					
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" style="pointer-events: none;">마우스 & 키보드</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="index.jsp?main=product/productlist.jsp">마우스</a></li>
								<li><a class="dropdown-item" href="#">키보드</a></li>
				 				<li><a class="dropdown-item" href="#">콤보</a></li>
			    			</ul>
		    			</li>
						
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" style="pointer-events: none;">스트리밍</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">웹캠</a></li>
								<li><a class="dropdown-item" href="#">크리에이터용 제품</a></li>
			    			</ul>
		    			</li>
		    			
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" style="pointer-events: none;">비디오 협업</a>
							<ul class="dropdown-menu">
				 				<li><a class="dropdown-item" href="#">컨퍼런스 카메라</a></li>
								<li><a class="dropdown-item" href="#">통합 회의실 솔루션</a></li>
								<li><a class="dropdown-item" href="#">Logi Dock</a></li>
			    			</ul>
		    			</li>
		    			
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" style="pointer-events: none;">헤드셋 & 스피커</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">유선 헤드셋</a></li>
								<li><a class="dropdown-item" href="#">무선 헤드셋</a></li>
				 				<li><a class="dropdown-item" href="#">BLUETOOTH 스피커</a></li>
				 				<li><a class="dropdown-item" href="#">컴퓨터 스피커</a></li>
			    			</ul>
		    			</li>
		    			
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" style="pointer-events: none;">액세서리</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">IPad용</a></li>
								<li><a class="dropdown-item" href="#">스마트폰용</a></li>
				 				<li><a class="dropdown-item" href="#">화상회의</a></li>
				 				<li><a class="dropdown-item" href="#">프레젠테이션 리모컨</a></li>
				 				<li><a class="dropdown-item" href="#">충전기</a></li>
			    			</ul>
		    			</li>
		    			
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" style="pointer-events: none;">스마트홈</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">보안 카메라</a></li>
			    			</ul>
		    			</li>
		    			
						<li class="nav-item">
							<a class="nav-link" href="index.jsp?main=qna/qnaboard.jsp">Q&A</a>
						</li>
					</ul>
                </div>
                
                
                <div class="navbar align-self-center d-flex">
                    <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
                        <div class="input-group">
                            <input type="text" class="form-control" id="inputMobileSearch" placeholder="Search ..."><!-- 돋보기 아이콘 누르면 -->
                            <div class="input-group-text">
                                <i class="fa fa-fw fa-search"></i>
                            </div>
                        </div>
                    </div>
                    
                    <!-- 세션용 임시아이콘 Start -->
                    <%-- <%
                    if(loginok == null) {
                   	%>
	                    <a class="nav-icon d-none d-lg-inline stemp" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search">
	                        NoSession
	                    </a>
                    	
                    <%
                    } else {
                   	%>
                   		<a class="nav-icon d-none d-lg-inline stemp" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search">
	                        YesSession
	                    </a>
                   	<%
                    }
                    %> --%>
                    <!-- 세션용 임시아이콘 End -->
                    
                    <a class="nav-icon d-none d-lg-inline" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search">
                        <i class="fa fa-fw fa-search text-dark mr-2"></i>
                    </a>
                    
                    
                    <!-- Modal Start -->
				    <div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				        <div class="modal-dialog modal-lg" role="document">
				            <div class="w-100 pt-1 mb-5 text-right">
				                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				            </div>
				            
				            <form action="index.jsp?main=product/searchresult.jsp" method="post" class="modal-content modal-body border-0 p-0" onSubmit="return false;">
				                <div class="input-group mb-2">
				                    <input type="text" class="form-control" id="keyword" name="keyword" placeholder="Search ...">
				                    <button type="button" class="input-group-text bg-success text-light search">
				                        <i class="fa fa-fw fa-search text-white"></i>
				                    </button>
				                </div>
				            </form>
				        </div>
				    </div>
				    <!-- Modal End -->
				    
                    
                    <%
                    if(loginok == null){ // login session이 없으면
                   	%>
	                    <a class="nav-icon position-relative text-decoration-none" href="#">
							<i class="fa fa-fw fa-sign-in-alt text-dark mr-3 stemp"></i>
	                    </a>
                   	
                   	<%
                    } else { // login session이 있으면
                   	%>
                   	
	                    <a class="nav-icon position-relative text-decoration-none" href="index.jsp?main=cart/cartlist.jsp">
	                        <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i>
	                        <!-- <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark"></span> --> <!-- 장바구니에 담긴 제품의 수 -->
	                    </a>
	                    
                   		<a class="nav-icon position-relative text-decoration-none" href="#">
							<i class="fa fa-fw fa-sign-out-alt text-dark mr-3 stemp"></i>
	                    </a>
	                    <div id="welcome"><u><%= myid %></u> 님</div>
                   	<%
                    }
                    %>
                </div>
            </div>

        </div>
    </nav>
</body>
</html>