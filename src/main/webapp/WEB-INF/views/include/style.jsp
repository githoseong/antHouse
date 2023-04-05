<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<style>
body {
	background-color: rgb(252, 252, 252);
}
#header {
	width:100%;
	height:400px;
	background-image: url("${ctp}/etc/개미굴.jpg");
	background-size: contain;
	border:1px solid white;
}
#title {
	text-align:center;
	margin:100px auto;
	letter-spacing:10px;
	font-size:80px;
    font-weight:bold;
    font-family: 'Song Myung', serif;
}
#title > a:hover {
	color:black;
}
#menu {
    margin:200px auto 0px auto;
    height: 50px;
    width:70%;
}
#menu2 li {
    float: left;
    margin-left: 100px;
    list-style: none;
    font-size: 25px;
    font-weight: 700;
    color: black;
}
a {
	text-decoration: none; color:black;
}
#menu2 li a:hover {
    color: skyblue;
}
#log {
	position:absolute;
	top:10px;
	right:70px;
	opacity: 0.7;
}
.overlay {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: rgb(0,0,0);
  background-color: rgba(0,0,0, 0.9);
  overflow-x: hidden;
  transition: 0.5s;
}

.overlay-content {
  width: 100%;
  margin-top: 30px;
}

.overlay a {
  padding: 8px;
  text-decoration: none;
  font-size: 36px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.overlay a:hover, .overlay a:focus {
  color: #f1f1f1;
}

.overlay .closebtn {
  position: absolute;
  top: 20px;
  right: 45px;
  font-size: 60px;
}

@media screen and (max-height: 450px) {
  .overlay a {font-size: 20px}
  .overlay .closebtn {
  font-size: 40px;
  top: 15px;
  right: 35px;
  }
}
#pho {
	width:45%;
	height:650px;
	margin-top:100px;
	border-radius: 100px;
	float:left;
}
.imga {
	width:100%;
	height:100%;
	border-radius: 100px;
}
.prod {
	cursor:pointer;
	position:absolute;
	border-radius:100px;
	width:60px; 
	height:60px; 
}
#txt {
	width:30%;
	height:650px;
	float:left;
	margin:80px auto auto 100px;
	color:white;
	font-size:20px;
	line-height:50px;
}
#footer {
	height:350px;
	background-color: rgb(252, 252, 252);
	border-top:1px solid lightGray;
}
#left {
	float:left;
	width:30%;
	height:100%;
	text-align:center;
	padding:10px;
}
#right {
	float:left;
	width:50%;
	height:100%;
	font-size:20px;
	margin:20px auto auto 100px;
	
	font-weight:bold;
	color:gray;
}
#foot {
	margin-left:500px;
}
#foot > ul > li {
	list-style: none;
    float: left;
    margin-left: 15px;
    font-size: 40px;
    color: rgb(158, 145, 145);
}
</style>