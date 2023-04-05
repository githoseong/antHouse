<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
<script>

let today = new Date();
let month2 = today.getMonth()+1;
let year2 = today.getFullYear(); 
let day2 = today.getDay();
let date2 = today.getDate();
let calTitle = $('#calTitle').html();
let years = $('#years').html();
let jsonResult;
	/* let vos = JSON.parse('${vos}');*/
	
	window.onload = function() {
		CalendarMove();
	}
	$(function(){
		$('#years').html(year2);
		$('#calTitle').html(month2);
		$('#choYear').val(year2);
		$('#choMonth').val(month2);
		
		
		$('#leftYear').on("click",function(){
			if(year2 > 2000 ) {
				$('#years').html(--year2);
				$('#choYear').val(year2);
				$('#day2').html("");
				CalendarMove();
			}
		});
		
		$('#rightYear').on("click",function(){
			if(year2 < 2100) {
				$('#years').html(++year2) ;
				$('#choYear').val(year2);
				$('#day2').html("");
				CalendarMove();
			}
		});
		
		$('#leftdiv').on("click",function(){
			if(month2 > 0 ) {
				$('#calTitle').html(--month2);
				$('#choMonth').val(month2);
				$('#day2').html("");
				CalendarMove();
			}
			if(month2 == 0) {
				month2 = 12; 
				$('#calTitle').html(month2);
				$('#choMonth').val(month2);
				$('#years').html(--year2);
				$('#choYear').val(year2);
				CalendarMove();
			}
		});
		
		$('#rightdiv').on("click",function(){
			if(month2 < 13) {
				$('#calTitle').html(++month2);
				$('#choMonth').val(month2);
				$('#day2').html("");
				CalendarMove();
			}
			if(month2 == 13) {
				month2 = 1;
				$('#calTitle').html(month2);
				$('#choMonth').val(month2);
				$('#years').html(++year2) ;
				$('#choYear').val(year2);
				CalendarMove();
			}
		});
		
		$('select').on("change",function(){
			$('#years').html($('#choYear').val());
			$('#day2').html("");
			year2 = $('#choYear').val();
			$('#calTitle').html($('#choMonth').val());
			month2 = $('#choMonth').val();
			CalendarMove();
		});
	});
	function CalendarMove() {
		let cnt = 0;
		let query = {
				year : $('#years').html(),
				month : $('#calTitle').html()
				};
		$.ajax({
			type : "post",
			url  : "${ctp}/calendar/calendar",
			data : query,
			dataType: 'json',
			success: function(data) {
				jsonResult = data;
				
				for(let i=1; i<=jsonResult.vos[0].week; i++) {
					$('#day2').append("<div style='width:14.28%; height:16.5%; float:left;border:1px solid lightgray; '></div>");
				}
				for(let i=1; i<=1000; i++) {
					if(cnt < jsonResult.vos.length) {
						for(let k=1; k<=jsonResult.vos.length; k++) {
							cnt++;
							if(k < 10) {
								$('#day2').append("<div style='width:14.28%; height:16.5%; float:left;border:1px solid lightgray; font-size:25px;overflow: auto' id='" + k + "'>"+"0"+k+"</div>");
							}
							else {
								$('#day2').append("<div style='width:14.28%; height:16.5%; float:left;border:1px solid lightgray; font-size:25px;overflow: auto' id='" + k + "'>" + k + "</div>");
							}
							if(k == date2 && today.getMonth()+1 == jsonResult.vos[0].month && today.getFullYear() == jsonResult.vos[0].year) {
								$('#'+k+'').css({"font-weight":"bold","border":"4px solid"});
							}
						}
					}
					for(let j=1; j<=31; j++) {
				  	if(jsonResult.spDay.indexOf(''+j+'') != -1 ) {
						  if($('#choYear').val() == jsonResult.spYear[i-1] && $('#choMonth').val() == jsonResult.spMonth[i-1] && j == jsonResult.spDay[i-1]) {
							  console.log("j : "+j);
								$('#'+j+'').append("<div><div style='font-size:16px; font-weight:bold;'><a href='${ctp}/calendar/calendarCon?flag=0&idx="+jsonResult.vos2[i-1].idx+"'>"+jsonResult.vos2[i-1].title+"</a></div></div>");
						  }
					  }  
				 	}
				}
				for(let i=1; i<=42 - (jsonResult.vos[0].week + jsonResult.vos.length); i++) {
					$('#day2').append("<div style='width:14.28%; height:16.5%; float:left;border:1px solid lightgray; '></div>");
				}
			},
			error : function() {
			}
		})
	}
</script>
</head>
<jsp:include page="/WEB-INF/views/include/style.jsp"/>
<style>
#section {
	margin:150px auto 400px;
	width:70%;
}
#title2 {
	height:100px;
	font-size:60px;
	font-weight: bold;
	text-align: center;
	font-family: 'Song Myung', serif;
}
#calMain {
	width:100%;
	height:1000px;
	border:1px solid;
	margin-top:10px;
}
#calTitle {
	height:100%;
	text-align: center;
	font-size:60px;
	font-weight: bold;
	float:left;
	width:88%;
	
}
#leftdiv {
	float:left;
	width:6%;
	font-size:60px;
}
#rightdiv {
	float:left;
	width:6%;
	font-size:60px;
	text-align: right;
}
#years {
	font-size:70px;
	font-weight: bold;
	color:gray;
	float:left;
}
#leftYear {
	float:left;
	font-size:40px;
	margin:30px 10px auto 30px;
}
#rightYear {
	float:left;
	font-size:40px;
	margin:30px auto auto 10px;
}
#yearTitle {
	height:100px; 
	width:35%;
	margin:30px auto 0px 590px;
	text-align: center;
}
#month {
	margin-bottom: 100px;
}
#day {
	height:60px;
}
.dayPart {
	width:14.28%;
	border:1px solid;
	float:left;
	text-align: center;
	font-size:25px;
	font-weight: bold;
	height:100%;
	padding-top:10px;
}
#day2 {
	border:1px solid;
	height:84%;
}
#optionn {
	float:left;
	height:100%;
	padding-top:45px;
	margin-left:30px;
}
.choCal {
	height:35px;
	width:90px;
	font-size:25px;
	text-align: center;
}
#input1 {
	text-align: right;
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	<div id="section">
	<div id="title2">일정표</div>
		<div id="yearTitle">	
			<div id="leftYear"><i class="fa-solid fa-chevron-left"></i> </div>
				<div id="years"></div>
			<div id="rightYear"><i class="fa-solid fa-chevron-right"></i> </div>
			<div id="optionn">
				<select name="choYear" class="choCal" id="choYear" >
					<c:forEach var="i" begin="2001" end="2099">
						<option>${i}</option>
					</c:forEach>
				</select>
				<select name="choMonth" class="choCal" id="choMonth" >
					<c:forEach var="i" begin="1" end="12">
							<option>${i}</option>
					</c:forEach>
				</select>
			</div>
		</div>
			<c:if test="${sMid != null}">
				<div id="input1"><input type="submit" value="일정등록" class="btn btn-secondary" onclick="location.href='${ctp}/calendar/calendarInput'"/> </div>
			</c:if>
		<div id="calMain">
			<div id="month">
				<div id="leftdiv"><i class="fa-solid fa-chevron-left"></i> </div>
						<div id="calTitle"></div>
				<div id="rightdiv"><i class="fa-solid fa-chevron-right"></i> </div>
			</div>
			<div id="day">
				<div class="dayPart" style="color:blue">일</div>
				<div class="dayPart">월</div>
				<div class="dayPart">화</div>
				<div class="dayPart">수</div>
				<div class="dayPart">목</div>
				<div class="dayPart">금</div>
				<div class="dayPart" style="color:red">토</div>
			</div>
			<div id="day2">
			</div>
		</div>
	</div>
	
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>	
</div>
</body>
</html>