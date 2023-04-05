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
</head>
<jsp:include page="/WEB-INF/views/include/style.jsp"/>
<script>
function del() {
	let ans = confirm("정말 삭제 하시겠습니까?");
	if(ans) {
		location.href="${ctp}/board/boardDel?idx=${vo.idx}";
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
function reGood(idx) {
	$.ajax({
		type  : "post",
		url   : "${ctp}/board/reGood",
		data  : {idx : idx},
		success:function(data) {
			if(data == "1") alert("이미 좋아요를 누르셨습니다.");
			else location.reload();
		},
		error : function() {
			alert("로그인을 해주세요.");
		}
	});
}	

function reply(idx) {
	let content = myForm.content.value;
	let query = {
	  		boardIdx : idx,
	  		name     : '${vo.name}',
	  		mid     : '${vo.mid}',
	  		content  : content
	  	}
	
	if(content.trim() == "") {
		alert("댓글을 입력하세요.");
		content.focus();
	}
	else {
		$.ajax({
			type : "post",
			url  : "${ctp}/board/boardReply",
			data : query,
			success:function(data) {
				if(data == "1") {
					location.reload();
				}
			},
			error : function() {
				alert("오류");
			}
		});
	}
}
$(document).ready(function() {
    $('#content').on('keyup', function() {
        $('#contentDiv').html("("+$(this).val().length+" / 100)");
 
        if($(this).val().length > 100) {
            $(this).val($(this).val().substring(0, 100));
            $('#contentDiv').html("(100 / 100)");
        }
    });
});

function reUpdate(idx){
	let con =  document.getElementById('con'+idx+'').innerText ;
	let idxx = document.getElementById('idxx').value = idx ;
	$('#content').html(con);
	$('#rep').css("display","none");
	$('#upd').css("display","block");
	$('#nop').css("display","block");
	
				
}
function no() {
	$('#content').html('');
	$('#rep').css("display","block");
	$('#upd').css("display","none");
	$('#nop').css("display","none");
}

function reUpdateGo() {
	let ans = confirm("정말 수정 하시겠습니까?");
	let idxx = document.getElementById('idxx').value;
	let content = myForm.content.value;
	let query = {
		idx : idxx,
		content : content
	};
	if(ans) {
		$.ajax({
			type : "post",
			url  : "${ctp}/board/boardReplyUpdate",
			data : query,
			success:function(data) {
				if(data == "1") {
					location.reload();
				}
			},
			error : function() {
				alert("오류");
			}
		});
	}
}

function replyDel(idx) {
	let ans = confirm("정말 수정 하시겠습니까?");
	if(ans) {
		$.ajax({
			type : "post",
			url  : "${ctp}/board/boardReplyDel",
			data : {idx : idx},
			success:function(data) {
				if(data == "1") {
					location.reload();
				}
			},
			error : function() {
				alert("오류");
			}
		});
	}
}
</script>
<style>
#section {
	margin:150px auto 300px;
	width:60%;
}
#contentTitle {
	font-size:60px;
	text-align:center;
	margin:10px auto 50px;
	font-family: 'Song Myung', serif;
}
.bb {
	text-align:right;
}
.btn:hover {
	opacity: 0.8;
}
#repl {
	text-align: center;
	background-color: rgb(241, 241, 241);
} 
#reTitle {
	font-size:30px;
	margin:70px auto 20px 30px;
}
.btn3 {
	cursor: pointer;
}
.btn3:hover {
	font-weight: bold;
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	<div id="section">
		<div id="contentTitle">내용</div>
		<table class="table table-bordered">
			<tr>
				<td style="width:20%">이름
				</td>
				<td colspan="2" >${vo.name}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td style="border:none">${vo.title}</td>
				<td style="text-align: right; border:none">${fn:substring(vo.writeDate,0,16)}
				<span onclick="boardGood(${vo.idx})" style="cursor: pointer;">👍 <span style="color:blue;font-weight:bold">${vo.good}</span></span> <span onclick="boardBad(${vo.idx})" style="cursor: pointer;"><span style="color:red;font-weight:bold">👎 ${vo.bad}</span></span></td>
			</tr>
			<tr>
				<td colspan="3" style="height:800px;" id="alal">${vo.content}</td>
			</tr>
		</table>
		<div class="bb">
			<c:if test="${sMid == vo.mid || sMid == 'admin'}">
				<input type="button" class="btn btn-secondary" value="수정" onclick="location.href='${ctp}/board/update?idx=${vo.idx}&curPage=${curPage}&listNum=${listNum}&search=${search}&boardSearch=${boardSearch}'"/>
				<input type="button" class="btn btn-secondary" value="삭제" onclick="del()"/>
			</c:if>
			<input type="button" class="btn btn-secondary" value="돌아가기" onclick="location.href='${ctp}/board/board?curPage=${curPage}&listNum=${listNum}&search=${search}&boardSearch=${boardSearch}'"/>
		</div>
		<!-- --------------- 댓글------------ -->
		<div id="reTitle">댓글</div>
		<div id="repl" >
			<table class="table table-border">
				<tr style="background-color: rgb(220, 220, 220); font-weight: bold;">
					<td style="width:5%;">no</td>
					<td style="width:50%; text-align: left;">내용</td>
					<td style="width:10%;">작성자</td>
					<td style="width:15%;">날짜</td>
					<td style="width:10%;">추천</td>
					<c:if test="${sMid == vo.mid}">
						<td style="width:10%;"></td>
					</c:if> 
				</tr>
				<c:forEach var="vo" items="${vos}" varStatus="st">
					<tr>
						<td>${st.count}</td>
						<td style="text-align: left;" id="con${vo.idx}" class="con${vo.idx}">${vo.content}</td>
						<td>${vo.name}</td>
						<td>${vo.WDate}</td>
						<td><span onclick="reGood(${vo.idx})" style="cursor: pointer;">❤ ${vo.good}</span></td>
						<c:if test="${sMid == vo.mid || sMid == 'admin'}">
							<td>
								<span class="btn3" onclick="reUpdate(${vo.idx})" >수정</span> l
								<span class="btn3" onclick="replyDel(${vo.idx})">삭제</span>
							</td>
						</c:if> 
					</tr>
				</c:forEach>
			</table>
			<form method="post" name="myForm">
				<c:if test="${sMid != null}">
					<div style="margin-top:100px;"> 
					<div style="text-align: left; margin-left:30px;" id="contentDiv">0 / 100</div>
						<textarea rows="5" cols="155" name="content" id="content" style="resize: none;" ></textarea>
						<div style="text-align: right;" id="rep"><input type="button" value="댓글쓰기" onclick="reply(${vo.idx})" class="btn btn-secondary"/></div>
						<div style="text-align: right; display: none;" id="upd"><input type="button" value="수정하기" onclick="reUpdateGo()" class="btn btn-secondary"/>
						<input type="button" value="취소하기" onclick="no()" class="btn btn-secondary"/></div>
					</div>
				</c:if>
				<input type="hidden" id="idxx"/>
			</form>
		</div>
		<!-- ------------------댓글-------------------- -->
	</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>		
</div>
</body>
</html>