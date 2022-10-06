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
		width:150px !important;
	}
</style>
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

                        <!--Start Carousel Wrapper-->
                            <!--Start Slides-->
                                <div class="active">
                                    <div class="row mb-3">
                                    	<div class="col-3 item">
                                            <a href="#">
                                                <img class="card-img img-fluid" src="<%=dto.getThumbnail() %>" alt="">
                                            </a>
                                        </div>
                                        <div class="col-3 item">
                                            <a href="#">
                                                <img class="card-img img-fluid" src="<%=ddto.getPhoto1() %>" alt="">
                                            </a>
                                        </div>
                                        <div class="col-3 item">
                                            <a href="#">
                                                <img class="card-img img-fluid" src="<%=ddto.getPhoto2() %>" alt="">
                                            </a>
                                        </div>
                                        <div class="col-3 item">
                                            <a href="#">
                                                <img class="card-img img-fluid"  src="<%=ddto.getPhoto3() %>" alt="">
                                            </a>
                                        </div>
                                        <div class="col-3 item">
                                            <a href="#">
                                                <img class="card-img img-fluid"  src="<%=ddto.getPhoto4() %>" alt="">
                                            </a>
                                        </div>
                                    </div>
                                </div>


                    </div>
                    <div class="card mb-3">
                        <img class="card-img img-fluid" src="<%=dto.getThumbnail() %>" alt="Card image cap" id="product-detail">
                    </div>
                    
                </div>
                <!-- col end -->
                <div class="col-lg-5 mt-5">
                    <div class="card">
                        <div class="card-body">
                            <h1 class="h2"><%=dto.getName() %></h1>
                            <p class="h3 py-2"><%=nf.format(dto.getPrice()) %></p>
                            
                            <ul class="list-inline">
                                <li class="list-inline-item">
                                    <h6>Collection:</h6>
                                </li>
                                <li class="list-inline-item">
                                    <p class="text-muted"><strong><%=dto.getCollection() %></strong></p>
                                </li>
                            </ul>

                            <h6>Description:</h6>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod temp incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse. Donec condimentum elementum convallis. Nunc sed orci a diam ultrices aliquet interdum quis nulla.</p>
                            <ul class="list-inline">
                                <li class="list-inline-item">
                                    <h6>Avaliable Color :</h6>
                                </li>
                                <li class="list-inline-item">
                                    <p class="text-muted"><strong>White / Black</strong></p>
                                </li>
                            </ul>

                            <h6>Specification:</h6>
                            <ul class="list-unstyled pb-3">
                                <li>Lorem ipsum dolor sit</li>
                                <li>Amet, consectetur</li>
                                <li>Adipiscing elit,set</li>
                                <li>Duis aute irure</li>
                                <li>Ut enim ad minim</li>
                                <li>Dolore magna aliqua</li>
                                <li>Excepteur sint</li>
                            </ul>

                            <form action="" method="GET">
                                <input type="hidden" name="product-title" value="Activewear">
                                <div class="row">
                                    <div class="col-auto">
                                        <ul class="list-inline pb-3">
                                            <li class="list-inline-item">Size :
                                                <input type="hidden" name="product-size" id="product-size" value="S">
                                            </li>
                                            <li class="list-inline-item"><span class="btn btn-success btn-size">S</span></li>
                                            <li class="list-inline-item"><span class="btn btn-success btn-size">M</span></li>
                                            <li class="list-inline-item"><span class="btn btn-success btn-size">L</span></li>
                                            <li class="list-inline-item"><span class="btn btn-success btn-size">XL</span></li>
                                        </ul>
                                    </div>
                                    <div class="col-auto">
                                        <ul class="list-inline pb-3">
                                            <li class="list-inline-item text-right">
                                                Quantity
                                                <input type="hidden" name="product-quanity" id="product-quanity" value="1">
                                            </li>
                                            <li class="list-inline-item"><span class="btn btn-success" id="btn-minus">-</span></li>
                                            <li class="list-inline-item"><span class="badge bg-secondary" id="var-value">1</span></li>
                                            <li class="list-inline-item"><span class="btn btn-success" id="btn-plus">+</span></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col d-grid">
                                        <button type="submit" class="btn btn-success btn-lg" name="submit" value="buy">Buy</button>
                                    </div>
                                    <div class="col d-grid">
                                        <button type="submit" class="btn btn-success btn-lg" name="submit" value="addtocard">Add To Cart</button>
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

  
</body>
</html>