<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<div class="bg-img">
  <div class="container">
    <div class="topnav">
      <a href="${ctp}/member/main2">홈</a>
      <a href="${ctp}/admin/adMain">관리자 홈</a>
      <a href="${ctp}/admin/banner">메인 배너</a>
      <a href="#about">스케쥴</a>
      <a href="#about">이 달의 인물</a>
      <a href="${ctp}/admin/adMember">회원 관리</a>
      <a href="#about">문의 및 신고</a>
    </div>
  </div>
</div>
