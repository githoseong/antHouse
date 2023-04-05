<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
  <script>
  	function calDelete() {
  		let ans = confirm("정말 삭제 하시겠습니까?");
  		if(ans) {
  			location.href="${ctp}/calendar/calDelete?idx="+${vo.idx};
  		}
  	}
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
	width:90%;
	margin:50px auto;
	background-color: white;
	border:1px solid gray;
	
	
}
.calTitle {
	border-right:1px solid gray;
	text-align: center;
	font-size:25px; 
}
#choCal {
	background-color: white;
	width:50%;
	font-size:25px;
}
#btnn {
	margin-top:10px;
	text-align: right;
}
.btn {
	width:120px;
	height:50px;
	font-size:20px;
	margin-right:10px;
}
input , textarea {
	border:none;
	font-size:18px;
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	<div id="section">
		<div id="title2">${vo.myDate}</div>
			<div style="width:100%; height:100%; border:1px solid; background-color: lightgray; margin-top:50px;">
				<div id="calMain">
						<table class="table table-border">
							<tr>
								<td class="calTitle">제목</td>
								<td style="width:80%;" ><input type="text" name="title" size="70" style="height:40px;" readonly value="${vo.title}"/></td>
							</tr>
							<tr>
								<td class="calTitle">작성자</td>
								<td style="width:80%;" ><input type="text" name="name" size="70" style="height:40px;" readonly value="${vo.name}"/></td>
							</tr>
							<tr>
								<td class="calTitle">작성일</td>
								<td style="width:80%;" ><input type="text" name="wDate" size="70" style="height:40px;" readonly value="${vo.WDate}"/></td>
							</tr>
							<tr>
								<td class="calTitle" style="padding-top:350px;">내용</td>
								<td ><textarea rows="35" cols="130" name="content" readonly>${vo.content}</textarea> </td>
							</tr>
						</table>
						<input type="hidden" name="idx" value="${vo.idx}"/>
				</div>
			</div>
			<div id="btnn">
				<c:if test="${sMid == vo.mid || sMid == 'admin'}">
					<input type="button" value="수정" class="btn btn-secondary" onclick="location.href='${ctp}/calendar/calUpdate?flag=${flag}&idx=${vo.idx}';"/>
					<input type="button" value="삭제" class="btn btn-secondary" onclick="calDelete()"/>
				</c:if>
				<c:if test="${flag == 1 }">
					<input type="button" value="돌아가기" class="btn btn-secondary" onclick="location.href='${ctp}/member/myCalendar'"/>
				</c:if>
				<c:if test="${flag != 1 }">
					<input type="button" value="돌아가기" class="btn btn-secondary" onclick="location.href='${ctp}/calendar/calendar'"/>
				</c:if>
			</div>
		</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>			
</div>		
</body>
</html>