<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<div id="header">
	<div id="log">
		<c:if test="${sMid == null}">
			<div><a href="${ctp}/member/login">로그인</a></div>
		</c:if>
		<c:if test="${sMid != null}">
			<div>· 
				<c:if test="${sPhoto != '사진없음'}">
					<div style="float:left; right:2px;  width:50px; height:45px;"><img src="${ctp}/member/${sPhoto}"style="width:100%; height:100%; border-radius: 100px;'">
				</c:if>
			</div>
			<c:if test="${sMid == 'admin'}">
				<a href="${ctp}/admin/adMain">
					<span style="font-size:20px;">· 관리자 &nbsp;&nbsp;</span>
				</a>
			</c:if>
				<a href="${ctp}/member/myPage">
					<span style="font-size:25px;">· ${sMid}</span>님
				</a>
			&nbsp;&nbsp;&nbsp;· <a href="${ctp}/member/logout">로그아웃${photo}</a></div>
		</c:if>
		
	</div>
	<div id="title"><a href="${ctp}/member/main2" style="text-decoration: none">개미굴</a></div>
	<div id="menu">
		<ul id="menu2">
			<li><a href="${ctp}/member/main2">홈으로</a></li>
			<li><a href="">소개</a></li>
			<li><a href="${ctp}/calendar/calendar">약속 일정</a></li>
			<li><a href="${ctp}/board/board">게시판</a></li>
			<li><a href="${ctp}/ask/ask">문의 및 신고</a></li>
			<li><a href="">여행기록</a></li>
			<li><a href="${ctp}/visit/visit">출석</a></li>
		</ul>
	</div>
	<hr/>
</div>
<div style="top:57px; left:35px;" id="nav" onclick="openNav('진혁')" class="prod" title="진혁"></div>
<div style="top:57px; left:800px;" id="nav" onclick="openNav('진혁')" class="prod" title="진혁"></div>
<div style="top:57px; right:265px;" id="nav" onclick="openNav('진혁')" class="prod" title="진혁"></div>
<div style="top:67px; left:390px;" id="nav" onclick="openNav('은재')" class="prod" title="은재"></div>
<div style="top:67px; right:680px;" id="nav" onclick="openNav('은재')" class="prod" title="은재"></div>
<div style="top:105px; left:620px;" id="nav" onclick="openNav('수빈')" class="prod" title="수빈"></div>
<div style="top:105px; right:450px;" id="nav" onclick="openNav('수빈')" class="prod" title="수빈"></div>
<div style="top:200px; left:225px;" id="nav" onclick="openNav('호성')" class="prod" title="호성"></div>
<div style="top:200px; left:990px;" id="nav" onclick="openNav('호성')" class="prod" title="호성"></div>
<div style="top:200px; right:80px;" id="nav" onclick="openNav('호성')" class="prod" title="호성"></div>
<div style="top:300px; left:60px;" id="nav" onclick="openNav('대현')" class="prod" title="대현"></div>
<div style="top:300px; left:830px;" id="nav" onclick="openNav('대현')" class="prod" title="대현"></div>
<div style="top:300px; right:240px;" id="nav" onclick="openNav('대현')" class="prod" title="대현"></div>
<div style="top:333px; left:415px;" id="nav" onclick="openNav('명환')" class="prod" title="명환"></div>
<div style="top:333px; right:655px;" id="nav" onclick="openNav('명환')" class="prod" title="명환"></div>
<div style="top:315px; left:650px;" id="nav" onclick="openNav('찬희')" class="prod" title="찬희"></div>
<div style="top:315px; right:420px;" id="nav" onclick="openNav('찬희')" class="prod" title="찬희"></div>
<div id="진혁" class="overlay">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav('진혁')">&times;</a>
  <div class="overlay-content">
  	<div id="pho">
   		<img src="${ctp}/etc/진혁.jpg" class="imga"/>
   	</div>
   	<div id="txt">
   		<h1 style="text-align:center;">정진혁</h1>
   		<br/>
   		 사는 곳 : 안양<br>
   		 교수님 포스를 풍기는 떡춤의 대가<br/>
   		 언제나 놀고 싶어 안달 나있는 상태<br/>
   		 항상 그의 옆에는 핸드폰 게임이 켜져있다.
   	</div>
  </div>
</div>
<div id="은재" class="overlay">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav('은재')">&times;</a>
  <div class="overlay-content">
  	<div id="pho">
   		<img src="${ctp}/etc/은재.jpg" class="imga"/>
   	</div>
   	<div id="txt">
   		<h1 style="text-align:center;">곽은재</h1>
   		<br/>
   		 사는 곳 : 서울<br>
   		 피지컬로 승부하는 서울 들소<br/>
   		 짱깨 매니아 +탕수육<br/>
   		 특징: 화장실 갈 때 바지를 벗는다.
   	</div>
  </div>
</div>
<div id="수빈" class="overlay">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav('수빈')">&times;</a>
  <div class="overlay-content">
  	<div id="pho">
   		<img src="${ctp}/etc/수빈.jpg" class="imga"/>
   	</div>
   	<div id="txt">
   		<h1 style="text-align:center;">김수빈</h1>
   		<br/>
   		 사는 곳 : 인천<br>
   		 일명 섹수빈<br/>
   		 두 집 살림의 대가<br/>
   		 술을 좋아하지만 건강을 생각하여<br/>
   		 건강식을 즐겨 먹음
   	</div>
  </div>
</div>
<div id="호성" class="overlay">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav('호성')">&times;</a>
  <div class="overlay-content">
  	<div id="pho">
   		<img src="${ctp}/etc/호성.jpg" class="imga"/>
   	</div>
   	<div id="txt">
   		<h1 style="text-align:center;">이호성</h1>
   		<br/>
   		 사는 곳 : 청주<br>
   		 홈페이지의 관리자<br/>
   		 항상 피곤에 쩔어있음<br/>
   		 컨디션이 분마다 달라지는 신기한 체질<br/>
   	</div>
  </div>
</div>
<div id="명환" class="overlay">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav('명환')">&times;</a>
  <div class="overlay-content">
  	<div id="pho">
   		<img src="${ctp}/etc/명환.jpg" class="imga"/>
   	</div>
   	<div id="txt">
   		<h1 style="text-align:center;">황명환</h1>
   		<br/>
   		 사는 곳 : 대전<br>
   		 천사 혹은 악마<br/>
   		 시꺼먼 속내를 모르고 그에게 속아 자빠진<br/>
   		 사람이 수십명<br/>
   		 요주의 인물.
   	</div>
  </div>
</div>
<div id="찬희" class="overlay">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav('찬희')">&times;</a>
  <div class="overlay-content">
  	<div id="pho">
   		<img src="${ctp}/etc/찬희.jpg" class="imga"/>
   	</div>
   	<div id="txt">
   		<h1 style="text-align:center;">우찬희</h1>
   		<br/>
   		 사는 곳 : 세종<br>
   		 손흥민.<br/>
   		 일본에 다녀온 후로<br/>
   		 친일파가 된 오사카딱구리<br/>
   	</div>
  </div>
</div>
<div id="대현" class="overlay">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav('대현')">&times;</a>
  <div class="overlay-content">
  	<div id="pho">
   		<img src="${ctp}/etc/대현.jpg" class="imga"/>
   	</div>
   	<div id="txt">
   		<h1 style="text-align:center;">유대현</h1>
   		<br/>
   		 사는 곳 : 음성<br>
   		 에그 매니아<br/>
   		 음성에서 자라나 매일매일이 반기문 상태<br/>
   		 해요를 즐겨 부름<br/>
   	</div>
  </div>
</div>