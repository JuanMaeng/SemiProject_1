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

<script type="text/javascript">
	
	$(function(){
		
		$("a.stemp").click(function(){
			
			location.href="layout/temporarySession.jsp";
		});
	});
</script>

</head>

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
						<li class="nav-item">
							<a class="nav-link" href="index.jsp?main=product/productlist.jsp">마우스&키보드</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">스트리밍</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">비디오 협업</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">헤드셋&스피커</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">액세서리</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">스마트홈</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="index.jsp?main=qna/qnalist.jsp">Q&A</a>
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
                    <%
                    System.out.println((String)session.getAttribute("loginok"));
                    String loginok = (String)session.getAttribute("loginok");
                    
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
                    %>
                    <!-- 세션용 임시아이콘 End -->
                    
                    <a class="nav-icon d-none d-lg-inline" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search">
                        <i class="fa fa-fw fa-search text-dark mr-2"></i>
                    </a>
                    <a class="nav-icon position-relative text-decoration-none" href="index.jsp?main=login/loginform.jsp">
                        <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i>
                        <!-- <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark"></span> --> <!-- 장바구니에 담긴 숫자 -->
                    </a>
                    <a class="nav-icon position-relative text-decoration-none" href="#">
							<i class="fa fa-fw fa-sign-in-alt text-dark mr-3"></i>
                        <!-- <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">+99</span> -->
                        
                    </a>
                </div>
            </div>

        </div>
    </nav>

</body>
</html>