<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
	//사용자가 클릭한 레코드의 값을 읽어와서 폼태그의 value에 전달
	//DB 연결 (DB정보, 아이디, 비밀번호)
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3307/jee";
	String user = "root";
	String password = "asdf1038";
	Connection conn = DriverManager.getConnection(url, user, password);

	// 조건문에 들어갈 id 값을 request
	String id = request.getParameter("id");
	
	//쿼리생성
	String sql = "select * from member where id="+id;
	
	//심부름꾼 만들기
	Statement stmt = conn.createStatement();
	
	//쿼리실행
	ResultSet rs = stmt.executeQuery(sql);	//select 는 executeQuery
	
	//사용자가 클릭한 레코드의 값을 읽어와서 폼태그의 value에 전달
	rs.next();

	
%>
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
	<form method="post" action="update_ok.jsp">
		<input type="hidden" name="id" value="<%=id%>">
	이름<input type="text" name="name" value="<%=rs.getString("name")%>"><p>
	나이<input type="text" name="age" value="<%=rs.getString("age")%>" ><p>
	주소<input type="text" name="juso" value="<%=rs.getString("juso")%>"><p>
		<input type="submit" value="수정">
	</form>
	<a href="list.jsp">글목록</a>
</body>
</html>