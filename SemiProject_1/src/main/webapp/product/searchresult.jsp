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
		height: 400px;
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
</head>
<%
request.setCharacterEncoding("UTF-8");
String keyword = request.getParameter("keyword");

ProductDao dao = new ProductDao();
List<ProductDto> list= dao.getSearchResult(keyword);

NumberFormat nf=NumberFormat.getCurrencyInstance();


%>
<body>
<%-- <%
for(int i = 0; i < list.size(); i++){
	
	ProductDto dto = list.get(i);
%>

	<%= dto.getP_num() %><br>
	<%= dto.getName() %><br>
	<%= dto.getPrice() %><br>
	<%= dto.getCategory() %><br>
	<%= dto.getCollection() %><br>
	<%= dto.getDescription() %><br>
	<%= dto.getFilter() %><br>
	<img src="<%= dto.getThumbnail() %>"><br><br>
<%
}
%> --%>
	<div class="banner-wrap">
		<div class="banner-img">
			<img src="https://images-ext-2.discordapp.net/external/sf-sqIxnhHN0a3jRb3_Kih_MZij0WtPbCCkGr__kLaQ/%3Fv%3D1/https/resource.logitech.com/w_1800%2Ch_1800%2Cc_limit%2Cq_auto%3Abest%2Cf_jpg%2Cdpr_2.0/d_transparent.gif/content/dam/logitech/en/mx/mx-for-creativity/2022-update/september-update/mx-for-creativity-shortcuts-background-desktop.jpg?width=1092&height=447">	
		</div>
		<div class="banner-text">
			<b class="b1" style="color: white;"><%= keyword %> 검색결과</b>
		</div>
	</div>

    <div class="container-xl py-5">
        <div class="row">

            <div class="col-lg-9" style="margin: auto;">
                <div class="row">
                	<!-- 검색결과 Start -->
                	<%
                	if(list.size() != 0){
                		
	                	for(ProductDto dto:list) {
                		
                	%>
                	
		                    <div class="col-md-4 lists" id="p1">
		                        <div class="card mb-4 product-wap rounded-0" style="border:0;">
		                        	
		                            <div class="card rounded-0" style="border: 0; height: 250px;">
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
					<%
	                	}
	                	
                	} else {
               		%>
                		<table class="table">
							<tr>
								<td>
									<div class="alert alert-secondary" role="alert" align="center">
										검색 결과가 없습니다.
									</div>
								</td>
							</tr>
						</table>
               		<%
                	}
                    %>
                    <!-- 검색결과 End -->
                </div>
            </div>
        </div>
    </div>
</body>
</html>