<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	$(function() {
		$('#frm input[type=submit]').bind('click', function(e) {
			e.preventDefault()
			
			if ($('#name').val().length < 3){
				alert('이름은 3자 이상입니다')
				return false
			}
			if ($('#name').val().length > 5){
				alert('이름은 5자 이하입니다')
				return false
			}
			if (!$.isNumeric($('#age').val())              ){
				alert('숫자 형식으로 입력하세요')
				return false
			}
			if ($('#juso').val().length < 2){
				alert('주소는 2자 이상입니다')
				return false
			}
					
			$('#frm').submit();
		})
	})
	
</script>

</head>
<body>
	<!-- 이름 3자이상 5자 이하 , 나이는 숫자, 주소는 2자이상-->
	<form id="frm" method="post" action="write_ok.jsp" >
	이름<input type="text" name="name" id="name"><p>
	나이<input type="text" name="age" id="age"><p>
	주소<input type="text" name="juso" id="juso"><p>
		<input type="submit" value="저장">
	</form>
	<a href="list.jsp">글목록</a>
</body>
</html>