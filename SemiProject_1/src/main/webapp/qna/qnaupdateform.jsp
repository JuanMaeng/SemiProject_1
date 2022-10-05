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

<%
	//프로젝트의 경로
	String root=request.getContextPath();
	
	String id = (String)session.getAttribute("idok");
	String num = request.getParameter("num");
	String currentPage = request.getParameter("currentPage");
	
	QnaBoardDao dao = new QnaBoardDao();
	QnaBoardDto dto = dao.getData(num);
	
%>
<!-- se2 폴더에서 js 파일 가져오기 -->
<script type="text/javascript" src="<%=root%>/se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>

<script type="text/javascript" src="<%=root%>/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"
	charset="utf-8"></script>	
	
</head>

<body>
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
    
	<form action="qna/qnaupdateaction.jsp" method="post">
		<input type="hidden" name="id" id="id" value="<%=id%>">
		<input type="hidden" name="num" value=<%=num %>>
		<input type="hidden" name="currentPage" value=<%=currentPage %>>
		<table class="table table-bordered" style="width:900px; height:500px; margin: 100px 500px 200px;">
			<thead>
				<tr>
					<th colspan="2" style="background-color: #f8f9fa; text-align: center;">문의하기</th>						
				</tr>
			</thead>
			<tbody>
				<tr>
					<th bgcolor="orange" width="100">제  목</th>
					<td>
						<input type="text" name="subject" value="<%=dto.getSubject() %>" class="form-control"
							required="required" style="width: 800px;">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="content" id="content"
							required="required"			
							style="width: 100%; height: 500px; display: none;"><%=dto.getContent() %></textarea>		
					
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2" align="center">
						<button type="button" class="btn btn-success"
							style="width: 120px;"
							onclick="submitContents(this)">문의하기</button>
						
					</td>
				</tr>
			
			</tfoot>
		</table>
	
	</form>
	
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