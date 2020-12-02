<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function execute(){
		document.getElementById("aa").src="2.jpg"
		document.getElementById("bb").type="password"
		document.getElementById("bb").style.background="yellow"
		document.getElementById("cc").type="checkbox"
	}
	function chg1(){
		document.getElementById("btn").style.background="white"
		document.getElementById("btn").style.color="#f15657"
	}
	function chg2(){
		document.getElementById("btn").style.background="#f15657"
		document.getElementById("btn").style.color="white"
	}
</script>
<style>
#btn{
	display:inline-block;
	width:200px;
	height:40px;
	text-align:center;
	border: 1px solid #f15657;
	color:white;
	padding-top:10px;
	
}
</style>
</head>
<body>
	<span id="btn" onmouseover="chg1()" onmouseout="chg2()">시작하기 </span>
	<input type="button" onclick="execute()" value="click"><p>
	<img src="1.jpg" width="200" id="aa"><p>
	<input type="text" id="bb"> <p>
	<input type="text" id="cc"> <p>

</body>
</html>