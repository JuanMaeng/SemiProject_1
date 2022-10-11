<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dao.QnaBoardDao"%>
<%@page import="java.util.List"%>
<%@page import="data.dto.QnaBoardDto"%>
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
	
	.banner-wrap{
		margin: 10px auto;
		position: relative;
	}
	
	.banner-wrap img {
		width: 100%;
		height: 400px;
		vertical-align: middle;
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
		font-weight: 600;
		margin-bottom: 20px;
	}
	
</style>
<script type="text/javascript">


	
</script>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String loginok = (String)session.getAttribute("loginok");
String id = (String)session.getAttribute("idok");

String searchWord = request.getParameter("searchWord");

QnaBoardDao dao = new QnaBoardDao();

//페이징에 필요한 변수
int totalCount;
int totalPage; //총 페이지 수
int startPage; //각 블럭의 시작 페이지
int endPage; //각 블럭의 끝 페이지
int start; //각 페이지의 시작 번호
int perPage = 3; //한 페이지에 보여질 글 갯수
int perBlock = 5; //한 블럭 당 보여지는 페이지 갯수
int currentPage; //현재 페이지
int no;
int searchCount;

//총 갯수: 
//totalCount = dao.getTotalCount();
//검색 갯수:
searchCount = dao.getSearchCount(searchWord);

//현재 페이지 번호 읽기(null일 경우 1페이지로 설정)
if(request.getParameter("currentPage")==null){
	currentPage=1;
}else{
	currentPage=Integer.parseInt(request.getParameter("currentPage"));
}

//총 페이지 갯수 구하기
totalPage = searchCount/perPage + (searchCount%perPage==0?0:1);

//각 블럭의 시작페이지(ex.현재 페이지가 3인 경우, 시작:1, 끝:5 / 현재: 6, 시작: 6, 끝: 10)
startPage = (currentPage -1)/perBlock*perBlock+1;
endPage = startPage + perBlock -1;

//총 페이지 수가 8이라고 할 때, 2번째 블럭은 startPage= 6, endPage=10이 되어야 하는데 총 페이지가 8까지니까 endPage를 10=>8로 수정해줘야 한다
if(endPage>totalPage){
	endPage = totalPage;
}

//각 페이지에서 불러올 시작 번호
//ex.현재페이지 1일 경우 start=1 / 현재 2, start = 6 / 
start = (currentPage-1)*perPage;

//각페이지에서 필요한 게시글불러오기
List<QnaBoardDto> list = dao.getSearchList(start, perPage, searchWord);


//각글앞에 붙힐 시작번호
//총글이 만약에 20..1페이지는 20부터 2페이지는 15부터
//출력해서 1씩 감소하면서 출력
no = searchCount - (currentPage - 1) * perPage;

//댓글 변수에 댓글 총 개수 넣기


%>

	<!-- 상단 고정 이미지 start -->
	<div class="banner-wrap">
		<div class="banner-img">
			<img src="https://images-ext-1.discordapp.net/external/_h0dYb_x1ipIuJoHuFyded4-1Cjzxr1e_LqZvaFOwk8/%3Fv%3D1/https/resource.logitech.com/w_1800%2Ch_1800%2Cc_limit%2Cq_auto%3Abest%2Cf_jpg%2Cdpr_2.0/d_transparent.gif/content/dam/logitech/en/resellers/find-a-reseller/hero-desktop.jpg?width=1440&height=409">	
		</div>
		<div class="banner-text">
			<b class="b1">Q&A 게시판</b>
			<p>문의를 남겨주세요</p>
		</div>
	</div>
    <!-- 상단 고정 이미지 end -->
    
    
    <!-- 게시판 글 목록 -->
       
    
	<div class="container-xl"  id="qnalist">
		<%-- <br>
		<h5 class="alert alert-primary">총 <%=totalCount%>개의 문의글이 있습니다.</h5> --%>
		
		
    	<nav class="navbar navbar-expand-sm bg-light justify-content-center">
		  <ul class="navbar-nav">
		    <li class="nav-item">
		      <a class="nav-link" href="index.jsp?main=qna/qnaform.jsp">1:1 문의</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="index.jsp?main=qna/qnaboard.jsp">문의 내역</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="index.jsp?main=qna/notice.jsp">공지사항</a>
		    </li>
		  </ul>
		</nav>

   	 	
		<!-- 검색창 -->
	       <div class='searchbox' style="float: right; margin-top:20px; margin-bottom: 20px;">
	          <form action="index.jsp?main=qna/searchlist.jsp" method="get">
	             <!-- <select name="searchType">
	                <option value="subject">제목</option>
	                <option value="content">내용</option>             
	             </select> -->
	             
	            <input type="text" name="searchWord">
	            <input type="submit" value="검색">
	         </form>
	      </div>

    	
		
		<table class="table table-hover" id="qnatable">
			<thead>
			<tr style="text-align: center; font-weight: bold; background-color: #EEEEEE;">
				<td width="40">번호</td>
				<td width="40">분류</td>
				<td width="500">제목</td>
				<td width="100">작성자</td>
				<td width="120">작성일</td>
				<td width="60">조회</td>	
			</tr>
			</thead>
			
			<tbody>
			<%
			if(searchCount==0){
			%>
			<tr>
				<td colspan="6" align="center">
				<b>검색 내역이 없습니다.</b>
				</td>
			</tr>	
			<%}else{
				//날짜
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				for(QnaBoardDto dto:list){
			%>
				<tr>
					<td style="text-align: center"><%=no-- %></td>
					<td style="text-align: center"><%=dto.getCategory() %></td>
					<td><a href="index.jsp?main=qna/qnadetail.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>" style="color:black; text-decoration: none;"><%=dto.getSubject()%></a>
					<!-- 제목 옆에 댓글 갯수 출력 -->
					<%
					if(dto.getAnswercount()>0){
						%>
						<a href="index.jsp?main=qna/qnadetail.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>#alist" style="text-decoration: none;"><b style="color:blue; font-size: 0.7em;">[답변완료]<b></a>
					<%}
					%>
					</td>
					
					<td style="text-align: center"><%=dto.getId() %></td>
					<td style="text-align: center"><%=sdf.format(dto.getWriteday()) %></td>
					<td style="text-align: center"><%=dto.getReadcount() %></td>
				</tr>	
				</tbody>
				<%}
			}
			
			
			if(loginok!=null){%>
			<tr>
			<td colspan="6">
				<span style="float: right;">
				<button type="button" class="btn btn-success" onclick="location.href='index.jsp?main=qna/qnaform.jsp'">글쓰기</button>
				</span>
			</td>
			</tr>	
			<%}
			%>
			
			
			
		</table>



	<!--페이징 start -->
	<div class="container">
		<ul class="pagination justify-content-center">
         <%
         //이전
         if(startPage>1){%>
         <li class="page-item">
         <a href="index.jsp?main=qna/notice.jsp?currentPage=<%=startPage-1%>" class="page-link" tabindex="-1">이전</a>
         </li>   
         <%}
            
            
         for(int pp=startPage;pp<=endPage;pp++){
            if(pp==currentPage){%>
               <li class="page-item">
               <a href="index.jsp?main=qna/notice.jsp?currentPage=<%=pp%>" class="page-link" ><%=pp %></a>
               </li>   
            <%}else{%>
               <li class="page-item">
               <a href="index.jsp?main=qna/notice.jsp?currentPage=<%=pp%>" class="page-link"><%=pp %></a>
               </li>
               
            <%}
         }
         
         //다음
         if(endPage<totalPage){%>
         
         <li class="page-item">
         <a href="index.jsp?main=qna/notice.jsp?currentPage=<%=endPage+1%>" class="page-link">다음</a>
         </li>   
         <%}
         %>
      </ul>
	</div>
	<!-- 페이징 end -->
    
</body>
</html>