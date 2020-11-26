<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	//서버에서 데이터를 가져왔다 생각하고
	String name = "강백호";
	int age = 18;
	String juso = "춘천시";
%>

<body>
	이름 : <%=name %><p>
	나이 : <%=age %><p>
	주소 : <%=juso %><p>
	

</body>
</html>