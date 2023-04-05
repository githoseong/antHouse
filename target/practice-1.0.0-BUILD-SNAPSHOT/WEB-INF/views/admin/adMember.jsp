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
	function up(mid,level) {
		let ans = confirm("등급을 올리시겠습니까?");
		let query = {
				mid : mid,
				level : level
				}
		if(ans) {
			$.ajax({
				type : "post",
				url  : "${ctp}/admin/levelUp",
				data : query,
				success: function(data) {
					if(data == 1) {
						alert(""+mid+"님의 등급이 올라갔습니다.");
						location.reload();
					}
					else if(data == 2) {
						alert("더 이상 등급이 올라갈 수 없습니다.");
					}
				},
				error : function() {
					alert("오류");
				}
			})
		}
	}
	function down(mid,level) {
		let ans = confirm("등급을 내리시겠습니까?");
		let query = {
				mid : mid,
				level : level
				}
		if(ans) {
			$.ajax({
				type : "post",
				url  : "${ctp}/admin/levelDown",
				data : query,
				success: function(data) {
					if(data == 1) {
						alert(""+mid+"님의 등급이 내려갔습니다.");
						location.reload();
					}
					else if(data == 2) {
						alert("더 이상 등급을 내릴 수 없습니다.");
					}
				},
				error : function() {
					alert("오류");
				}
			})
		}
	}
</script>
</head>
<jsp:include page="/WEB-INF/views/include/adminStyle.jsp"/>
<style>
#container {
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
 	margin:50px auto 0px;
 	text-align: center;
 }
 #tab {
 	background-color: white;
 }
 .btn2:hover {
 	background-color: lightgray;
 }
 #infor {
 	text-align: left;
 	font-size:17px;
 }
</style>
<body style="background-color: rgb(240, 240, 240);">
<div id="container">
<jsp:include page="/WEB-INF/views/include/adminMenu.jsp"/>
	<div id="title">
		회원 관리
	</div>
	<div id=section>
		<div id="infor">전체 회원 수 : ${pVo.totalNum} 명</div>
		<div id="tab">
			<table class="table table-hover">
				<tr style="background-color: rgb(226, 226, 226); font-weight: bold; font-size:19px;">
					<td style="width:5%">no</td>
					<td style="width:5%">사진</td>
					<td style="width:16%">아이디</td>
					<td style="width:7%">이름</td>
					<td style="width:16%">이메일</td>
					<td>전화번호</td>
					<td>가입일</td>
					<td>마지막접속</td>
					<td style="width:8%">등급</td>
					<td style="width:8%">탈퇴여부</td>
				</tr>
				<c:set var="startNum" value="${pVo.startNum}"/>
				<c:forEach var="vo" items="${vos}">
					<tr>
						<td>${startNum}</td>
						<td>
							<div style="width:80px;height:70px;border:1px solid;">
								<img src="${ctp}/member/${vo.photo}" style="width:100%; height:100%;"/>
							</div>
						</td>
						<td>${vo.mid}</td>
						<td>${vo.name}</td>
						<td>${vo.mail}</td>
						<td>${vo.tel}</td>
						<td>${fn:substring(vo.startDate,2,16)}</td>
						<td>${fn:substring(vo.lastDate,2,16)}</td>
						<td>
							<c:if test="${vo.level == 1}">
								<div style="width:80%;height:50px; float:left;">준회원</div>	
							</c:if>
							<c:if test="${vo.level == 2}">
								<div style="width:80%;height:50px; float:left;">정회원</div>
							</c:if>
							<c:if test="${vo.level == 3}">
								<div style="width:80%;height:50px; float:left;">우수회원</div>
							</c:if>
							<c:if test="${vo.level == 0}">
								<div style="width:80%;height:50px; float:left;">관리자</div>
							</c:if>
							<div style="border:1px solid; width:20%; float:left; cursor: pointer;" class="btn2" title="up" onclick="up('${vo.mid}','${vo.level}')"><i class="fa-solid fa-arrow-up"></i></div>
							<div style="border:1px solid; width:20%; float:left; cursor: pointer;" class="btn2" title="down" onclick="down('${vo.mid}','${vo.level}')"><i class="fa-solid fa-arrow-down"></i></div>
						</td>
						<td>
							<c:if test="${vo.del == 1}">
								<input type="button" class="btn btn-danger" value="탈퇴신청"/>
							</c:if>
						</td>
					</tr>
					<c:set var="startNum" value="${startNum - 1}"/>
				</c:forEach>
			</table>
		</div>
		<!---------------- 페이징 ------------------ -->
           <div style="text-align:center; font-size:25px; height:50px; width:23%; margin:50px auto 100px;" >
            	<ul class="pagination justify-content-center">
	                <c:if test="${pVo.curPage > 1}">  
	                	<li><a href='${ctp}/admin/adMember?curPage=1&listNum=${pVo.listNum}' class='page-link text-secondary'><i class='fa-solid fa-angles-left'></i></a></li>  
	                </c:if> 
	                <c:set var="curPage2" value="${pVo.lastPageNum - pVo.blockPage}"/>
	                <c:if test="${curPage2 >=1}">
	                    <li><a href='${ctp}/admin/adMember?curPage=${curPage2}&listNum=${pVo.listNum}' class='page-link text-secondary'><i class='fa-solid fa-arrow-left'></i></a></li>
	                </c:if>   
	                
	                <c:forEach var="i" begin="${pVo.startPageNum}" end="${pVo.lastPageNum}">
	               	<c:if test="${curPage == i}">
	                    <li><span class='page-link text-secondary' style='font-weight:bold;'>${i}</span></li>
	                </c:if>
	                <c:if test="${curPage != i && pVo.totalPage >= i}">
	                    <li><a href='${ctp}/admin/adMember?curPage=${i}&listNum=${pVo.listNum}' class='page-link text-secondary'>${i}</a></li>
	                </c:if>
	                </c:forEach>
	                <c:set var="curPage3" value="${pVo.startPageNum + pVo.blockPage}"/>
	                <c:if test="${curPage3 <= pVo.totalPage}">
	                     <li><a href='${ctp}/admin/adMember?curPage=${curPage3}&listNum=${pVo.listNum}' class='page-link text-secondary'><i class='fa-solid fa-arrow-right'></i></a></li>
	                </c:if>
	
					<c:if test="${pVo.curPage < pVo.totalPage}">
	                     <li><a href='${ctp}/admin/adMember?curPage=${pVo.totalPage}&listNum=${pVo.listNum}' class='page-link text-secondary'><i class='fa-solid fa-angles-right'></i></a></li>
	                </c:if>
                </ul>
            </div>
		<!-- --------------페이징------------------  -->
	</div>
</div>
</body>
</html>