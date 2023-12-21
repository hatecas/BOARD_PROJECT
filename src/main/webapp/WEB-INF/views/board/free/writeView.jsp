<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>자유 게시판</title>
		<script type="text/javascript" src="<c:url value='/cdn/smarteditor/js/service/HuskyEZCreator.js'/>" charset="utf-8"></script>
		<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	</head>
	<body>
		<div>
			<h1>게시글 등록 화면</h1>
		</div>
		<div>
			<form id="frm1" method="post" action="<c:url value='/board/free/write'/>" enctype="multipart/form-data">
				<input type="text" name="title" placeholder="제목"><br>
				<input type="file" name="file" value="업로드"><br>
				<textarea name="content" id="txtContent"></textarea><br>
				<input type="button" id="btnWrite" value="작성"><br>
			</form>
		</div>
		<script>		
			document.getElementById('btnWrite').addEventListener('click',function(){
				oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []);  
	    		//스마트 에디터 값을 텍스트컨텐츠로 전달
				var content = document.getElementById("smartEditor").value;
				
				document.getElementById('frm1').submit();	
			});
		</script>
		<script id="smartEditor" type="text/javascript"> 
			var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
			    oAppRef: oEditors,
			    elPlaceHolder: "txtContent",  //textarea ID 입력
			    sSkinURI: "<c:url value='/cdn/smarteditor/SmartEditor2Skin.html'/>",  //martEditor2Skin.html 경로 입력
			    fCreator: "createSEditor2",
			    htParams : { 
			    	// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
			        bUseToolbar : true, 
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
				bUseVerticalResizer : false, 
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
				bUseModeChanger : false 
			    }
			});
</script>
	</body>
</html>