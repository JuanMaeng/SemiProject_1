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
	
	.qnatable{
		margin-top: 40px;
		width: 600px;
	}
	
	.acontent{
		font: "Noto Sans KR";
		font-weight: 300;
		font-size: 18pt;
	}
	.aday{
		font-size: 0.8em;
		font-weight:400;
		letter-spacing:0 !important
	}
	
	.flex-answer{
		display: flex;
		flex-direction: row;
		float: right;
	}
	
	.adel{
		cursor: pointer;
		float:right;
		margin-left: 10px;
		order: 2;
	}
	
	.aupdate{
		cursor: pointer;
		float:right;
		margin-left: 10px;
		order: 1;
	}
	
	

	
	

</style>
<script type="text/javascript">

	
	$(function(){
		
		answerlist();
		
		//?????? insert		
		$("button.btnaadd").click(function(){
			var myid = $("#myid").val();
			var num = $("#num").val();
			var content = $("#content").val();
			console.log(myid+num+content);
			
			if(content.trim().length==0){
		         alert("????????? ????????? ??????????????????");
		         return;
		      }
			
			$.ajax({
		         type:"post",
		         dataType:"html",
		         url:"qna/answerinsert.jsp",
		         data:{"num":num,"myid":myid,"content":content},
		         success:function(){
		         
		        	//??????????????? ?????????
		            $("#content").val("");
		        	
		            //alert("success");
		            answerlist();
		            
		         }
		      });
		});
		
		
		//?????? delete
		$(document).on("click","i.adel",function(){
			var idx = $(this).attr("idx");
			console.log(idx);
			
			var a = confirm("?????????????????????????");
			if(!a){
				return;
			}
			//??????
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
			
		
		//?????? update
		//?????? ??? ????????????
		$(document).on("click","i.aupdate",function(){
			idx = $(this).attr("idx"); 
			console.log(idx);
			
			
			var up = "<div>";
			up += "<textarea class='form-control upcontent' id ='upcontent' style='margin-top:10px; margin-bottom:10px;' required='required'></textarea></td>";
			up += "<button class='btn btn-warning btnupdate' idx='"+idx+"' style='float:right; margin-left:10px;'>??????</button>";
			up += "<button class='btn btn-secondary btncancel' idx='"+idx+"' onclick='answerlist()' style='float:right;'>??????</button>";
			up += "</div>"; 
			
			$.ajax({
				type:"get",
				url:"qna/answerupdateform.jsp",
				data:{"idx":idx},
				dataType:"json",
				success:function(res){
				

					$(".acontent"+idx).html(up);
					console.log(".acontent"+idx);
					console.log(idx);
					
					$("#upcontent").val(res.content);
					
				}
				
			});
			
		});
		
		//????????????
		$(document).on("click","button.btnupdate",function(){
			
			var content = $("#upcontent").val();
			console.log(content);
			
			$.ajax({
				type:"get",
				url:"qna/answerupdate.jsp",
				data:{"idx":idx, "content":content},
				dataType:"html",
				success:function(res){
					answerlist();
					//alert("success");
				}
				
			});
		});
		
		
			
	});
	
	///////////////////////////////////////
	//????????? ?????? - list
	function answerlist(){
		var loginid = $("#myid").val(); //????????? ?????????
		var num = $("#num").val();
		
		$.ajax({
			type:"get",
			url:"qna/answerlist.jsp",
			data:{"num":num},
			dataType:"json",
			success:function(res){
				//?????? ?????? ??????
		         $("b.acount>span").text(res.length);
				
				var s = "";
					
				$.each(res,function(i,ele){

					var writeid = ele.id; //?????? ?????????
					s+="<div style='margin-top:10px; margin-left:20px;'>";
					s+= "<b style='font-family:Noto Sans KR; font-weight: 300; font-size:14pt;'>[?????????]</b>";
					if(loginid==writeid){
						s+="<div class='flex-answer'><i class='far fa-edit aupdate' idx='"+ele.idx+"'> ??????</i>&nbsp;&nbsp;";
						s+="<i class='far fa-trash-alt adel' idx='"+ele.idx+"'> ??????</i></div>";
					}
					s+="&nbsp;&nbsp;<span class='aday'>"+ele.writeday+"</span>";
					s+="<pre class='acontent"+ele.idx+"' idx='"+ele.idx+"' style='font-family:Noto Sans KR; font-size:14pt; margin-left:10px;'>"+ele.content+"</pre>";
					s+="</div>";
					
	
				})
				
				$("#alist").html(s);
			}
			
		});
		
	}
	
	//????????? ?????? - ??????
	function qnadel(num,currentPage){
		//alert(num+","+currentPage)
		
		var a = confirm("?????????????????????????");
		
		if(a){
			location.href = "qna/qnadeleteaction.jsp?num="+num+"&currentPage="+currentPage;
		}
		
	}

</script>
</head>
<body>
<%
String loginok = (String)session.getAttribute("loginok");
String myid = (String)session.getAttribute("idok");

String num = request.getParameter("num");
String currentPage = request.getParameter("currentPage");
String category = request.getParameter("category");
String subject = request.getParameter("subject");

QnaBoardDao dao = new QnaBoardDao();
QnaBoardDto dto = dao.getData(num);

dao.updateReadCount(num);

SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd HH:mm");

%>

	<!-- ?????? ?????? ????????? start -->
	<div class="banner-wrap">
		<div class="banner-img">
			<img src="https://images-ext-1.discordapp.net/external/_h0dYb_x1ipIuJoHuFyded4-1Cjzxr1e_LqZvaFOwk8/%3Fv%3D1/https/resource.logitech.com/w_1800%2Ch_1800%2Cc_limit%2Cq_auto%3Abest%2Cf_jpg%2Cdpr_2.0/d_transparent.gif/content/dam/logitech/en/resellers/find-a-reseller/hero-desktop.jpg?width=1440&height=409">	
		</div>
		<div class="banner-text">
			<b class="b1">?????? ?????????</b>
			<p>logitech ?????? ???????????? ?????? ?????? ???????????????. <br>
			????????? ????????? 1:1 ?????? ???????????? ??????????????????.</p>
		</div>
	</div>
    <!-- ?????? ?????? ????????? end -->
       
    <!-- ????????? ?????? start -->
    <div class="container">
    
    <!-- nav -->
    <nav class="navbar navbar-expand-sm w3-theme-l3 justify-content-center" style="margin-top: 50px;">
		  <ul class="navbar-nav">
		    <li class="nav-item">
		      <a class="nav-link" href="index.jsp?main=qna/qnaform.jsp"><b>1:1 ??????</b></a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="index.jsp?main=qna/qnaboard.jsp"><b>???????????????</b></a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="index.jsp?main=qna/notice.jsp"><b>????????????</b></a>
		    </li>
		  </ul>
	</nav>
    
    <!-- table -->
    <form id="frm" class="form-inline">
	<input type="hidden" id ="num" value="<%=num%>">
		<table class="table qnatable">
	    	<tr>
				<td colspan="2">
				<Strong style="font-size: 24pt; margin-left: 10px;">[<%=dto.getCategory()%>] <%=dto.getSubject() %></Strong>
				<b style="float: right; margin-right: 10px;">?????????: <%=sdf.format(dto.getWriteday()) %></b> 
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<strong style="margin-left: 20px;">?????????: </strong> <%=dto.getId() %>
				<span style="float: right; margin-right: 10px;"><b>?????????: </b><%=dto.getReadcount()%></span>
				</td>
			</tr>
			<tr style="height: 400px;">
				<td colspan="2">
				<%
				if((dto.getContent())==null){%>
				<h5>????????? ?????? ??????</h5>	
				<%}else{%>
					<div style="margin-top: 20px; margin-left: 25px;"><%=dto.getContent()%></div>
				<%}
				%>
				</td>	
				
			</tr>
			
	<!-- ?????? start-->
			<!-- ????????? start-->
			<tr>
		    	<td colspan="2">
		    		<div style="margin-bottom: 10px;">
		    		<b class="acount">?????? <span>0</span></b>
		    		</div>
		    		<div id="alist">
		    		</div>
		    	</td>
		    </tr>
		    <%
		    if(loginok!=null && myid.equals("admin")){%>
		    <div>
		    	<form id = "answerform" action="">
		    	<input type="hidden" id ="num" value="<%=num%>">
		    	<input type="hidden" name="myid" id="myid" value="<%=myid%>">
			    <tr>
					<td style="width: 90%">
						<textarea style="height: 70px;" name="content" id="content" required="required" class="form-control" placeholder="????????? ???????????????" ></textarea>
					</td>
					<td style="width: 10%">
						<button type="button" class="btn btn-primary btnaadd" style="width: 100%; height: 70px;">??????</button>
					</td>
			   </tr>	
			  </form>
		   </div>
		    <%}
		    %>
		   <!-- ????????? end -->
	<!-- ?????? end-->		
	
			<tr>
				<td colspan="2">
				<%
				if(dto.getId().equals(myid)){%>
				<button type="button" class="btn btn-danger" onclick="qnadel(<%=num %>,<%=currentPage %>)" style="float:right; margin-left: 10px;">??????</button>
				<button type="button" class="btn btn-warning" onclick="location.href='index.jsp?main=qna/qnaupdateform.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage %>'" style="float: right; margin-left: 10px;">??????</button> 
				<%}
				%>
				<button type="button" class="btn btn-success" onclick="location.href='index.jsp?main=qna/qnaboard.jsp'" style="float: left;">??????</button>
				</td>
			</tr>
			    
	    
	    </table>
	</form>
    </div>
    <!-- ????????? ?????? end -->
    
   
 	
</body>
</html>