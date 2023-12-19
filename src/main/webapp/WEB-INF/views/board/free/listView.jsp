<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
   <head>
      <meta charset="UTF-8">
      <title>게시판</title>
      <link rel="stylesheet" href="/cdn/css/jquery-ui.min.css">
      <style>
      	.spanPage:hover{
      		cursor:pointer;
      	}
      </style>
   </head>
   <body>
      <div>
         <h1>자유게시판</h1>
      </div>
      <div>
      	<input type="text" id="fCalendar" style="width:100px" value="<c:out value="${rp.fWrite}"/>" readonly>
      	 ~ 
		<input type="text" id="tCalendar" style="width:100px" value="<c:out value="${rp.tWrite}"/>" readonly>
      	      
      </div>      
      <div>
      	<select name= "searchOption">
      		<option value = "title">제목</option>
      		<option value = "content">내용</option>
      	</select>
      	<input autofocus="true" type="text" id="titleSearch" value="<c:out value="${rp.title }"/>" placeholder="제목을 입력하세요" style="width:30%">
      	<input type="button" id="btnSearch" value="조회">
      </div>
      
      <div>
         <ul>
            <c:forEach var="free" items="${list }">
               <li>
                  <c:out value="${free.seq}"/> | 
                  <a href="<c:url value='/board/free/detail?seq=${free.seq }'/>">
                  	<c:out value="${free.title}"/>
                  </a>                   
                  |<c:out value="${free.writer }"/> | 
                  <c:out value="${free.write_date }"/>
               </li>
            </c:forEach>
         </ul>
      </div>
            <input type="button" value="글쓰기" style="text-align:right" onclick="location.href='/board/free/writeView'">
      <div style="text-align:center;">
		<c:forEach var="page" begin="1" end="${totalPage }">
			<c:if test="${page == rp.page}">
				<span style="margin:10px; font-weight:bold" class="spanPage" data-page="${page}">[${page }]</span>				
			</c:if>
			<c:if test="${page != rp.page}">
				<span style="margin:10px;" class="spanPage" data-page="${page}">[${page }]</span>				
			</c:if>
		</c:forEach>
      </div>      
      <form id="frm1" action="<c:url value='/board/free/listView'/>" method="post">
      	<input type="hidden" name="page" id="page">
      	<input type="hidden" name="title" id="title">
      	<input type="hidden" name="content" id="content">
      	<input type="hidden" name="fWrite" id="fWrite">
      	<input type="hidden" name="tWrite" id="tWrite">
      </form>
      <script src="<c:url value='/cdn/js/jquery-3.7.1.min.js'/>"></script>
      <script src="<c:url value='/cdn/js/jquery-ui.min.js'/>"></script>
      <script>
      	$('.spanPage').on('click',function(){
      		$('#page').val($(this).data('page'));
      		$('#title').val($('#titleSearch').val());
      		$('#frm1').submit();
      	});
      
      	$('#btnSearch').on('click', function(){
      		if($('select[name="searchOption"]').val()=='title'){
      			$('#title').val($('#titleSearch').val());
      		}
      		else if($('select[name="searchOption"]').val()=='content'){
				$('#content').val($('#titleSearch').val());
			}
      		$('#fWrite').val($('#fCalendar').val());
      		$('#tWrite').val($('#tCalendar').val());
			$('#frm1').submit();
      	});
      	
      	$(document).ready(function() {
      	    $(document).keypress(function(e) {
      	        if(e.which == 13) { // 엔터키의 키 코드는 13입니다.
      	        	if($('select[name="searchOption"]').val()=='title'){
      	      			$('#title').val($('#titleSearch').val());
      	      		}
      	      		else if($('select[name="searchOption"]').val()=='content'){
      					$('#content').val($('#titleSearch').val());
      				}
      	      		$('#fWrite').val($('#fCalendar').val());
      	      		$('#tWrite').val($('#tCalendar').val());
      				$('#frm1').submit();
      	        }
      	    });
      	});
      	
      	$(function(){
      		$('#fCalendar').datepicker({
      			dateFormat:'yymmdd'
      		});
      		$('#tCalendar').datepicker({
      			dateFormat:'yymmdd'
      		});
      	});
      </script>      
   </body>
</html>