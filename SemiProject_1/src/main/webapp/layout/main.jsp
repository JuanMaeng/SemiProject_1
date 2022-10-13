<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.ProductDto"%>
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

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="assets/css/fontawesome.min.css">

<title>Insert title here</title>

<style type="text/css">
	img.recommend{
		height: 400px;
	}
</style>

<script type="text/javascript">
	$(function(){
		
		$("#rec1").click(function(){
			
			location.href="index.jsp?main=product/list/conference.jsp";
		});
		
		$("#rec2").click(function(){
			
			location.href="index.jsp?main=product/list/remotecon.jsp";
		});
		
		$("#rec3").click(function(){
	
			location.href="index.jsp?main=product/detailpage.jsp?p_num=81";
		});
	});
</script>

</head>

<%
ProductDao pdao = new ProductDao();
NumberFormat nf = NumberFormat.getCurrencyInstance();
%>

<body>
<!-- Start Banner -->
    <div id="template-mo-zay-hero-carousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="./assets/img/mainimg/vertical_mouse.jpg" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left align-self-center">
                                <h1 class="h1 text-success pb-2"><b>리프트</b> 인체공학 마우스</h1>
                                <h3 class="h2 pb-3">이제 리프트로 업해보세요!</h3>
                                <p>
                                    손을 올려 편안함을 높여보세요. 리프트 버티컬 마우스가<br>
                                    자연스럽게 자세를 유지하게 합니다. 편안하게 일에 집중할 수 있을 거예요.<br>
                                    조금 작거나 보통 크기의 손에 잘 맞아요.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-first">
                            <img class="img-fluid" src="./assets/img/mainimg/MX_MASTER.jpg" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left">
                                <h1 class="h1 pb-2">MX MECHANICAL</h1>
                                <h3 class="h2 pb-3">무선 일루미네이티드 퍼포먼스 키보드</h3>
                                <p>
                                    MX Mechanical만의 독특한 택타일 감성을 느껴보세요.<br>
									부드러우면서도 구분감이 있는 새로운 로우프로파일 카일 스위치는<br>
									반응속도와 정확도는 물론, 중독성있는 타건감을 선사합니다.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="./assets/img/mainimg/OPTION.jpg" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left">
                                <h1 class="h1 pb-2">새로운 OPTIONS+ 기능</h1>
                                <h3 class="h2 pb-3">Logi Options+로 로지텍 마우스와 키보드를 원하는대로 커스터마이징해보세요.</h3>
                                <p>
                                    업그레이드된 경험. Logi Options+는<br>
                                    강력하고 편리한 차세대 애플리케이션입니다.<br>
                                    원하는 방식대로 로지텍 마우스와 키보드를 커스텀해보세요.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev text-decoration-none w-auto ps-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="prev">
            <i class="fas fa-chevron-left"></i>
        </a>
        <a class="carousel-control-next text-decoration-none w-auto pe-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="next">
            <i class="fas fa-chevron-right"></i>
        </a>
    </div>
    <!-- End Banner -->


    <!-- Start Various product -->
    <section class="container py-5">
        <div class="row text-center pt-3">
            <div class="col-lg-6 m-auto">
                <h1 class="h1"><b>로지텍</b>의 <br>다양한 제품을 체험해보세요</h1>
            </div>
        </div>
        
        <div class="row">
            <div class="col-12 col-md-4 p-5 mt-3" align="center">
                <a href="index.jsp?main=product/list/conference.jsp"><img src="./assets/img/mainimg/category_1.jpg" class="rounded-circle img-fluid border" style="width: 400px; height: 400px;"></a>
                <h5 class="text-center mt-3 mb-3">화상 회의</h5>
                <button type="button" class="btn btn-outline-secondary" id="rec1">More</button>
            </div>
            <div class="col-12 col-md-4 p-5 mt-3" align="center">
                <a href="index.jsp?main=product/list/remotecon.jsp"><img src="./assets/img/mainimg/presentation.jpg" class="rounded-circle img-fluid border" style="width: 400px; height: 400px;"></a>
                <h5 class="text-center mt-3 mb-3">프레젠테이션</h5>
                <button type="button" class="btn btn-outline-secondary" id="rec2">More</button>
            </div>
            <div class="col-12 col-md-4 p-5 mt-3" align="center">
                <a href="index.jsp?main=product/detailpage.jsp?p_num=81"><img src="./assets/img/mainimg/camera_.png" class="rounded-circle img-fluid border" style="width: 400px; height: 400px;"></a>
                <h5 class="text-center mt-3 mb-3">가정용 카메라</h5>
				<button type="button" class="btn btn-outline-secondary" id="rec3">More</button>
            </div>
        </div>
    </section>
    <!-- End Various product -->


    <!-- Start Recommend Product -->
    <section class="bg-light">
        <div class="container py-5">
            <div class="row text-center py-3">
                <div class="col-lg-6 m-auto">
                    <h1 class="h1">추천 상품</h1>
                    <p>
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="index.jsp?main=product/detailpage.jsp?p_num=27">
                        <%
                        String p_num = "27";
                        int price = pdao.getData(p_num).getPrice();
                        %>
                            <img src="./assets/img/mainimg/recommend_mouse.jpg" class="card-img-top recommend" alt="...">
                        </a>
                        <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
                                <li class="text-muted text-right"><%= nf.format(price) %></li>
                            </ul>
                            <a href="index.jsp?main=product/detailpage.jsp?p_num=27" class="h2 text-decoration-none text-dark">MX Master 3s</a>
                            <p class="card-text">
                                <br>마스터 시리즈,<br>7개의 버튼 및 엄지손가락 휠 제공
                            </p>
                        </div>
                    </div>
                </div>
                
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="index.jsp?main=product/detailpage.jsp?p_num=38">
	                        <%
	                        p_num = "38";
	                        price = pdao.getData(p_num).getPrice();
	                        %>
                            <img src="./assets/img/mainimg/recommend_keyboard.jpg" class="card-img-top recommend" alt="...">
                        </a>
                        <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
								<li class="text-muted text-right"><%= nf.format(price) %></li>
							</ul>
                            <a href="index.jsp?main=product/detailpage.jsp?p_num=38" class="h2 text-decoration-none text-dark">MX MECHANICAL</a>
                            <p class="card-text">
                                <br>마스터 시리즈,<br>무선 일루미네이티드 퍼포먼스 키보드
                            </p>
                        </div>
                    </div>
                </div>
                
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
						<a href="index.jsp?main=product/detailpage.jsp?p_num=52">
                        	<%
	                        p_num = "52";
	                        price = pdao.getData(p_num).getPrice();
	                        %>
                            <img src="./assets/img/mainimg/recommend_camera.jpg" class="card-img-top recommend" alt="...">
                        </a>
                        <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
                                <li class="text-muted text-right"><%= nf.format(price) %></li>
                            </ul>
                            <a href="index.jsp?main=product/detailpage.jsp?p_num=52" class="h2 text-decoration-none text-dark">C922 PRO HD STREAM WEBCAM</a>
                            <p class="card-text">
                               <br>제대로 된 스트리밍 웹캠<br>초고속 HD 720p/60fps.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Recommend Product -->
</body>
</html>