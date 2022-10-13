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
<style type="text/css">
	tr > td {
		text-align: center;
	}
	tr > td ~ td {
		text-align: left;
	}
</style>
</head>
<%
String p_num=request.getParameter("p_num");
String name=request.getParameter("name");
ProductDao dao = new ProductDao();

ProductDto dto = dao.getLastData();
%>
<body>
<div class="container-xl py-5">
	<div class="row">
		<div class="col" style="margin-top:20px;">
			<h3>제품 등록</h3>
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
								<option value="마우스">마우스</option>
								<option value="키보드">키보드</option>
								<option value="콤보">콤보</option>
								<option value="웹캠">웹캠</option>
								<option value="크리에이터용 제품">크리에이터용 제품</option>
								<option value="컨퍼런스 카메라">컨퍼런스 카메라</option>
								<option value="통합 회의실 솔루션">통합 회의실 솔루션</option>
								<option value="logi Dock">Logi Dock</option>
								<option value="헤드셋 및 이어폰">헤드셋 및 이어폰</option>
								<option value="Bluetooth 스피커">Bluetooth 스피커</option>
								<option value="컴퓨터 스피커">컴퓨터 스피커</option>
								<option value="iPad용">iPad용</option>
								<option value="스마트폰용">스마트폰용</option>
								<option value="화상회의용" selected="selected">화상회의용</option>
								<option value="프레젠테이션 리모컨">프레젠테이션 리모컨</option>
								<option value="보안 카메라">보안 카메라</option>
							</select>
						</td>
					</tr>
					<tr>
						<td style="width:150px; background-color: #66cdaa"><b>컬렉션</b></td>
						<td>
							<select style="width: 200px;" name="collection" class="form-control" required="required">
								<option value="Ergo시리즈">Ergo시리즈</option>
								<option value="마스터시리즈">마스터시리즈</option>
								<option value="무선">무선</option>
								<option value="유선">유선</option>
								<option value="화상회의">화상 회의</option>
								<option value="교육용">교육용</option>
								<option value="게임">게임</option>
								<option value="컴퓨터용">컴퓨터용</option>
								<option value="모바일장치용">모바일 장치용</option>
								<option value=" " selected="selected">없음</option>
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
						<td style="width:150px; background-color: #66cdaa"><b>필터</b></td>
						<td>
							<input type="text" name="filter" class="form-control" style="width:400px;"required="required" value="windows,chrome,mac">
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
		<div class="col" style="margin-top:20px;">
			<h3>상세 정보 등록</h3>
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
						<td style="width:150px; background-color: lightblue"><b>디테일설명</b></td>
						<td>
							<input type="text" name="description" class="form-control" style="width:300px;">
						</td>
					</tr>
					<tr>
						<td style="width:150px; background-color: lightblue"><b>요구사항</b></td>
						<td>
							<textarea class="form-control" name="sysreq" style="width:300px; height:200px; "></textarea>
						</td>
					</tr>
					<tr>
						<td style="width:150px; background-color: lightblue"><b>구성품</b></td>
						<td>
							<textarea class="form-control" name="components" style="width:300px; height:200px; "></textarea>
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
</div>
</body>
</html>