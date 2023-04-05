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
	let cnt = 0;
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
		
        if(!regex3.test(mid)) {
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
			if(cnt == 0) {
				alert("아이디 중복 확인을 해주세요.");
			}
			else {
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
		}
		else {
			if(cnt == 0) {
				alert("아이디 중복 확인을 해주세요.");
			}
			else {
				myForm.mail.value = mail3;
				myForm.tel.value = tel4;
				myForm.submit();
			}
		}
		
	}
	
	function idck1() {
		let mid = myForm.mid.value;
		const regex1 = /[^A-Za-z0-9]/g;
		$.ajax({
			type : "post",
			url  : "${ctp}/member/signupIdCheck",
			data :{mid : mid},
			
			success: function(data) {
				if(data == "1") {
					alert("중복된 아이디가 있습니다.");
				}
				else {
					if(mid == "") {
						alert("아이디를 입력해주세요.");
					}
					else if(regex1.test(mid)) {
						alert("아이디는 공백 없이 영문 또는 숫자로 입력해주세요.");
					}
					else {
						alert("사용할 수 있는 아이디입니다.");
						cnt = 1;
					}
				}
			},
			error : function() {
				alert("오류");
			}
		})
		
		
	}
	
	function onMail() {
		let goMail = document.getElementById("goMail").value
		document.getElementById("mail2").value= goMail;
	}
	
	function fChange() {
        document.getElementById('fileText').value = document.getElementById('fileInput').value;
    }
</script>
</head>
<style>
	body {
	background-color: rgb(252, 252, 252);
	}
	#container {
		width:50%;
		margin:80px auto;
	}
	#logo {
		text-align:center;
	}
	#log {
		font-family: 'Song Myung', serif;
		font-size:50px;
		text-align: center;
		margin:20px auto;
	}
	#section {
		font-size:20px;
		margin-left:200px;
		width:75%;
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
	#idBtn {
		background-color: lightGray;
		font-size:15px;
		border: 1px solid gray;
		margin-left:10px;
	}
	#idBtn:hover {
		opacity: 0.9;
	}
	#fileText {
        float:left;
        
    }
    #fileInput {
        position: absolute;
        left: 1000px;
        z-index: 2;
        opacity: 0;
    }
    #fileInput2 {
        position: absolute;
        left: 1000px;
        z-index: 1;
    }
</style>
<body>
<div id="container">
	<div id="title">
		<div id="logo"><a href="${ctp}/member/main2"><img src="${ctp}/etc/개미.jpg"/></a></div>	
		<div id="log">회원가입</div>
	</div>
	<div id="section">
		<form method="post" name="myForm" id="myForm" enctype="multipart/form-data">
			<table>
				<tr >
					<td >아이디</td>				
					<td ><input type="text" name="mid" size="15" class="txt" ><input type="button" name="idck" value="중복확인" id="idBtn" onclick="idck1()" maxlength="15"></td>				
				</tr>				
				<tr >
					<td >이름</td>				
					<td ><input type="text" name="name" size="15" class="txt" ></td>				
				</tr>				
				<tr >
					<td>비밀번호</td>				
					<td><input type="password" name="pwd" size="15" class="txt" maxlength="18"></td>				
				</tr>				
				<tr >
					<td>비밀번호 확인</td>				
					<td><input type="password" name="pwd2" size="15" class="txt" maxlength="18"></td>				
				</tr>				
				<tr >
					<td>이메일</td>				
					<td><input type="text" name="mail" size="15" class="txt" maxlength="18">@<input type="text" name="mail2" id="mail2" size="15" class="txt" maxlength="18">
						<select onchange="onMail()" name="goMail" id="goMail">
							<option value="선택">선택해주세요</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
						</select>
					 </td>				
				</tr>				
				<tr >
					<td>전화번호</td>				
					<td><input type="text" name="tel" size="3" class="txt" maxlength="3"> - <input type="text" name="tel2" size="6" class="txt" maxlength="6"> - <input type="text" name="tel3" size="6" class="txt" maxlength="6"></td>				
				</tr>				
				<tr>
					<td>회원 사진</td>
					<td>
						<input type="text" readonly id="fileText" size="15" class="txt">
	                    <input type="button" id="fileInput2" value="파일검색" class="txt">
	                    <input type="file" id="fileInput" onchange="fChange()" name="file1" class="txt">
                    </td>
				</tr>
			</table>
				<div style="margin:40px 80px auto; width:100%; ">
					<input type="button" value="가입하기" class="btn" onclick="check()"/>
					<input type="button" value="돌아가기" class="btn" onclick="location.href='${ctp}/member/login'"/>
				</div>
				<input type="hidden" name="nextFile">
		</form>
	</div>
</div>
</body>
</html>