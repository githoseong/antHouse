<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
<script>
function searchCheck() {
  	let sear = $("#sear").val();
  	
  	if(sear.trim() == "") {
  		alert("검색어를 입력하세요.");
  		myForm.sear.focus();
  	}
  	else {
  		myForm.submit();
  	}
  }

function boardGood(idx) {
	$.ajax({
		type  : "post",
		url   : "${ctp}/board/boardGood",
		data  : {idx : idx},
		success:function(data) {
			if(data == "1") alert("이미 추천을 누르셨습니다.");
			else location.reload();
		},
		error : function() {
			alert("로그인을 해주세요.");
		}
	});
}	
function boardBad(idx) {
	$.ajax({
		type  : "post",
		url   : "${ctp}/board/boardBad",
		data  : {idx : idx},
		success:function(data) {
			if(data == "1") alert("이미 싫어요를 누르셨습니다.");
			else location.reload();
		},
		error : function() {
			alert("로그인을 해주세요.");
		}
	});
}	
</script>
</head>
<jsp:include page="/WEB-INF/views/include/style.jsp"/>
<style>
#section {
	margin:150px auto 400px;
	width:70%;
}
tr {
	text-align:center;
}
#subTitle {
	font-size:70px;
	text-align:center;
	margin:10px auto 50px;
	font-family: 'Song Myung', serif;
}
.btn {
	width:100px;
	height:50px;
	font-size:20px;
	background-color: rgb(238, 238, 238);
}
.btn:hover {
	background-color: rgb(230, 230, 230);
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	<div id="section">
		<div id="subTitle">게시판</div>
		<div id="infor">
            Total : ${pVo.totalNum} &nbsp;  
            Page : ${pVo.curPage} / ${pVo.totalPage}
        </div>
		<table class="table table-hover">
			<tr style="background-color:rgb(238, 231, 226);">
				<td style="width:7%">no</td>
				<td style="width:47%">제목</td>
				<td style="width:15%">작성자</td>
				<td style="width:15%">날짜</td>
				<td style="width:7%">조회수</td>
				<td style="width:10%">추천</td>
			</tr>	
			<c:set var="startNum" value="${pVo.startNum}"/>
			<c:forEach var="vo" items="${vos}">
				<tr>
					<td>${startNum}</td>
					<td style="text-align: left"><a href="${ctp}/board/content?idx=${vo.idx}&curPage=${pVo.curPage}&listNum=${pVo.listNum}&search=${search}&boardSearch=${boardSearch}">${vo.title}</a></td>
					<td>${vo.name}</td>
					<td>${fn:substring(vo.writeDate,0,16)}</td>
					<td>${vo.readNum}</td>
					<td><span onclick="boardGood(${vo.idx})" style="cursor: pointer;"> <i class="fa-regular fa-thumbs-up"></i> <span style="color:blue;font-weight:bold">${vo.good}</span></span> <span onclick="boardBad(${vo.idx})" style="cursor: pointer;"><span style="color:red;font-weight:bold"><i class="fa-regular fa-thumbs-down" style="color:brown;"></i> ${vo.bad}</span></span></td>
				</tr>
					<c:set var="startNum" value="${startNum - 1}"/>
			</c:forEach>
		</table>
		<div style="text-align: right"><input type="button" value="글쓰기"  onclick="location.href='${ctp}/board/boardInput?&curPage=${pVo.curPage}&listNum=${pVo.listNum}&search=${search}&boardSearch=${boardSearch}'" class="btn"/></div>
		
		<!-- 검색 -->
		
		<div style="text-align: center">
			<form method="get" name="myForm">
				<select name="search">
					<option value="title">제목</option>
					<option value="name">작성자</option>
					<option value="content">내용</option>
				</select>
				<input type="text" placeholder="검색어를 입력하세요" name="boardSearch" id="sear"/>
				<input type="button" value="검색" onclick="searchCheck()"/>
			</form>
		</div>
		<!-- 검색  -->		
		
                <!-- ---------------- 페이징 처리 ----------------- -->
            <div style="text-align:center; font-size:25px; height:50px; width:23%; margin:30px auto;" >
            	<ul class="pagination justify-content-center">
	                <c:if test="${pVo.curPage > 1}">  
	                	<li><a href='${ctp}/board/board?curPage=1&listNum=${pVo.listNum}&search=${search}&boardSearch=${boardSearch}' class='page-link text-secondary'><i class='fa-solid fa-angles-left'></i></a></li>  
	                </c:if> 
	                <c:set var="curPage2" value="${pVo.lastPageNum - pVo.blockPage}"/>
	                <c:if test="${curPage2 >=1}">
	                    <li><a href='${ctp}/board/board?curPage=${curPage2}&listNum=${pVo.listNum}&search=${search}&boardSearch=${boardSearch}' class='page-link text-secondary'><i class='fa-solid fa-arrow-left'></i></a></li>
	                </c:if>   
	                
	                <c:forEach var="i" begin="${pVo.startPageNum}" end="${pVo.lastPageNum}">
	               	<c:if test="${curPage == i}">
	                    <li><span class='page-link text-secondary' style='font-weight:bold;'>${i}</span></li>
	                </c:if>
	                <c:if test="${curPage != i && pVo.totalPage >= i}">
	                    <li><a href='${ctp}/board/board?curPage=${i}&listNum=${pVo.listNum}&search=${search}&boardSearch=${boardSearch}' class='page-link text-secondary'>${i}</a></li>
	                </c:if>
	                </c:forEach>
	                <c:set var="curPage3" value="${pVo.startPageNum + pVo.blockPage}"/>
	                <c:if test="${curPage3 <= pVo.totalPage}">
	                     <li><a href='${ctp}/board/board?curPage=${curPage3}&listNum=${pVo.listNum}&search=${search}&boardSearch=${boardSearch}' class='page-link text-secondary'><i class='fa-solid fa-arrow-right'></i></a></li>
	                </c:if>
	
									<c:if test="${pVo.curPage < pVo.totalPage}">
	                     <li><a href='${ctp}/board/board?curPage=${pVo.totalPage}&listNum=${pVo.listNum}&search=${search}&boardSearch=${boardSearch}' class='page-link text-secondary'><i class='fa-solid fa-angles-right'></i></a></li>
	                </c:if>
                </ul>
            </div>
                <!-- ----------------------------------------------- -->
	</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>	
</div>
</body>
</html>