<%@page import="java.util.Date"%>
<%@page import="data.dto.QnaAnswerDto"%>
<%@page import="data.dao.QnaAnswerDao"%>
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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="assets/css/templatemo.css">
<link rel="stylesheet" href="assets/css/custom.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-light-green.css">

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
		vertical-align: middle;
	}
	
	.banner-text {
		position: absolute;
		top: 50%;
		left: 67%;
		width: 100%;
		transform: translate(-50%, -50%);
		text-align: left;
	}
	
	b.b1 {
		font-size: 44pt;
		font-weight: 600;
		margin-bottom: 20px;
	}
	

	
</style>


</head>

<body>
<%
String loginok = (String)session.getAttribute("loginok");
String id = (String)session.getAttribute("idok");
String num = request.getParameter("num");

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


//댓글 갯수 카운트(1이상이면 '답변완료' 표시)
QnaAnswerDao adao = new QnaAnswerDao();
for(QnaBoardDto dto:list){
	int acount=adao.getAllAnswers(dto.getNum()).size();
	dto.setAnswercount(acount);
}

%>

	<!-- 상단 고정 이미지 start -->
	<div class="banner-wrap">
		<div class="banner-img">
			<img src="https://images-ext-1.discordapp.net/external/_h0dYb_x1ipIuJoHuFyded4-1Cjzxr1e_LqZvaFOwk8/%3Fv%3D1/https/resource.logitech.com/w_1800%2Ch_1800%2Cc_limit%2Cq_auto%3Abest%2Cf_jpg%2Cdpr_2.0/d_transparent.gif/content/dam/logitech/en/resellers/find-a-reseller/hero-desktop.jpg?width=1440&height=409">	
		</div>
		<div class="banner-text">
			<b class="b1">고객 게시판</b>
			<p>logitech 고객 게시판에 오신 것을 환영합니다. <br>
			자세한 문의는 1:1 문의 게시판을 이용해주세요.</p>
		</div>
	</div>
    <!-- 상단 고정 이미지 end -->
    
    
    <!-- 게시판 글 목록 -->
       
    
	<div class="container-xl"  id="qnalist">		
		
    	<nav class="navbar navbar-expand-sm w3-theme-l3 justify-content-center" style="margin-top: 50px;">
		  <ul class="navbar-nav">
		    <li class="nav-item">
		    	<%if(loginok!=null){
		    	%>
		    	<a class="nav-link"  href="index.jsp?main=qna/qnaform.jsp">1:1 문의</a>
		    	<%}else{
		    	%>
		    	<a class="nav-link" onclick="alert('로그인이 필요합니다.')" href="index.jsp?main=login/loginmain.jsp">1:1 문의</a>
		    	<%} 
		    	%>

		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="index.jsp?main=qna/qnaboard.jsp">고객게시판</a>
		      
		    </li>
		    <li class="nav-item">
		      <a class="nav-link notice" href="index.jsp?main=qna/notice.jsp">공지사항</a>
		    </li>
		  </ul>
		</nav>
   	
		
		<table class="table table-hover" id="qnatable" style="margin-top: 60px;">
			<thead>
			<tr style="text-align: center; font-weight: bold; background-color: #EEEEEE;">
				<td width="50">번호</td>
				<td width="60">분류</td>
				<td width="500">제목</td>
				<td width="100">작성자</td>
				<td width="120">작성일</td>
				<td width="60">조회</td>	
			</tr>
			</thead>
			
			<tbody>
			<%
			if(totalCount==0){
			%>
			<tr>
				<td colspan="6" align="center">
				<b>문의 내역이 없습니다.</b>
				</td>
			</tr>	
			<%}else{
				//날짜
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				
				//글 쓴 당일 동안 new 표시 넣기
				Date date = new Date();
				String today = sdf.format(date);
				
				for(QnaBoardDto dto:list){
			%>
				<tr>
					<td style="text-align: center"><%=no-- %></td>
					<td style="text-align: center"><%=dto.getCategory() %></td>					
					<td>
					
					<!-- admin이거나 본인 작성글일 경우에만 게시물 조회 -->
	                <span class="subject" loginid=<%=id%> writeid=<%=dto.getId()%> num=<%=dto.getNum()%> currentPage=<%=currentPage%> style="color:black; text-decoration: none;">
	                <%=dto.getSubject()%>
	                </span>
	                
					<!-- new 표시 넣기 -->
					<%
					String wday = sdf.format(dto.getWriteday());
					if(wday.equals(today)){
					%>
					<img alt="" src="assets/img/newicon.jpeg" width="12px;">
					<%
					}
					%>
					
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
		
	</div>
	
	
	
	<!-- 게시물 목록 end  -->
	

	
	
	<!--페이징 start -->
	<div class="container">
		<ul class="pagination justify-content-center">
         <%
         //이전
         if(startPage>1){%>
         <li class="page-item">
         <a href="index.jsp?main=qna/qnaboard.jsp?currentPage=<%=startPage-1%>" class="page-link" tabindex="-1">이전</a>
         </li>   
         <%}
            
            
         for(int pp=startPage;pp<=endPage;pp++){
            if(pp==currentPage){%>
               <li class="page-item">
               <a href="index.jsp?main=qna/qnaboard.jsp?currentPage=<%=pp%>" class="page-link" ><%=pp %></a>
               </li>   
            <%}else{%>
               <li class="page-item">
               <a href="index.jsp?main=qna/qnaboard.jsp?currentPage=<%=pp%>" class="page-link"><%=pp %></a>
               </li>
               
            <%}
         }
         
         //다음
         if(endPage<totalPage){%>
         
         <li class="page-item">
         <a href="index.jsp?main=qna/qnaboard.jsp?currentPage=<%=endPage+1%>" class="page-link">다음</a>
         </li>   
         <%}
         %>
      </ul>
	</div>
	<!-- 페이징 end -->
    
    <script type="text/javascript">

	//사용자 함수
	$(".subject").click(function(){
		
		var writeid = $(this).attr("writeid");
		var loginid = $(this).attr("loginid");
		var num = $(this).attr("num");
		var currentPage = $(this).attr("currentPage");
		console.log(loginid);
		console.log(num);
		console.log(writeid);
		
		if(loginid=="null"){
			alert("로그인이 필요합니다.");
			location.href = "index.jsp?main=login/loginmain.jsp";
		}else if(loginid=="admin"||loginid==writeid){
			location.href = "index.jsp?main=qna/qnadetail.jsp?num="+num+"currentPage"+currentPage;
		}else{
			alert("본인이 작성한 글만 조회 가능합니다.");
		}
		
	});

	</script>
    
</body>
</html>