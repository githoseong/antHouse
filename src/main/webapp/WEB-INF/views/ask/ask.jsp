<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>ask</title>
<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
<script>

	function ask() {
		if($("#askSel").val() == '신고') {
			$("#main").css("border-right","3px solid rgb(255, 37, 37)");
		}
		else {
			$("#main").css("border-right","3px solid rgb(0, 97, 207)");
		}
	}
	function check() {
		let title = myForm.title.value;
		let mid = myForm.mid.value;
		let content = myForm.content.value;
		let ans = confirm("관리자에게 문의 및 신고를 하시겠습니까?");
		if(ans) {
			if(title.trim() == "") {
				alert("문의 제목을 입력해주세요.");
			}
			else if(content.trim() == "") {
				alert("문의 내용을 입력해주세요.")
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
	margin:150px auto auto;
	width:70%;
	height:1500px;
}
#title2 {
	height:100px;
	font-size:60px;
	font-weight: bold;
	text-align: center;
	font-family: 'Song Myung', serif;
}
#frame {
	margin:60px auto 0px;
	border:1px solid;
	width:90%;
	height:1130px;
	border-radius: 10px;
	box-shadow: 1px 1px 10px 1px;
}
#main {
	border:1px solid lightgray;
	width:90%;
	height:88%;
	margin:50px auto;
	border-radius: 10px;
	background-color:rgb(240, 240, 240);
	border-right:3px solid rgb(0, 97, 207); 
}
input {
	width:500px;
	height:45px;
}
.btn {
	width: 400px;
	height:55px;
	font-size:22px;
}
#askBtn {
	text-align: center;
	margin-top:40px;
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	<div id="section">
	<div id="title2">문의 및 신고</div>
		<div id="frame">
			<div id="main">
				<form method="post" name="myForm">
					<table class="table table-border">
						<tr>
							<td colspan="2" >
								<select style="width:200px; height:40px; text-align: center; font-size:20px;" onchange="ask()" id="askSel" name="part">
									<option>문의</option>
									<option>신고</option>
								</select>
							</td>
						</tr>
						<tr style="height:70px;">
							<td style="text-align: center; font-size:25px;">제목</td>
							<td><input type="text" name="title"></td>
						</tr>
						<tr style="height:70px;">
							<td style="text-align: center; width:20%; font-size:25px;">작성자</td>
							<td><input type="text" name="mid" value="${sMid}" readonly></td>
						</tr>
						<tr >
							<td style="text-align: center; font-size:25px; ">문의 내용</td>
							<td ><textarea rows="30" cols="120" style="resize: none;" name="content" ></textarea> </td>
						</tr>
					</table>
					<div id="askBtn">
						<input type="button" value="보내기" class="btn btn-secondary" onclick="check()">
						<input type="button" value="취소하기" class="btn btn-secondary" onclick="history.back()">
					</div>
					<input type="hidden" value="${sName}" name="name"/>
				</form>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>