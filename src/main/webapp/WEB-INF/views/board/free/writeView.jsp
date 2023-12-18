<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>자유 게시판</title>
	</head>
	<body>
		<div>
			<h1>게시글 등록 화면</h1>
		</div>
		<div>
			<form id="frm1" method="post" action="<c:url value='/board/free/write'/>">
				<input type="text" name="title" placeholder="제목"><br>
				<textarea name="content"></textarea><br>
				<input type="button" id="btnWrite" value="작성"><br>
				<input type="hidden" name="writer" value="tester"><br>
			</form>
		</div>
		<script>
			document.getElementById('btnWrite').addEventListener('click',function(){
				document.getElementById('frm1').submit();	
			});
		</script>
	</body>
</html>