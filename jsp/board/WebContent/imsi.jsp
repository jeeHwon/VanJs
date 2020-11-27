<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
li{
	list-style-type:none;
}
</style>
<script>
	function view(){
		//display 속성 : none, inline, block, inline-block
		document.getElementById("aa").style.display="block"
	}
	function view2(){
		//vibility 속성: hidden, visible
		document.getElementById("bb").style.visibility="visible"
	}


</script>
</head>
<body>
	<a href="javascript:view()">보이기</a><p>
	<ul>
		<li>대방어</li>
		<li style="display:none;" id="aa">참돔</li>
		<li>감성돔</li>
		<li>갈치</li>
		<li>광어</li>
	
	</ul>
	<hr>
	<a href="javascript:view2()">보이기</a><p>
	<ul>
		<li>삼겹살</li>
		<li style="visibility:hidden;" id="bb">항정살</li>
		<li>가브리살</li>
		<li>목살</li>
		<li>갈매기살</li>
	</ul>

</body>
</html>