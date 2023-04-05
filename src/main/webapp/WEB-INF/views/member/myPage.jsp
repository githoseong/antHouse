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
#oneFrame {
	border:1px solid ;
	height:300px;
	margin:70px auto auto;
}
#oneFrame:hover {
	box-shadow: 1px 1px 5px 1px ;
	cursor: default;
}
#oneFrame2 {
	border-right:1px solid ;
	width:25%;
	height:100%;
	float:left;
}
#oneFrame22 {
	border:1px solid ;
	height:80%;
	width:70%;
	margin: 25px auto;
}
#oneFrame3 {
	width:75%;
	float:left;
	height:100%;
}
#oneFrame33 {
	height:15%;
	background-color: lightgray;
	text-align: center;
	font-size: 20px;
	padding:5px;
}
#oneFrame333 {
	width:85%;
	height:70%;
	margin: 20px auto;
}
.oneFrame33 {
	width:50%;
	height:100%;
	float:left;
}
#twoFrame {
	border:1px solid lightgray;
	height:500px;
	margin-top: 200px; 
}
.twoFrame {
	border:1px solid lightgray;
	width:25%;
	height:50%;
	float:left;
	background-color: rgb(248, 248, 248);
	text-align: center;
}
.twoFrame:hover {
	border:1px solid black;
	cursor: pointer;
}
.imo {
	font-size:60px;
	padding-top:40px;
}
.infor {
	 font-weight: bold;
	 font-size:20px; 
	 margin:10px auto;
}
a:hover {
	color:black;
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	<div id="section">
	<div id="title2">My Page</div>
		<div id="oneFrame">
			<div id="oneFrame2">
				<div id="oneFrame22"><img src="${ctp}/member/${vo.photo}" style="width:100%; height:100%;"/></div>
			</div>
			<div id="oneFrame3">
				<div id="oneFrame33">개미굴 <strong>${vo.name}</strong> 님의 정보</div>
				<div id="oneFrame333">
					<div class="oneFrame33">
						<table class="table table-hover">
							<tr>
								<td style="width:30%">아이디</td>
								<td>${vo.mid}</td>
							</tr>
							<tr>
								<td>이름</td>
								<td>${vo.name}</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td>${vo.mail}</td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td>${vo.tel}</td>
							</tr>
						</table>
					</div>
					<div class="oneFrame33">
						<table class="table table-hover">
							<tr>
								<td style="width:30%">가입 날짜</td>
								<td>${fn:substring(vo.startDate,0,10)}</td>
							</tr>
							<tr>
								<td>총 접속일</td>
								<td>${vo.totalCnt} 일</td>
							</tr>
							<tr style="height:100px; font-size:30px;">
								<td><div style="padding-top:12px;">등급</div></td>
								<td>
									<div style="padding-top:12px;">
										<c:if test="${vo.level == 1}">
											<i class="fa-solid fa-crown" style="color:brown; font-size:40px;"></i> 준회원
										</c:if>
										<c:if test="${vo.level == 2}">
											<i class="fa-solid fa-crown" style="color:silver"></i> 정회원
										</c:if>
										<c:if test="${vo.level == 3}">
											<i class="fa-solid fa-crown" style="color:gold"></i> 우수회원
										</c:if>
										<c:if test="${vo.level == 0}">
											<i class="fa-solid fa-star" style="color:red"></i> 관리자
										</c:if>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div id="twoFrame">
			<a href="${ctp}/member/myPageUpdate"><div class="twoFrame"><i class="fa-solid fa-user imo"></i><div class="infor">정보 수정</div>이메일, 비밀번호 등<br/> 회원 정보를 수정합니다.</div></a>
			<a href="${ctp}/member/myAsk"><div class="twoFrame"><i class="fa-regular fa-envelope imo"></i><div class="infor">문의 내역</div>관리자에게 보낸<br/> 1:1문의 내역을 확인합니다.</div></a>
			<div class="twoFrame"><i class="fa-solid fa-heart imo"></i><div class="infor">좋아요 글</div>자신이 좋아요를 누른<br/> 게시글을 확인합니다.</div>
			<div class="twoFrame"><i class="fa-regular fa-image imo"></i><div class="infor">사진첩</div>이미지를 업로드 하여<br/> 나만의 사진첩을 만듭니다.</div>
			<a href="${ctp}/member/myCalendar"><div class="twoFrame"><i class="fa-regular fa-calendar-days imo"></i><div class="infor">나의 일정</div>개미굴 캘린더에<br/> 자신이 올린 일정을 확인합니다.</div></a>
			<div class="twoFrame"></div>
			<div class="twoFrame"></div>
			<div class="twoFrame"></div>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</div>
</body>
</html>