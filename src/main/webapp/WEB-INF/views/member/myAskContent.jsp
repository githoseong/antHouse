<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<% pageContext.setAttribute("newLine", "\n"); %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>  
<script>
 function del(idx) {
	 let ans = confirm("정말 삭제 하시겠습니까?");
	 if(ans) {
		 location.href="${ctp}/member/myAskDel?idx="+idx;
	 }
	 
 }
</script>
</head>
<jsp:include page="/WEB-INF/views/include/style.jsp"/>
<style>
#section {
	margin:150px auto;
	width:70%;
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
#repl {
	text-align: center;
	background-color: rgb(241, 241, 241);
	margin:0px auto 100px;
	width:90%;
} 
#reTitle {
	font-size:30px;
	margin:50px auto 20px 100px;
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	<div id="section">
	<c:if test="${vo.part == '문의' }">
		<div id="title2" >- 문의 내용 -</div>
	</c:if>
	<c:if test="${vo.part == '신고' }">
		<div id="title2">- 신고 내용 -</div>
	</c:if>
		<div id="frame">
			<div id="main">
				<table class="table table-border">
					<tr style="height:70px;">
						<td style="text-align: center; font-size:25px;">제목</td>
						<td><input type="text" value="${vo.title}" readonly></td>
					</tr>
					<tr style="height:70px;">
						<td style="text-align: center; width:20%; font-size:25px;">작성자</td>
						<td><input type="text"  value="${vo.mid} " readonly ></td>
					</tr>
					<tr style="height:70px;">
						<td style="text-align: center; width:20%; font-size:25px;">작성일</td>
						<td><input type="text"  value="${vo.askDate} " readonly ></td>
					</tr>
					<tr>
						<td style="text-align: center; font-size:25px; ">문의 내용</td>
						<td ><textarea rows="30" cols="120" style="resize: none;"  readonly>${vo.content }</textarea> </td>
					</tr>
				</table>
				<div id="askBtn">
					<input type="button" value="삭제" class="btn btn-secondary" onclick="del(${vo.idx})">
					<input type="button" value="돌아가기" class="btn btn-secondary" onclick="location.href='${ctp}/member/myAsk'">
				</div>
			</div>
		</div>
<!-- --------------- 댓글------------ -->
<c:if test="${vo.answer == 'YES'}">
<div id="reTitle">답변</div>
<div id="repl" >
	<table class="table table-border">
		<tr style="background-color: rgb(220, 220, 220); font-weight: bold;">
			<td style="width:5%;">no</td>
			<td style="width:50%; text-align: left;">내용</td>
			<td style="width:10%;">작성자</td>
			<td style="width:15%;">답변일</td>
		</tr>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<td>${st.count}</td>
				<td style="text-align: left;">${fn:replace(vo.content,newLine,"</br>")}</td>
				<td>관리자</td>
				<td>${vo.answerDate}</td>
			</tr>
		</c:forEach>
	</table>
	</div>
</c:if>	
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>	
</div>
</body>
</html>