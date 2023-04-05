<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
</head>
<jsp:include page="/WEB-INF/views/include/style2.jsp"/>
<style>
#container {
	width:100%;
	height:950px;
}
#nav {
	color:white;
}

</style>
<body>
<div id="container">
	<jsp:include page="/WEB-INF/views/include/menu.jsp" />
	<img src="${ctp}/etc/coreit.png" style="width:100%; height:105%;" />
</div>
</body>
</html>