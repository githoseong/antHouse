<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
</head>
<jsp:include page="/WEB-INF/views/include/style.jsp"/>
<style>
#section {
	margin:150px auto 400px;
	width:70%;
}
#subTitle {
	font-size:70px;
	text-align:center;
	margin:10px auto 50px;
	font-family: 'Song Myung', serif;
}
.input {
	float:left;
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	<div id="section">
	<div id="subTitle">출석</div>
		<div>
			<table class="table table-border">
				<tr>
					<td>no</td>
					<td>내용</td>
					<td>이름</td>
					<td>날짜</td>
				</tr>
			</table>
		</div>
			글쓰기
		<form name="myForm" method="post">
			<div>
				<div class="input">
					<textarea rows="5" cols="30" name="content">
						
					</textarea>
				</div>
				<div  class="input">
					<input type="button" value="출첵하기" onclick="check()"/>			
				</div>
			</div>
		</form>
	</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>		
</div>
</body>
</html>