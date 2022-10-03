<%@page import="data.dto.QnaBoardDto"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dao.QnaBoardDao"%>
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

<body>
<body>
<%
QnaBoardDao dao = new QnaBoardDao();

//페이징에 필요한 변수
int totalCount;
int totalPage; //총페이지수
int startPage; //각블럭의 시작페이지
int endPage; //각블럭의 끝페이지
int start; //각페이지의 시작번호
int perPage = 10; //한페이지에 보여질 글의 갯수
int perBlock = 5; //한블럭당 보여지는 페이지개수
int currentPage;//현재페이지
int no;

//총갯수:
totalCount = dao.getTotalCount();

//현재페이지번호 읽기(null일경우는 1페이지로 설정)
if (request.getParameter("currentPage") == null)
 currentPage = 1;
else
 currentPage = Integer.parseInt(request.getParameter("currentPage"));

//총페이지갯수 구하기
totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

//각블럭의 시작페이지(현재페이지 3: 시작:1 끝:5)
//각블럭의 시작페이지(현재페이지 6: 시작:6 끝:10)
startPage = (currentPage - 1) / perBlock * perBlock + 1;
endPage = startPage + perBlock - 1;

//총페이지수가 8 ..2번재 블럭은 startpage6 endpage 10...endpage 8로수정
if (endPage > totalPage)
 endPage = totalPage;

//각페이지에서 불러올 시작번호
//현재페이지가 1일경우 strt 1, 2일경우 6
start = (currentPage - 1) * perPage;

//각페이지에서 필요한 게시글불러오기
List<QnaBoardDto> list = dao.getList(start, perPage);

//각글앞에 붙힐 시작번호
//총글이 만약에 20..1페이지는 20부터 2페이지는 15부터
//출력해서 1씩 감소하면서 출력
no = totalCount - (currentPage - 1) * perPage;

//댓글 변수에 댓글 총 개수 넣기

%>

	<!-- 상단 고정 이미지 start -->
	<div class="container-fluid bg-light py-5">
        <div class="col-md-6 m-auto text-center">
            <h1 class="h1">QnA 게시판</h1>
            <p>
                문의를 남겨주세요
            </p>
        </div>
    </div>
    <!-- 상단 고정 이미지 end -->
    
    
    <!-- 게시판 글 목록 -->
	<div style="margin:30px 30px; widows: 800px;">
		<br>
		<h5 class="alert alert-info">총 <%=totalCount%>개의 게시물이 있습니다.</h5>
		
		<table class="table table-hover">
			<tr style="text-align: center">
				<td width="60">번호</td>
				<td width="500">제목</td>
				<td width="100">작성자</td>
				<td width="120">작성일</td>
				<td width="60">조회</td>	
			</tr>
		
			<%
			if(totalCount==0){
			%>
			<tr>
				<td colspan="5" align="center">
				<b>등록된 게시물이 없습니다.</b>
				</td>
			</tr>	
			<%}else{
				//날짜
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				for(QnaBoardDto dto:list){
			%>
				<tr>
					<td style="text-align: center"><input type="checkbox" class="alldel" value="<%=dto.getNum()%>">&nbsp;&nbsp;<%=no-- %></td>
					<td><%=dto.getSubject()%></td>
					<td style="text-align: center">id 추가</td>
					<td style="text-align: center"><%=sdf.format(dto.getWriteday()) %></td>
					<td style="text-align: center"><%=dto.getReadcount() %></td>
				</tr>	
				<%}
			}
			
			%>
			<tr>
			<td colspan="5">
				<input type="checkbox" class="alldelcheck">전체선택
				<span style="float: right;">
				<button type="button" class="btn btn-danger" id="btndel" >삭제</button>
				<button type="button" class="btn btn-success" onclick="location.href='index.jsp?main=qna/qnaform.jsp'">글쓰기</button>
				</span>
			</td>
			</tr>
			
		</table>
	</div>
    
</body>
</html>