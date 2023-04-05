<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
<script>
	$(function(){
		let today = new Date();
		let month = today.getMonth()+1;
		let calTitle = $('#calTitle').html();
		$('#calTitle').html(month);
		$('#leftdiv').on("click",function(){
			if(month > 1 ) {
				$('#calTitle').html(--month) ;
			}
		});
		
		$('#rightdiv').on("click",function(){
			if(month < 12) {
				$('#calTitle').html(++month) ;
			}
		});
		
		
	});
</script>
</head>
<jsp:include page="/WEB-INF/views/include/style.jsp"/>
<style>
#section {
	margin:150px auto 400px;
	width:70%;
}
#title2 {
	height:100px;
	font-size:60px;
	font-weight: bold;
	text-align: center;
	font-family: 'Song Myung', serif;
}
#calMain {
	width:100%;
	height:1000px;
	border:1px solid;
	margin-top:100px;
}
#calTitle {
	height:100%;
	text-align: center;
	font-size:60px;
	font-weight: bold;
	float:left;
	width:88%;
}
#leftdiv {
	float:left;
	width:6%;
	font-size:60px;
}
#rightdiv {
	float:left;
	width:6%;
	font-size:60px;
	text-align: right;
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	<div id="section">
	<div id="title2">일정표</div>
		<div id="calMain">
			<div>
				<div id="leftdiv"><i class="fa-solid fa-chevron-left"></i> </div>
						<div id="calTitle"></div>
				<div id="rightdiv"><i class="fa-solid fa-chevron-right"></i> </div>
			</div>
			<div>
				
			</div>
			
		</div>
	</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>	
</div>
</body>
</html>