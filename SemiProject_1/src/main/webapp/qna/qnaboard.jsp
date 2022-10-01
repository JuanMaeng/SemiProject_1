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

<script type="text/javascript">
$(function(){
	
	 $("#qnabtn").click(function(){

		location.href="index.jsp?main=qna/qnaform.jsp";
			
	});
});

</script>

<body>
<body>
<%
QnaBoardDao dao = new QnaBoardDao();

//list 가져오기
List<QnaBoardDto> list = dao.getAllQnas();

//날짜
SimpleDateFormat sdf = new SimpleDateFormat();
%>

	<!-- 상단 고정 이미지  -->
	<div class="container-fluid bg-light py-5">
        <div class="col-md-6 m-auto text-center">
            <h1 class="h1">QnA 게시판</h1>
            <p>
                문의을 남겨주세요
            </p>
        </div>
    </div>
    <!-- 상단 고정 이미지  -->
    
    
    <!-- 게시판 글 목록 -->
    <div>
    <%
    for(QnaBoardDto dto:list){
    %>
    <table class="table table-hover">
    	<thead>
    		<tr style="text-align: center">
				<td width="60">번호</td>
				<td width="500">제목</td>
				<td width="100">작성자</td>
				<td width="120">작성일</td>
				<td width="60">조회</td>	
			</tr>
    	</thead>
    	
    	<tbody>
    		<td><%=dto.getNum() %></td>
    		<td><a href="index.jsp?main=qna/qnadetail.jsp"><%=dto.getSubject() %></a></td>
    		<td style="text-align: center"><%=dto.getId() %></td>
			<td style="text-align: center"><%=sdf.format(dto.getWriteday()) %></td>
			<td style="text-align: center"><%=dto.getReadcount() %></td>
    	</tbody>
    	
    </table>
    <%}
    %>
    </div>
   
    

    
    <p class="text-center"><button type="button" class="btn btn-success" id="qnabtn">문의하기</button></p>
</body>
</html>