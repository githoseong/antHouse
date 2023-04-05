<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
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
#tab {
	background-color: white;
	text-align:center;
	margin-top:10px;
}
a {
	color: black;
}
#myBtn {
	margin-top:70px;
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	<div id="section">
	<div id="title2">문의 및 신고 내역</div>
	<div id="myBtn"><button class="btn btn-secondary" onclick="location.href='${ctp}/member/myPage'">My Page <i class="fa-solid fa-arrow-right"></i></button> </div>
		<div id="tab">
			<table class="table table-hover">
				<tr style="background-color: rgb(226, 226, 226); font-weight: bold; font-size:19px;">
					<td style="width:7%">no</td>
					<td style="width:53%; text-align: left;">제목</td>
					<td style="width:6%;">구분</td>
					<td style="width:20%">작성일</td>
					<td style="width:7%">답변여부</td>
					<td style="width:7%"></td>
				</tr>
				<c:set var="startNum" value="${pVo.startNum}"/>
				<c:forEach var="vo" items="${vos}"> 
					<tr>
						<td>${startNum}</td>
						<td style="text-align: left;"><a href="${ctp}/member/myAskContent?idx=${vo.idx}">${vo.title}</a></td>
						<td>${vo.part}</td>
						<td>${vo.askDate}</td>
						<c:if test="${vo.answer =='NO'}">
							<td style="color:red">${vo.answer}</td>
						</c:if>
						<c:if test="${vo.answer =='YES'}">
							<td style="color:blue">${vo.answer}</td>
						</c:if>
						<td><button class="btn btn-danger " onclick="del(${vo.idx})">삭제</button> </td>
					</tr>
		 		<c:set var="startNum" value="${startNum - 1}"/> 
				</c:forEach>
			</table>
		</div>
		
		<!---------------- 페이징 ------------------ -->
       <div style="text-align:center; font-size:25px; height:50px; width:23%; margin:50px auto 100px;" >
        	<ul class="pagination justify-content-center">
              <c:if test="${pVo.curPage > 1}">  
              	<li><a href='${ctp}/member/myAsk?curPage=1&listNum=${pVo.listNum}' class='page-link text-secondary'><i class='fa-solid fa-angles-left'></i></a></li>  
              </c:if> 
              <c:set var="curPage2" value="${pVo.lastPageNum - pVo.blockPage}"/>
              <c:if test="${curPage2 >=1}">
                  <li><a href='${ctp}/member/myAsk?curPage=${curPage2}&listNum=${pVo.listNum}' class='page-link text-secondary'><i class='fa-solid fa-arrow-left'></i></a></li>
              </c:if>   
              
              <c:forEach var="i" begin="${pVo.startPageNum}" end="${pVo.lastPageNum}">
             	<c:if test="${curPage == i}">
                  <li><span class='page-link text-secondary' style='font-weight:bold;'>${i}</span></li>
              </c:if>
              <c:if test="${curPage != i && pVo.totalPage >= i}">
                  <li><a href='${ctp}/member/myAsk?curPage=${i}&listNum=${pVo.listNum}' class='page-link text-secondary'>${i}</a></li>
              </c:if>
              </c:forEach>
              <c:set var="curPage3" value="${pVo.startPageNum + pVo.blockPage}"/>
              <c:if test="${curPage3 <= pVo.totalPage}">
                   <li><a href='${ctp}/member/myAsk?curPage=${curPage3}&listNum=${pVo.listNum}' class='page-link text-secondary'><i class='fa-solid fa-arrow-right'></i></a></li>
              </c:if>
							<c:if test="${pVo.curPage < pVo.totalPage}">
                   <li><a href='${ctp}/member/myAsk?curPage=${pVo.totalPage}&listNum=${pVo.listNum}' class='page-link text-secondary'><i class='fa-solid fa-angles-right'></i></a></li>
              </c:if>
            </ul>
        </div>
<!-- --------------페이징------------------  -->
		
	</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</div>
</body>
</html>