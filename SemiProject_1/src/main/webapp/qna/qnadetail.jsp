<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.QnaBoardDto"%>
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
<%
String loginok = (String)session.getAttribute("loginok");
String myid = (String)session.getAttribute("idok");

String num = request.getParameter("num");
String currentPage = request.getParameter("currentPage");


QnaBoardDao dao = new QnaBoardDao();
QnaBoardDto dto = dao.getData(num);

dao.updateReadCount(num);

SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd HH:mm");

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
    
    <!-- 게시물 내용 start -->
    <div class="container">
    <form id="frm">
	<input type="hidden" name = "num" value="<%=num%>">
		<table class="table table-bordered">
		
	    	<tr style="width: 150px;">
				<th>제목</th>
				<td><%=dto.getSubject() %></td>
			</tr>
			<tr style="width: 150px;">
				<th>작성자</th>
				<td><%=dto.getId() %></td>
			</tr>
			<tr style="width: 150px;">
				<th>작성일</th>
				<td><%=dto.getWriteday() %></td>
			</tr>
			<tr style="width: 150px;">
				<th>조회수</th>
				<td><%=dto.getReadcount() %></td>
			</tr>
			<tr style="width: 150px;">
				<th>내용</th>
				<td>
				<%
				if((dto.getContent())==null){%>
				<h5>저장된 내용 없음</h5>	
				<%}else{%>
					<%=dto.getContent()%>
				<%}
				%>
				</td>
				
			</tr>
			
			<tr>
				<td colspan="2">
				<button type="button" class="btn btn-success" onclick="location.href='index.jsp?main=qna/qnaboard.jsp'">목록</button>
				<%
				if(myid.equals(dto.getId())){%>
				<button type="button" class="btn btn-success" onclick="location.href='index.jsp?main=qna/updateqnaform.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage %>'" style="float: right;">수정</button>&nbsp;&nbsp;
				<button type="button" class="btn btn-danger" onclick="" style="float: right;">삭제</button>
				<%}
				%>
				</td>
			</tr>
			    
	    
	    </table>
	</form>
    </div>
    <!-- 게시물 내용 end -->
    
</body>
</html>