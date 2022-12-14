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

<%
	//프로젝트의 경로
	String root=request.getContextPath();
	String id = (String)session.getAttribute("idok");
			
	String num = request.getParameter("num");
	String currentPage = request.getParameter("currentPage");
	
%>

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

<!-- se2 폴더에서 js 파일 가져오기 -->
<script type="text/javascript" src="<%=root%>/se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>

<script type="text/javascript" src="<%=root%>/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"
	charset="utf-8"></script>	

</head>

<body>
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
    
    <!-- 게시물 내용 start -->
    <div class="container">
    
    <!-- nav -->
    <nav class="navbar navbar-expand-sm w3-theme-l3 justify-content-center" style="margin-top: 50px;">
		  <ul class="navbar-nav">
		    <li class="nav-item">
		      <a class="nav-link" href="index.jsp?main=qna/qnaform.jsp"><b>1:1 문의</b></a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="index.jsp?main=qna/qnaboard.jsp"><b>고객게시판</b></a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="index.jsp?main=qna/notice.jsp"><b>공지사항</b></a>
		    </li>
		  </ul>
	</nav>
   
    
	<form action="qna/qnainsertproc.jsp" method="get">
		<input type="hidden" name="id" id="id" value="<%=id%>">
		<table class="table table-bordered" style="text-align:center; height:500px; margin-top: 40px;">
			<thead>
				<tr>	
					<%if(id.equals("admin")){	
						%>
						<th colspan="2" style="background-color: #f8f9fa; text-align: center;">공지</th>	
						<%}else{%>
						<th colspan="2" style="background-color: #f8f9fa; text-align: center;">문의하기</th>	
						<%}%>				
				</tr>
			</thead>
			<tbody>
				<tr>
					<th width="100">분 류</th>
					<td>
						<select name="category" class="form-control"  style="width: 10%;">
							<%
							if(id.equals("admin")){%>
							<option value="공지">공지</option>	
							<%}else{
							%>
								<option value="배송" name="category">배송</option>
								<option value="결제" name="category">결제</option>
								<option value="교환" name="category">교환</option>
								<option value="환불" name="category">환불</option>
								<option value="기타" name="category">기타</option>
							<%}
							%>
							
						</select>	
					</td>
				</tr>
				<tr>
					<th width="100">제 목</th>
					<td>
						<input type="text" name="subject" class="form-control"
							required="required">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="content" id="content"		
							required="required"			
							style="width: 100%; height: 500px; display: none;"></textarea>		
					
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2" align="center">
						<button type="button" class="btn btn-secondary" style="width: 120px;" onclick="history.back(-1);">뒤로 가기</button>
						<%if(id.equals("admin")){	
						%>
						<button type="button" class="btn btn-success"
							style="width: 120px;"
							onclick="submitContents(this)">공지등록</button>
						<%}else{%>
						<button type="button" class="btn btn-success"
							style="width: 120px;"
							onclick="submitContents(this)">문의하기</button>
						<%}%>

					</td>
				</tr>
			
			</tfoot>
		</table>
	
	</form>
	</div>
	
	<!-- 스마트게시판에 대한 스크립트 코드 넣기 -->
	<script type="text/javascript">
	var oEditors = [];
	
	nhn.husky.EZCreator.createInIFrame({
	
	    oAppRef: oEditors,
	
	    elPlaceHolder: "content",
	
	    sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html",
	
	    fCreator: "createSEditor2"
	
	}); 
	
	//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
	
	function submitContents(elClickedObj) {
	
	    // 에디터의 내용이 textarea에 적용된다.
	
	    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [ ]);
	
	 
	
	    // 에디터의 내용에 대한 값 검증은 이곳에서
	
	    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
	    try {
	        elClickedObj.form.submit();
	    } catch(e) { 
	
	    }
	
	}
	
	// textArea에 이미지 첨부
	
	function pasteHTML(filepath){
	    var sHTML = '<img src="<%=request.getContextPath()%>/save/'+filepath+'">';
	    oEditors.getById["content"].exec("PASTE_HTML", [sHTML]); 
	
	}
	
	//첨부한 이미지 미리보기
	function readURL(input){
		if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	        $('#showimg').attr('src', e.target.result);
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	
	}
	
	</script>
</body>
</html>