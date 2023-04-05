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
  	$(function(){
  		$("select").on("change",function(){
  			let part = $("#part").val();
  			location.href='${ctp}/ask/adAskList?part='+part;
  		});
  	});
  	function del(idx,answer) {
  		let ans = confirm("정말 삭제 하시겠습니까?");
  		if(ans) {
  			if(answer == 'NO') {
  				alert("문의 답변 후 삭제해주세요.");
  				return false;
  			}
  			else {
  				$.ajax({
  					type  : "post",
  					url   : "${ctp}/ask/adAskDel",
  					data  : {idx : idx},
  					success:function(data) {
  						if(data == "1") alert("문의를 삭제하였습니다.");
  						location.reload();
  					},
  					error : function() {
  						alert("오류");
  					}
  				});
  			}
  		}
  	}
  </script>
</head>
<jsp:include page="/WEB-INF/views/include/adminStyle.jsp"/>
<style>
#title {
	height:100px;
	font-size:60px;
	font-weight: bold;
	text-align: center;
	margin-top:20px;
	font-family: 'Song Myung', serif;
}
#section {
	width:80%;
	margin:50px auto 0px;
	text-align: center;
}
#tab {
	background-color: white;
}
 #infor {
 	text-align: left;
 	font-size:17px;
}
select {
	width:100px;
	height:30px;
	margin:0px 10px 10px 0px;
	font-weight: bold;
}
a {
	color: black;
}
</style>
<body style="background-color: rgb(240, 240, 240);">
<div id="container">
<jsp:include page="/WEB-INF/views/include/adminMenu.jsp"/>
	<div id="title">
		문의 및 신고 관리
	</div>
	<div id=section>
		<div id="infor">
			<select name="part" id="part">
				<c:if test="${part == '문의'}">
					<option selected>문의</option>
					<option>신고</option>
				</c:if>
				<c:if test="${part == '신고'}">
					<option>문의</option>
					<option selected >신고</option>
				</c:if>
			</select>
		 Total :  ${pVo.totalNum} 개
		 </div>
		<div id="tab">
			<table class="table table-hover">
				<tr style="background-color: rgb(226, 226, 226); font-weight: bold; font-size:19px;">
					<td style="width:7%">no</td>
					<td style="width:40%; text-align: left;">제목</td>
					<td style="width:15%">아이디</td>
					<td style="width:10%">이름</td>
					<td style="width:15%">작성일</td>
					<td style="width:8%">답변여부</td>
					<td style="width:5%"></td>
				</tr>
				<c:set var="startNum" value="${pVo.startNum}"/>
				<c:forEach var="vo" items="${vos}"> 
					<tr>
						<td>${startNum}</td>
						<td style="text-align: left;"><a href="${ctp}/ask/adAskContent?idx=${vo.idx}">${vo.title}</a></td>
						<td>${vo.mid}</td>
						<td>${vo.name}</td>
						<td>${vo.askDate}</td>
						<c:if test="${vo.answer =='NO'}">
							<td style="color:red">${vo.answer}</td>
						</c:if>
						<c:if test="${vo.answer =='YES'}">
							<td style="color:blue">${vo.answer}</td>
						</c:if>
						<td><button onclick="del('${vo.idx}','${vo.answer}')" class="btn btn-danger" >삭제</button></td>
					</tr>
		 		<c:set var="startNum" value="${startNum - 1}"/> 
				</c:forEach>
				</table>
		</div>
		
		<!---------------- 페이징 ------------------ -->
       <div style="text-align:center; font-size:25px; height:50px; width:23%; margin:50px auto 100px;" >
        	<ul class="pagination justify-content-center">
              <c:if test="${pVo.curPage > 1}">  
              	<li><a href='${ctp}/ask/adAskList?curPage=1&listNum=${pVo.listNum}' class='page-link text-secondary'><i class='fa-solid fa-angles-left'></i></a></li>  
              </c:if> 
              <c:set var="curPage2" value="${pVo.lastPageNum - pVo.blockPage}"/>
              <c:if test="${curPage2 >=1}">
                  <li><a href='${ctp}/ask/adAskList?curPage=${curPage2}&listNum=${pVo.listNum}' class='page-link text-secondary'><i class='fa-solid fa-arrow-left'></i></a></li>
              </c:if>   
              
              <c:forEach var="i" begin="${pVo.startPageNum}" end="${pVo.lastPageNum}">
             	<c:if test="${curPage == i}">
                  <li><span class='page-link text-secondary' style='font-weight:bold;'>${i}</span></li>
              </c:if>
              <c:if test="${curPage != i && pVo.totalPage >= i}">
                  <li><a href='${ctp}/ask/adAskList?curPage=${i}&listNum=${pVo.listNum}' class='page-link text-secondary'>${i}</a></li>
              </c:if>
              </c:forEach>
              <c:set var="curPage3" value="${pVo.startPageNum + pVo.blockPage}"/>
              <c:if test="${curPage3 <= pVo.totalPage}">
                   <li><a href='${ctp}/ask/adAskList?curPage=${curPage3}&listNum=${pVo.listNum}' class='page-link text-secondary'><i class='fa-solid fa-arrow-right'></i></a></li>
              </c:if>
							<c:if test="${pVo.curPage < pVo.totalPage}">
                   <li><a href='${ctp}/ask/adAskList?curPage=${pVo.totalPage}&listNum=${pVo.listNum}' class='page-link text-secondary'><i class='fa-solid fa-angles-right'></i></a></li>
              </c:if>
            </ul>
        </div>
<!-- --------------페이징------------------  -->
		
	</div>
</div>
</body>
</html>