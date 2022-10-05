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

<style type="text/css">
.qnatable{
	margin-top: 100px;
	width: 600px;
}

.acontent{
	font: "Noto Sans KR";
	font-weight: 400;
	font-size: 18pt;
}
.aday{
	
}

.adel, .aupdate{
	cursor: pointer;
	float: right;
}

</style>
<script type="text/javascript">

	
	$(function(){
		
		answerlist();
		
		//댓글 insert		
		$("button.btnaadd").click(function(){
			var myid = $("#myid").val();
			var num = $("#num").val();
			var content = $("#content").val();
			console.log(myid+num+content);
			
			if(content.trim().length==0){
		         alert("내용을 입력후 저장해주세요");
		         return;
		      }
			
			$.ajax({
		         type:"post",
		         dataType:"html",
		         url:"qna/answerinsert.jsp",
		         data:{"num":num,"myid":myid,"content":content},
		         success:function(){
		         
		        	//기존입력값 지우기
		            $("#content").val("");
		        	
		            //alert("success");
		            answerlist();
		            
		         }
		      });
		});
		
		
		//댓글 delete
		$(document).on("click","i.adel",function(){
			var idx = $(this).attr("idx");
			console.log(idx);
			
			var a = confirm("삭제하시겠습니까?");
			if(!a){
				return;
			}
			//삭제
			$.ajax({
				type:"get",
				url:"qna/answerdelete.jsp",
				data:{"idx":idx},
				dataType:"html",
				success:function(){
					answerlist();
					
				}
				
			});
			
		});
			
	});
	
	
	//사용자 함수 - list
	function answerlist(){
		var loginid = $("#myid").val(); //로그인 아이디
		var num = $("#num").val();
		
		$.ajax({
			type:"get",
			url:"qna/answerlist.jsp",
			data:{"num":num},
			dataType:"json",
			success:function(res){
				var s = "";
				
				$.each(res,function(i,ele){

					var writeid = ele.id; //작성 아이디
					s+= writeid+"님";
					if(loginid==writeid){
						s+="<i class='fas fa-edit aupdate' idx='"+ele.idx+"'></i>&nbsp;&nbsp;<i class='far fa-trash-alt adel' idx='"+ele.idx+"'></i>";
					}
					s+="<span class='aday'>"+ele.writeday+"</span>";
					s+="<pre class='acontent'>"+ele.content+"</pre>";
					
	
				})
				
				$("#answerlist").html(s);
			}
			
		});
		
	}

</script>
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
    <form id="frm" class="form-inline">
	<input type="hidden" id ="num" value="<%=num%>">
		<table class="table qnatable">
	    	<tr>
				<td colspan="2">
				<h1><%=dto.getSubject() %></h1>
				<span  style="float: right;"><b>작성일:</b> <%=dto.getWriteday() %></span>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<strong>작성자: </strong> <%=dto.getId() %>
				<span style="float: right;"><b>조회수: </b><%=dto.getReadcount()%></span>
				</td>
			</tr>
			<tr style="height: 400px;">
				<td colspan="2">
				<%
				if((dto.getContent())==null){%>
				<h5>저장된 내용 없음</h5>	
				<%}else{%>
					<%=dto.getContent()%>
				<%}
				%>
				</td>	
				
			</tr>
			
	<!-- 댓글 start-->
			<!-- 댓글창 start-->
			<tr>
		    	<td colspan="2">
		    		<div>
		    		<b class="acount">댓글 <span>0</span></b>
		    		</div>
		    		<div id="answerlist">
		    		댓글 목록
		    		</div>
		    		
		    	</td>
		    </tr>
		    <%
		    if(loginok!=null){%>
		    <div>
		    	<form id = "answerform" action="">
		    	<input type="hidden" id ="num" value="<%=num%>">
		    	<input type="hidden" name="myid" id="myid" value="<%=myid%>">
			    <tr>
					<td style="width: 90%">
						<textarea style="height: 70px;" name="content" id="content" required="required" class="form-control" placeholder="댓글을 입력하세요" ></textarea>
					</td>
					<td style="width: 10%">
						<button type="button" class="btn btn-success btnaadd" style="width: 100%; height: 70px;">등록</button>
					</td>
			   </tr>	
			  </form>
		   </div>
		    <%}
		    %>
		   <!-- 댓글창 end -->
	<!-- 댓글 end-->		
	
			<tr>
				<td colspan="2">
				<button type="button" class="btn btn-success" onclick="location.href='index.jsp?main=qna/qnaboard.jsp'">목록</button>
				<%
				if(myid.equals(dto.getId())){%>
				<button type="button" class="btn btn-danger" onclick="qnadel(<%=num %>,<%=currentPage %>)" style="float: right; margin-left: 10px;">삭제</button>
				<button type="button" class="btn btn-success" onclick="location.href='index.jsp?main=qna/qnaupdateform.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage %>'" style="float: right;">수정</button> 

				<%}
				%>
				</td>
			</tr>
			    
	    
	    </table>
	</form>
    </div>
    <!-- 게시물 내용 end -->
    
 	
	<script type="text/javascript">
		//사용자 함수 - 삭제
		function qnadel(num,currentPage){
			//alert(num+","+currentPage)
			
			var a = confirm("삭제하시겠습니까?");
			
			if(a){
				location.href = "qna/qnadeleteaction.jsp?num="+num+"&currentPage="+currentPage;
			}
			
		}
	</script>
</body>
</html>