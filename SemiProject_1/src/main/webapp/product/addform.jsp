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

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="assets/css/fontawesome.min.css">
<title>Insert title here</title>
</head>
<%
String p_num=request.getParameter("p_num");
String name=request.getParameter("name");
ProductDao dao = new ProductDao();

ProductDto dto = dao.getLastData();
%>
<body>
<div class="container-xl py-5">
	<h3>제품 등록</h3>
	<div class="row" style="margin-top:20px;">
		<form action="product/addaction.jsp" method="post">
			<table class="table table-bordered" style="width: 600px;">
				<tr>
					<td style="width:150px; background-color: #66cdaa"><b>상품명</b></td>
					<td>
						<input type="text" name="name" class="form-control" style="width: 250px;" required="required">
					</td>
				</tr>
				<tr>
					<td style="width:150px; background-color: #66cdaa"><b>카테고리</b></td>
					<td>
						<select style="width: 200px;" name="category" class="form-control" required="required">
							<option value="마우스" selected="selected">마우스</option>
							<option value="키보드">키보드</option>
							<option value="콤보">콤보</option>
							<option value="웹캠">웹캠</option>
							<option value="크리에이터용 제품">크리에이터용 제품</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width:150px; background-color: #66cdaa"><b>컬렉션</b></td>
					<td>
						<select style="width: 200px;" name="collection" class="form-control" required="required">
							<option value="Ergo 시리즈" selected="selected">Ergo 시리즈</option>
							<option value="마스터 시리즈">마스터 시리즈</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width:150px; background-color: #66cdaa"><b>설명</b></td>
					<td>
						<textarea class="form-control" name="description" style="width:300px; height:200px; "></textarea>
						<!-- <input type="text" name="photo" class="form-control" style="widht:300px;"required="required"> -->
					</td>
				</tr>
				<tr>
					<td style="width:150px; background-color: #66cdaa"><b>썸네일</b></td>
					<td>
						<!-- <input type="file" name="photo" class="form-control" style="width: 300px;" required="required"> -->
						<input type="text" name="thumbnail" class="form-control" style="width:300px;"required="required">
					</td>
				</tr>
				<tr>
					<td style="width:150px; background-color: #66cdaa"><b>손</b></td>
					<td>
						<select style="width: 200px;" name="hand" class="form-control" required="required">
							<option value="오른손" selected="selected">오른손</option>
							<option value="왼손">왼손</option>
							<option value="양손">양손</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width:150px; background-color: #66cdaa"><b>크기</b></td>
					<td>
						<select style="width: 200px;" name="size" class="form-control" required="required">
							<option value="작음">작음</option>
							<option value="보통" selected="selected">보통</option>
							<option value="큼">큼</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width:150px; background-color: #66cdaa"><b>플랫폼</b></td>
					<td>
						<select style="width: 200px;" name="platform" class="form-control" required="required">
							<option value="windows">Windows</option>
							<option value="mac">Mac</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width:150px; background-color: #66cdaa"><b>가격</b></td>
					<td>
						<input type="text" name="price" class="form-control" style="width: 200px;" required="required">
					</td>
				</tr>
				<tr>
					<td style="width:150px; background-color: #66cdaa"><b>등록일</b></td>
					<td>
						<input type="date" class="form-control" name="regdate" required="required">
						
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-info" style="width:100px;">상품저장</button>
						<button type="button" class="btn btn-success" style="width:100px;"
						onclick="location.href='index.jsp?main=shop/shoplist.jsp'">상품목록</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="row" style="margin-top:20px;">
		<form action="product/addactiondetail.jsp" method="post">
			<table class="table table-bordered" style="width: 600px;">
				<tr>
					<td style="width:150px; background-color: lightblue"><b>마지막 제품</b></td>
					<td>
						<span><%=dto.getName() %></span>
					</td>
				</tr>
				<tr>
					<td style="width:150px; background-color: lightblue"><b>마지막 번호</b></td>
					<td>
						<input type="text" name="p_num" class="form-control" style="width: 200px;" value="<%=dto.getP_num() %>" required="required">
					</td>
				</tr>
				<tr>
					<td style="width:150px; background-color: lightblue"><b>사진1</b></td>
					<td>
						<input type="text" name="photo1" class="form-control" style="width:300px;">
					</td>
				</tr>
				<tr>
					<td style="width:150px; background-color: lightblue"><b>사진2</b></td>
					<td>
						<input type="text" name="photo2" class="form-control" style="width:300px;">
					</td>
				</tr>
				<tr>
					<td style="width:150px; background-color: lightblue"><b>사진3</b></td>
					<td>
						<input type="text" name="photo3" class="form-control" style="width:300px;">
					</td>
				</tr>
				<tr>
					<td style="width:150px; background-color: lightblue"><b>사진4</b></td>
					<td>
						<input type="text" name="photo4" class="form-control" style="width:300px;">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-info" style="width:150px;">상세정보저장</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>