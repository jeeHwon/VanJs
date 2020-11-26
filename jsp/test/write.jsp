<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function check(my){
		if(my.name.value.length < 3 || my.name.value.length > 5){
			alert("이름 길이를 확인하세요")
			return false
		} else if (isNaN(my.age.value) || my.age.value.length == 0){
			alert("나이는 숫자로 적으세요")
			return false
		} else if(my.juso.value.length < 2){
			alert("주소는 2자 이상으로 적으세요")
			return false
		} else{
			return true
		}
	}
</script>

</head>
<body>
	<!-- 이름 3자이상 5자 이하 , 나이는 숫자, 주소는 2자이상-->
	<form method="post" action="write_ok.jsp" onsubmit="return check(this)">
	이름<input type="text" name="name" id="name"><p>
	나이<input type="text" name="age" id="age"><p>
	주소<input type="text" name="juso" id="juso"><p>
		<input type="submit" value="저장">
	</form>
	<a href="list.jsp">글목록</a>
</body>
</html>