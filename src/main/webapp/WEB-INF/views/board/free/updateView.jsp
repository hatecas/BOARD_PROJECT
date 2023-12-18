<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
   <head>
      <meta charset="UTF-8">
      <title>게시판</title>
   </head>
   <body>
      <div>
         <h1>자유게시판</h1>
      </div>
      <div>
      	<form id=frm1 action ="<c:url value='/board/free/update'/>" method="post">
      		<input type="hidden" name="seq" value="<c:out value="${free.seq } "/>">
	         <ul>
	            <li>No.<c:out value="${free.seq } "/></li>
	            <li>제목:<input type="text" name="title" value="<c:out value="${free.title }"/>"></li>
	            <li>내용:<br>
	            	<pre><textarea name="content"><c:out value="${free.content } "/></textarea>
	            	</pre>
				</li>
	            <li>작성자:<c:out value="${free.writer } "/></li>
	            <li>수정일시:<c:out value="${free.write_date2 } "/></li>
	            <li>추천수:<c:out value="${free.rec_cnt } "/></li>
	            <li>비추천수:<c:out value="${free.nrec_cnt } "/></li>
	         </ul>
         </form>
      </div>
      <div>
      	<input type="button" id="btnUpd" value="수정완료">
      </div>    
      <script>
      	document.getElementById('btnUpd').addEventListener('click', function(){
      		if(confirm('정말로 수정하시겟습니까?')){
      			document.getElementById('frm1').submit();
      		}      		
      	});
      </script>
   </body>
</html>