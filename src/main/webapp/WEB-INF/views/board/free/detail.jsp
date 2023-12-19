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
         <ul>
            <li>No.<c:out value="${free.seq } "/></li>
            <li>제목:<c:out value="${free.title } "/></li>
            <li>내용:<br>
            	<pre><c:out value="${free.content } "/>
            	</pre>
			</li>
            <li>작성자:<c:out value="${free.writer } "/></li>
            <li>작성일시:<c:out value="${free.write_date2 } "/></li>
            <li>첨부파일:<c:out value="${file.o_filename } "/></li>
         </ul>
      </div>
      <div style= "text-align:center;">      
      	<span style="margin:20px;">
			<img id="btnRec" src="<c:url value='/cdn/images/rec_cnt.png'/>"/>
      		<span id="spanRecCnt"><c:out value="${free.rec_cnt}"/></span>
      	</span>      	
      	<span style="margin:20px;">
			<img id="btnNRec" src="<c:url value='/cdn/images/nrec_cnt.png'/>"/>
      		<span id="spanNRecCnt"><c:out value="${free.nrec_cnt}"/></span> 
      	</span>      	
      </div>	  
      <div>
      	<input type="button" id="btnUpd" value="수정">
      	<input type="button" id="btnDel" value="삭제">
      </div>
      <hr>
      <div>
      	<input style="width:50%" type="text" id="repCont" placeholder="댓글 입력하세요">
      	<input type="button" id="btnRepWrite" value="작성">
      </div>    
      <div>
      	<ul id = "repArea"></ul>
      </div>
      
      
        
      <form id="frm1" action="<c:url value='/board/free/delete'/>" method="POST">
	  	<input type="hidden" id="seq" name="seq">
	  </form>
      <script src="<c:url value='/cdn/js/jquery-3.7.1.min.js'/>"></script>
      <script>
      	document.getElementById('btnUpd').addEventListener('click', function(){
      		location.href="<c:url value='/board/free/updateView?seq=${free.seq }'/>";
      	});
      	
      	document.getElementById('btnDel').addEventListener('click', function(){
      		if(confirm('정말로 삭제하시겟습니까?')){
      			document.getElementById('seq').value= '<c:out value="${free.seq }" />';
      			document.getElementById('frm1').submit();
      		}      		
      	});
      	
      	document.getElementById('btnRec').addEventListener('click', function(){
      		$.ajax({
	      	  method: "POST"
	      	  ,url: '<c:url value="/board/free/updateRec"/>'
	      	  ,data: { 
	      		  seq: '<c:out value="${free.seq}"/>'
	      		  ,recYN: 'Y'
	      	  }
	      	}).done(function( msg ) {
	      	    if( 'success'==msg.result ){
	      	    	$('#spanRecCnt').html(msg.data.rec_cnt);
	      	    	$('#spanNRecCnt').html(msg.data.nrec_cnt);	      	    	
	      	    } else if('fail'==msg.result){
	      	    	alert('작업을 처리하는 중 오류가 발생했습니다.')
	      	    }
	      	});
      	});
      	
      	document.getElementById('btnNRec').addEventListener('click', function(){
      		$.ajax({
	      	  method: "POST"
	      	  ,url: '<c:url value="/board/free/updateRec"/>'
	      	  ,data: { 
	      		  seq: '<c:out value="${free.seq}"/>'
	      		  ,recYN: 'N'
	      	  }
        	}).done(function( msg ) {
	      	    if( 'success'==msg.result ){
	      	    	$('#spanRecCnt').html(msg.data.rec_cnt);
	      	    	$('#spanNRecCnt').html(msg.data.nrec_cnt);	      	    	
	      	    } else if('fail'==msg.result) {
	      	    	alert('작업을 처리하는 중 오류가 발생했습니다.')
	      	    }
	      	});
      	});

      	document.getElementById('btnRepWrite').addEventListener('click', function(){
      		$.ajax({
	      	  method: "POST"
	      	  ,url: '<c:url value="/board/free/addRep"/>'
	      	  ,data: { 
	      		  f_seq: '<c:out value="${free.seq}"/>'
	      		  ,content: $('#repCont').val()
	      	  }
        	}).done(function( msg ) {
				if(msg.result=='success'){
					$('#repCont').val('');
					$('#repArea').html('');
					let repHtml = '';					
					$.each(msg.data, function(i,reply){
						repHtml +='<li style="color:gray">(' + reply.write_date + ') | '+reply.content + '</li>';
					});
					$('#repArea').append(repHtml);
				}else {
	      	    	alert('작업을 처리하는 중 오류가 발생했습니다.')
				}
	      	});
      	});
      	
      	$(function(){
      		$.ajax({
  	      	  method: "POST"
  	      	  ,url: '<c:url value="/board/free/getRep"/>'
  	      	  ,data: { 
  	      		  f_seq: '<c:out value="${free.seq}"/>'
  	      	  }
          	}).done(function( msg ) {
  				if(msg.result=='success'){
  					$('#repCont').val('');
  					$('#repArea').html('');
  					let repHtml = '';					
  					$.each(msg.data, function(i,reply){
  						repHtml +='<li style="color:gray">(' + reply.write_date + ') | '+reply.content + '</li>';
  					});
  					$('#repArea').append(repHtml);
  				}else {
  	      	    	alert('작업을 처리하는 중 오류가 발생했습니다.')
  				}
  	      	});   		
      	})
      	
      </script>
   </body>
</html>