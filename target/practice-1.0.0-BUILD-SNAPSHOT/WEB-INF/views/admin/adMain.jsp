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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
$(function(){
	$("#two2").on("click",function() {
		$("#memtext").css('display', 'none');
		$("#memtext2").css('display','block');
		$("#memtext3").css('display','none');
		$("#two2").css('box-shadow','3px 3px 3px black');
		$("#three3").css('box-shadow','none');
		$("#one1").css('box-shadow','none');
	});
	$("#three3").on("click",function() {
		$("#memtext").css('display', 'none');
		$("#memtext2").css('display','none');
		$("#memtext3").css('display','block');
		$("#two2").css('box-shadow','none');
		$("#three3").css('box-shadow','3px 3px 3px black');
		$("#one1").css('box-shadow','none');
	});
	$("#one1").on("click",function() {
		$("#memtext").css('display', 'block');
		$("#memtext2").css('display','none');
		$("#memtext3").css('display','none');
		$("#two2").css('box-shadow','none');
		$("#three3").css('box-shadow','none');
		$("#one1").css('box-shadow','3px 3px 3px black');
	});
});	


google.charts.load('current', {'packages':['bar']});
google.charts.setOnLoadCallback(drawChart);

var count = 0;
var data;
var chart;
var options;

function drawChart() {
data = new google.visualization.DataTable();
data.addColumn('string', 'Dialogue');
data.addColumn('number', '전체회원');
data.addColumn('number', '1등회원');
data.addRow(['총방문수', ${vo4.cnt}, ${vo.totalCnt}]); 
data.addRow(['오늘방문수', ${vo5.cnt}, ${vo6.todayCnt}]); 
data.addRow(['1주일이내', ${vo7.cnt}, 1]); 

  options = {
    chart: {
      title: '접속 통계 그래프',
    }
  };

  chart = new google.charts.Bar(document.getElementById('visit1'));

  chart.draw(data, google.charts.Bar.convertOptions(options));
}

google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(numGraph3);
	google.charts.setOnLoadCallback(numGraph4);
</script>

</head>
<jsp:include page="/WEB-INF/views/include/adminStyle.jsp"/>
<style>
 #container {
    background-color: rgb(240, 240, 240);
 }
 #title {
 	height:100px;
 	font-size:60px;
 	font-weight: bold;
 	text-align: center;
 	margin-top:20px;
 	font-family: 'Song Myung', serif;
 }
 #section {
 	width:90%;
 	height:1100px;
 	margin:50px auto auto;
 }
 #photo {
 	background-color:white;
 	float:left;
 	border:1px solid;
 	width:55%;
 	height:500px;
 }
 #visit {
 	background-color:white;
 	float:left;
 	border:1px solid;
 	width:40%;
 	height:500px;
 	margin-left:50px;
 }
 #memPhoto {
 	height:100%;
 	width:60%;
 	float:left;
 	text-align: center;
 }
 .memtext {
 	height:100%;
 	width:40%;
 	float:left;
 	font-size:22px;
 	line-height: 58px;
 	font-family: 'Song Myung', serif;
 }
 #visit1 {
 	height:70%;
 }
 #visit2 {
 	height:30%;
 }
 .visit3 {
 	border:1px solid gray;
 	float:left;
 	width:33.33%;
 	height:100%;
 }
 #member {
 	background-color:white;
 	border:1px solid;
 	height:500px;
 	float:left;
 	width:100%;
 	margin:50px auto;
 }
 .member2 {
 	width:50%;
 	height:100%;
 	float:left;
 }
 #one {
 	height:50%;
 	text-align: center;
 }
 .two {
 	height:50%;
 	width:50%;
 	float:left;
 	text-align: center;
 }
 .fa-crown {
 	font-size:50px;
 }
 .rank {
 	border:1px solid;
 	width:40%;
 	height:70%;
 	margin:0px auto;
 }
 .rankimg {
 	width:100%;
 	height:100%;
 }
 #memtext2 {
 	display: none;
 }
 #memtext3 {
 	display: none;
 }
 .visitNum {
 	height:80%;
 	font-size:70px;
 	text-align: center;
 }
 tr {
 	height:70px;
 	border:1px solid;
 	text-align: center;
 }
 .raTitle {
 	font-size:30px;
 	text-align: center;
 	background-color: rgb(248, 255, 253);
 }
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/adminMenu.jsp"/>
	<div id="title">
		관리자 페이지
	</div>
	<div id=section>
			<div id="photo">
				<div id="memPhoto">
					<div style="font-size:30px; margin-top:10px;">활발한 활동가</div>
					<div style="height:80%;width:90%;margin:10px auto auto; border:1px dotted;">
						<div id="one">
							<i class="fa-solid fa-crown" style="color:gold"></i>
							<div class="rank" id="one1"><img src="${ctp}/member/${vo.photo}" class="rankimg" ></div>
						</div>
						<div class="two" id="two">
							<i class="fa-solid fa-crown" style="color:silver"></i>
							<div class="rank" style="width:60%;"  id="two2"><img src="${ctp}/member/${vo2.photo}" class="rankimg"/></div>
						</div>
						<div class="two" id="three">
							<i class="fa-solid fa-crown" style="color:brown"></i>
							<div class="rank" style="width:60%;" id="three3"><img src="${ctp}/member/${vo3.photo}" class="rankimg" /></div>
						</div>
					</div>
				</div>
				<div id="memtext" class="memtext">
					<strong>아이디</strong> : ${vo.mid} <br/>
					<strong>이름</strong> : ${vo.name}<br/>
					<strong>이메일</strong> : ${vo.mail}<br/>
					<strong>전화번호</strong> : ${vo.tel}<br/>
					<strong>총 접속일</strong> : ${vo.totalCnt}<br/>
					<strong>최근 방문</strong> : ${vo.lastDate}<br/>
					<strong>게시물</strong> : ${bVo.cnt} 개<br/>
					<strong>댓글 수</strong> : ${brVo.cnt} 개<br/>
				</div>
				<div id="memtext2" class="memtext">
					<strong>아이디</strong> : ${vo2.mid} <br/>
					<strong>이름</strong> : ${vo2.name}<br/>
					<strong>이메일</strong> : ${vo2.mail}<br/>
					<strong>전화번호</strong> : ${vo2.tel}<br/>
					<strong>총 접속일</strong> : ${vo2.totalCnt}<br/>
					<strong>최근 방문</strong> : ${vo2.lastDate}<br/>
					<strong>게시물</strong> : ${bVo2.cnt} 개<br/>
					<strong>댓글 수</strong> : ${brVo2.cnt} 개<br/>
				</div>
				<div id="memtext3" class="memtext">
					<strong>아이디</strong> : ${vo3.mid} <br/>
					<strong>이름</strong> : ${vo3.name}<br/>
					<strong>이메일</strong> : ${vo3.mail}<br/>
					<strong>전화번호</strong> : ${vo3.tel}<br/>
					<strong>총 접속일</strong> : ${vo3.totalCnt}<br/>
					<strong>최근 방문</strong> : ${vo3.lastDate}<br/>
					<strong>게시물</strong> : ${bVo3.cnt} 개<br/>
					<strong>댓글 수</strong> : ${brVo3.cnt} 개<br/>
				</div>
			</div>
			<div id="visit">
				<div id="visit1">통계 그래프</div>
				<div id="visit2">
					<div class="visit3">
						<div>총 접속</div>
						<div class="visitNum">${vo4.cnt}</div>
					</div>
					<div class="visit3">
						<div>오늘 접속</div>
						<div class="visitNum">${vo5.cnt}</div>
					</div>
					<div class="visit3">
						<div>1주일 이내 접속</div>
						<div class="visitNum">${vo7.cnt}</div> 
					</div>
				</div>
			</div>
		<div id="member">
			<div class="member2">
				<div style="width:100%; height:100%; overflow:scroll;">
					<div class="raTitle">최근접속</div>
					<table class="table table-hover">
							<tr style="height:30px;">
								<td >no</td>
								<td >프로필</td>
								<td >이름</td>
								<td >아이디</td>
								<td >마지막접속</td>
								<td >접속중</td>
							</tr>
						<c:forEach var="vo" items="${vos}" varStatus="st">
							<tr>
								<td style="width:10%;">${st.count}</td>
								<td style="width:15%;"><img src="${ctp}/member/${vo.photo}" style="width:50%; height:50%;"/> </td>
								<td style="width:20%;">${vo.name}</td>
								<td style="width:21%;">${vo.mid}</td>
								<td style="width:25%;">${fn:substring(vo.lastDate,0,16)} </td>
								<td style="width:10%;">
									<c:if test="${vo.mid == sMid}">
										<span style="color:rgb(0, 255, 13);font-size:25px">●</span>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div class="member2">
			<div style="width:100%; height:100%; overflow:scroll;">
			<div class="raTitle" style="background-color: rgb(255, 244, 246)" >신규가입자</div>
				<table class="table table-hover">
					<tr style="height:30px;">
						<td style="width:10%;">no</td>
						<td style="width:15%;">프로필</td>
						<td style="width:23%;">이름</td>
						<td style="width:23%;">아이디</td>
						<td style="width:25%;">가입일</td>
					</tr>
					<c:forEach var="vo" items="${vos2}" varStatus="st">
						<tr>
							<td style="width:10%;">${st.count}</td>
							<td style="width:15%;"><img src="${ctp}/member/${vo.photo}" style="width:50%; height:50%;"/> </td>
							<td style="width:20%;">${vo.name}</td>
							<td style="width:21%;">${vo.mid}</td>
							<td style="width:25%;">${fn:substring(vo.startDate,0,16)} </td>
						</tr>
					</c:forEach>
				</table>
			</div>	
			</div>
		</div>
	</div>
</div>
</body>
</html>