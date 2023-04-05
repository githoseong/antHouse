<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
<script>

	AOS.init({
	      easing: 'ease-out-back',
	      duration: 800
	  });
</script>

</head>
<jsp:include page="/WEB-INF/views/include/style.jsp"/>
<style>
#section {
	margin:150px auto auto;
	width:70%;
	height:1500px;
}
#mainPhoto {
	text-align:center;
}
#todayPhoto {
	width:90%;
	margin:30px auto;
	height:600px;
}
#main {
}
#board {
	float:left;
	width:60%;
	height:500px;
}
#bestPhoto {	
	border:1px solid;
	float:left;
	width:39%;
	height:250px;
}
#cal {
	border:1px solid;
	float:left;
	width:39%;
	height:250px;
} 
#boardTitle {
	height:15%;
	text-align: center;
	font-size:30px;
	padding-top:10px;
	border:1px solid lightgray;
}
#boardTable {
	text-align: center;
}
tr {
	border:1px solid lightgray;
}
#boardGo {
	position: relative;
	left:350px;
	top:20px;
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	<div id="section">
		<div id="mainPhoto">
			<h1>오늘의 사진</h1>
			<div id="todayPhoto" class="carousel slide" data-ride="carousel">
		        <!-- Indicators -->
		        <ul class="carousel-indicators" >
		        <li data-target="#todayPhoto" data-slide-to="0" class="active"></li>
		        <li data-target="#todayPhoto" data-slide-to="1"></li>
		        <li data-target="#todayPhoto" data-slide-to="2"></li>
		        </ul>
		        <!-- The slideshow -->
		        <div class="carousel-inner" style="height:100%">
			        <div class="carousel-item active" style="height:100%">
			            <a href="#"><img src="${ctp}/etc/일.jpg" width="100%" height="100%"></a>
			        </div>
			        <div class="carousel-item" style="height:100%">
			            <a href="#"><img src="${ctp}/etc/이.jpg"  width="100%" height="100%" ></a>
			        </div>
			        <div class="carousel-item" style="height:100%">
			            <a href="#"><img src="${ctp}/etc/삼.jpg"  width="100%" height="100%" ></a>
			        </div>
		        </div>
		        <!-- Left and right controls -->
		        <a class="carousel-control-prev" href="#todayPhoto" data-slide="prev">
		        	<span class="carousel-control-prev-icon"></span>
		        </a>
		        <a class="carousel-control-next" href="#todayPhoto" data-slide="next">
		        	<span class="carousel-control-next-icon"></span>
		        </a>
			</div>
		</div>
		<div id="main">
			<div id="board">
				<div id="boardTitle">
					게시판<span id="boardGo"><a href="${ctp}/board/board"><i class="fa-solid fa-arrow-right"></i></a></span>
				</div>
				<div id="boardTable">
					<table style="width:100%; ">
						<tr style="background-color:rgb(238, 231, 226); height:50px;font-weight: bold; ">
							<td style="width:10%; ">no</td>
							<td style="width:45%">제목</td>
							<td style="width:10%">작성자</td>
							<td style="width:15%">날짜</td>
							<td style="width:10%">조회수</td>
							<td style="width:10%">추천</td>
						</tr>	
						<c:forEach var="vo" items="${vos}" varStatus="st">
							<tr style="height:46px;">
								<td>${st.count}</td>
								<td style="text-align: left"><a href="${ctp}/board/content?idx=${vo.idx}">${vo.title}</a></td>
								<td>${vo.name}</td>
								<td>${fn:substring(vo.writeDate,5,16)}</td>
								<td>${vo.readNum}</td>
								<td>👍 <span style="color:blue;font-weight:bold">${vo.good}</span> <span style="color:red;font-weight:bold">👎 ${vo.bad}</span></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div id="cal">
				일정
			</div>
			<div id="bestPhoto">
				이 달의 인물
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>	
</div>
</body>
</html>