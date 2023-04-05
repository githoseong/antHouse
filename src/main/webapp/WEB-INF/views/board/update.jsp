<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
<script src="https://cdn.ckeditor.com/ckeditor5/35.3.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/35.3.0/classic/translations/ko.js"></script>
<script>
 function check() {
	 let title = myForm.title.value;
	 let content = myForm.content.value;
	 
	 if(title == "") {
		 alert("제목을 입력 해주세요");
	 }
	 else {
		 myForm.submit();
	 }
 }

</script>
</head>
<jsp:include page="/WEB-INF/views/include/style.jsp"/>
<style>
#section {
	margin:150px auto auto;
	width:60%;
	height:1500px;
}
#inputTitle {
	font-size:60px;
	text-align:center;
	margin:10px auto 50px;
	font-family: 'Song Myung', serif;
}
.btn {
	width:100px;
	height:50px;
	font-size:20px;
}
.ck-editor__editable { height: 800px; }
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	<div id="section">
		<div id="inputTitle">게시판 수정</div>
		<form method="post" name="myForm" enctype="multipart/form-data">
			<table class="table table-bordered">
				<tr>
					<td style="width:20%">이름</td>
					<td><input type="text" value="${vo.name}" name="name" readonly/></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" size="80" value="${vo.title}"/> </td>
				</tr>
				<tr>
					<td colspan="2"><textarea name="content" cols="147" rows="40" id="editor" >${vo.content} </textarea> </td>
					<script>
				      ClassicEditor.create(document.querySelector("#editor"), {
				    	  ckfinder: {
				    	        uploadUrl: "${ctp}/board/imageUpload",
				    	    },
				    	  language: "ko"
				    		  
				      } ); 
				      
				    </script>
				    
				    
				</tr>
			</table>
			<div style="text-align: right;">
				<input type="button" value="완료" onclick="check()" class="btn btn-secondary">
				<input type="button" value="취소" onclick="location.href='${ctp}/board/board?curPage=${curPage}&listNum=${listNum}&search=${search}&boardSearch=${boardSearch}'" class="btn btn-secondary"/> 
			</div>
		</form>
	</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>	
</div>
</body>
</html>