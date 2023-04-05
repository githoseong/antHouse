<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
<script>
	function check() {
		let date = myForm.myDate.value;
		let title = myForm.title.value; 
		let content = myForm.content.value; 
		let ans = confirm("일정을 등록 하시겠습니까?");
		
		if(ans) {
			if(date.trim() == "") {
				alert("날짜를 선택해주세요.");
				return false;
			}
			else if(title.trim() == "") {
				alert("제목을 입력해주세요.");
			}
			else {
				myForm.submit();			
			}
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
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	<div id="section">
	<div id="title2">일정 등록</div>
		<form method="post" name="myForm">
			<div style="width:100%; height:100%; border:1px solid; background-color: lightgray; margin-top:50px;">
				<div id="calMain">
						<table class="table table-border">
							<tr>
								<td style="width:20%;" class="calTitle">날짜 선택</td>
								<td><input type="date" name="myDate" style="height:40px; font-size:20px;" /></td>
							</tr>
							<tr>
								<td class="calTitle">제목</td>
								<td style="width:80%;" ><input type="text" name="title" size="70" style="height:40px;" /></td>
							</tr>
							<tr>
								<td class="calTitle" style="padding-top:350px;">내용</td>
								<td ><textarea rows="35" cols="130" name="content"></textarea> </td>
							</tr>
						</table>
				</div>
			</div>
			<div id="btnn">
				<input type="button" value="등록하기" class="btn btn-secondary" onclick="check()"/>
				<input type="button" value="취소하기" class="btn btn-secondary" onclick="location.href='${ctp}/calendar/calendar'"/>
			</div>
		</form>
	</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>		
</div>	
</body>
</html>