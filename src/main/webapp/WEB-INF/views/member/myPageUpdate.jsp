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
function check() {
	let mid = myForm.mid.value;
	let name = myForm.name.value;
	let pwd = myForm.pwd.value;
	let pwd2 = myForm.pwd2.value;
	let mail = myForm.mail.value;
	let mail2 = myForm.mail2.value;
	let tel = myForm.tel.value;
	let tel2 = myForm.tel2.value;
	let tel3 = myForm.tel3.value;
	let file = myForm.file1.value;
	
	let mail3 = mail + "@" + mail2;
	let tel4 = tel + "-" + tel2 + "-" +tel3;
	
	
	
	 const regex1 = /[^A-Za-z0-9]/g;
     const regex2 = /^.{4,}$/;
     const regex3 = /[^\s]/;
     const regex4 = /[^가-힣a-zA-z]/g;
	
    if(mid.trim() == "") {
    	alert("아이디를 입력해주세요.");
		return false;
    } 
	else if(regex1.test(mid)) {
		alert("아이디는 공백 없이 영문 또는 숫자로 입력해주세요.");
		return false;
	}
	else if(regex4.test(name)) {
		alert("이름은 공백 없이 한글 또는 영문으로 입력해주세요.");
		return false;
	}
	else if(!regex3.test(pwd)) {
		alert("비밀번호를 입력해주세요.");
		return false;
	}
	else if(!regex3.test(pwd2)) {
		alert("비밀번호 확인을 입력해주세요.");
		return false;
	}
	else if(!regex2.test(pwd)) {
		alert("비밀번호는 4자리 이상 입력해주세요.");
		return false;
	}
	else if(pwd != pwd2) {
		alert("입력한 비밀번호가 서로 다릅니다.");
		return false;
	}
	else if(!regex3.test(mail) || !regex3.test(mail2)) {
		alert("이메일을 입력해주세요.");
		return false;
	}
	else if(!regex3.test(tel) || !regex3.test(tel2) || !regex3.test(tel3)) {
		alert("전화번호를 입력해주세요.");
		return false;
	}
	else if(file != "") {
		let file1 = file.toUpperCase();
		let file2 = file1.substring(file1.lastIndexOf(".")+1);
		if(file2 != "JPG" && file2 != "PNG" && file2 != "GIF" && file2 != "JPEG" ) {
			alert("사진 형식의 파일만 업로드 가능합니다.")
		}
		else {
			myForm.mail.value = mail3;
			myForm.tel.value = tel4;
			myForm.submit();
		}
	}
	else {
		myForm.mail.value = mail3;
		myForm.tel.value = tel4;
		myForm.submit();
	}
	
}


function onMail() {
	let goMail = document.getElementById("goMail").value
	document.getElementById("mail2").value= goMail;
}

</script>
</head>
<jsp:include page="/WEB-INF/views/include/style.jsp"/>
<style>
#section {
	margin:150px auto auto;
	width:70%;
}
#title2 {
	height:100px;
	font-size:60px;
	font-weight: bold;
	text-align: center;
	font-family: 'Song Myung', serif;
}
.txt {
	margin-top:10px;
}
.btn {
	background-color: lightGray;
	width:30%;
}
.btn:hover {
	opacity: 0.9;
}
#frame {
	margin:100px auto 200px;
	width:60%;
	background-color: white;
	border:1px solid;
	height:500px;
	line-height: 30px;
	padding:20px;
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	<div id="section">
	<div id="title2">회원 정보 수정</div>
		<div id="frame">
			<form method="post" name="myForm" id="myForm" enctype="multipart/form-data">
				<table>
					<tr >
						<td >아이디</td>				
						<td ><input type="text" name="mid" size="30" class="txt" maxlength="15" readonly value="${vo.mid}"></td>				
					</tr>				
					<tr >
						<td >이름</td>				
						<td ><input type="text" name="name" size="30" class="txt" maxlength="10" value="${vo.name}"></td>				
					</tr>				
					<tr >
						<td>비밀번호</td>				
						<td><input type="password" name="pwd" size="30" class="txt" maxlength="18" value="${vo.pwd}"></td>				
					</tr>				
					<tr >
						<td>비밀번호 확인</td>				
						<td><input type="password" name="pwd2" size="30" class="txt" maxlength="18" value="${vo.pwd}"></td>				
					</tr>				
					<tr >
						<c:set var="mail" value="${fn:split(vo.mail,'@')}"/>
						<td>이메일</td>				
						<td><input type="text" name="mail" size="30" class="txt" maxlength="18" value="${mail[0]}" > @ <input type="text" name="mail2" id="mail2" size="30" class="txt" maxlength="18" value="${mail[1]}">
							<select onchange="onMail()" name="goMail" id="goMail">
								<option value="선택">선택해주세요</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="gmail.com">gmail.com</option>
							</select>
						 </td>				
					</tr>				
					<tr >
						<c:set var="tel" value="${fn:split(vo.tel,'-')}"/>
						<td>전화번호</td>				
						<td><input type="text" name="tel" size="6" class="txt" maxlength="3" value="${tel[0]}"> - <input type="text" name="tel2" size="12" class="txt" maxlength="6" value="${tel[1]}"> - <input type="text" name="tel3" size="12" class="txt" maxlength="6" value="${tel[2]}"></td>				
					</tr>				
					<tr>
						<td>회원 사진</td>
						<td>
							<img src="${ctp}/member/${vo.photo}" style="width:120px; height:80px;"/>
							<input type="file" name="file1"/>
	                    </td>
					</tr>
				</table>
					<div style="margin:40px 80px auto; width:100%; ">
						<input type="button" value="수정완료" class="btn" onclick="check()"/>
						<input type="button" value="돌아가기" class="btn" onclick="location.href='${ctp}/member/myPage'"/>
					</div>
					<input type="hidden" name="nextFile">
					<input type="hidden" name="photo" value="${vo.photo}">
			</form>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</div>
</body>
</html>