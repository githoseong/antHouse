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
	function log() {
		let mid = myForm.mid.value;
		let pwd = myForm.pwd.value;
		
		if(mid == "" ) {
			alert("아이디를 입력해주세요");
			return false;
		}
		else if(pwd == "") {
			alert("비밀번호를 입력해주세요");
			return false;
		}
		else {
			myForm.submit();
		}
	}
	function ent() {
        if(window.event.keyCode == 13) {
            log();
        }
    }
</script>
</head>
<style>
	body {
	background-color: rgb(252, 252, 252);
	}
	#container {
		width:20%;
		margin:80px auto;
		padding-left:20px;
	}
	#logo {
		margin-left: 30px;
	}
	#log {
		font-family: 'Song Myung', serif;
		font-size:50px;
		margin: 20px auto; 
		width:50%;
	}
	#section {
		font-size:20px;
	}
	.btn {
		background-color: lightGray;
		width:30%;
	}
	.btn:hover {
		opacity: 0.9;
	}
</style>
<body>
<div id="container">
	<div id="title">
		<div id="logo"><a href="${ctp}/member/main2"><img src="${ctp}/etc/개미.jpg"/></a></div>	
		<div id="log">로그인</div>
	</div>
	<div id="section">
		<form method="post"  name="myForm">
			<table>
				<tr>
					<td >아이디</td>				
					<td ><input type="text" name="mid" value="${mid}" ></td>	
				</tr>
				<tr>
					<td colspan="2" style="font-size:15px; margin:0px;"><input type="checkbox" name="idCheck"  checked /> 아이디 기억하기 </td>
				</tr>				
				<tr >
					<td>비밀번호</td>				
					<td><input type="password" name="pwd" onkeyup="ent()"></td>				
				</tr>				
			</table>
			<div style="margin:30px auto; width:100%; ">
				<input type="button" value="로그인" class="btn" onclick="log()"/>
				<input type="button" value="회원가입" class="btn" onclick="location.href='${ctp}/member/signup'"/>
				<input type="button" value="돌아가기" class="btn" onclick="location.href='${ctp}/member/main2'"/>
			</div>
		</form>
	</div>

</div>
</body>
</html>