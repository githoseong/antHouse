<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>

<div id="myNav" class="overlay">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <div class="overlay-content">
    <a href="${ctp}/member/login">로그인</a>
    <a href="#">게시판</a>
    <a href="#">1:1문의</a>
    <a href="#">코아사람찾기</a>
  </div>
</div>


<span style="font-size:40px;cursor:pointer;position:absolute;" id="nav" onclick="openNav()">&#9776; open</span>
<script>
function openNav() {
  document.getElementById("myNav").style.width = "100%";
}

function closeNav() {
  document.getElementById("myNav").style.width = "0%";
}
</script>

