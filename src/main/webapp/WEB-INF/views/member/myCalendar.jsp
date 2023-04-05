<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
</head>
<jsp:include page="/WEB-INF/views/include/style.jsp"/>
<style>
#section {
	margin:150px auto 400px;
	width:75%;
}
#title2 {
	height:100px;
	font-size:60px;
	font-weight: bold;
	text-align: center;
	font-family: 'Song Myung', serif;
}
#myBtn {
	margin-top:70px;
}
#main {
	border:5px double ;
	width:100%;
	height:900px;
	margin-top:10px;
}
.part2 {
	border:1px solid ;
	width:22%;
	margin:30px 20px;
	height:26%;
	float:left;
	background-color:white;
}
#part21 {
	border:1px solid lightgray;
	width:100%;
	height:30%;
	text-align: center;
	font-size:30px;
	font-weight: bold;
	padding-top:10px;
}
#part22 {
	border:1px solid lightgray;
	width:100%;
	height:20%;
	font-size:18px;
	padding-top:9px;
}
#part23 {
	border:1px solid lightgray;
	width:100%;
	height:50%;
	font-size:18px;
}
.part2:hover {
	color:black;
	border: 3px solid;
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	<div id="section">
	<div id="title2">일정 관리</div>
	<div id="myBtn"><button class="btn btn-secondary" onclick="location.href='${ctp}/member/myPage'">My Page <i class="fa-solid fa-arrow-right"></i></button> </div>
		<div id="main">
			<c:forEach var="vo" items="${vos}">
				<a href='${ctp}/calendar/calendarCon?idx=${vo.idx}&flag=1'>
					<div class="part2">
						<div id="part21">
							${vo.myDate}
						</div>
						<div id="part22">
							제목 : ${vo.title}
						</div>
						<div id="part23">
							${vo.content}
						</div>
					</div>
				</a>
			</c:forEach>
		</div>
		
            <!-- ---------------- 페이징 처리 ----------------- -->
    <div style="text-align:center; font-size:25px; height:50px; width:23%; margin:30px auto;" >
    	<ul class="pagination justify-content-center">
          <c:if test="${pVo.curPage > 1}">  
          	<li><a href='${ctp}/member/myCalendar?curPage=1&listNum=${pVo.listNum}' class='page-link text-secondary'><i class='fa-solid fa-angles-left'></i></a></li>  
          </c:if> 
          <c:set var="curPage2" value="${pVo.lastPageNum - pVo.blockPage}"/>
          <c:if test="${curPage2 >=1}">
              <li><a href='${ctp}/member/myCalendar?curPage=${curPage2}&listNum=${pVo.listNum}' class='page-link text-secondary'><i class='fa-solid fa-arrow-left'></i></a></li>
          </c:if>   
          
          <c:forEach var="i" begin="${pVo.startPageNum}" end="${pVo.lastPageNum}">
         	<c:if test="${curPage == i}">
              <li><span class='page-link text-secondary' style='font-weight:bold;'>${i}</span></li>
          </c:if>
          <c:if test="${curPage != i && pVo.totalPage >= i}">
              <li><a href='${ctp}/member/myCalendar?curPage=${i}&listNum=${pVo.listNum}' class='page-link text-secondary'>${i}</a></li>
          </c:if>
          </c:forEach>
          <c:set var="curPage3" value="${pVo.startPageNum + pVo.blockPage}"/>
          <c:if test="${curPage3 <= pVo.totalPage}">
               <li><a href='${ctp}/member/myCalendar?curPage=${curPage3}&listNum=${pVo.listNum}' class='page-link text-secondary'><i class='fa-solid fa-arrow-right'></i></a></li>
          </c:if>

					<c:if test="${pVo.curPage < pVo.totalPage}">
               <li><a href='${ctp}/member/myCalendar?curPage=${pVo.totalPage}&listNum=${pVo.listNum}' class='page-link text-secondary'><i class='fa-solid fa-angles-right'></i></a></li>
          </c:if>
        </ul>
    </div>
        <!-- ----------------------------------------------- -->
		
	</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>	
</div>
</body>
</html>