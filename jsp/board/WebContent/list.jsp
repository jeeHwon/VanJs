<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
	//DB 연결
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3307/jee";
	String user = "root";
	String password = "asdf1038";
	Connection conn = DriverManager.getConnection(url, user, password);
	//지금은 request 필요 없음
	
	//쿼리 생성
	String sql = "select * from board order by id desc";
	
	//심부름꾼 만들기
	Statement stmt = conn.createStatement();
	
	//쿼리 실행 후 결과를 ResultSet으로
	ResultSet rs = stmt.executeQuery(sql);

%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
td{
	border:1px solid #cccccc;
}

</style>
</head>
<body>
	<!-- title, content, name, pwd, hit, writeday -->
	<table width="600" align="center">
	<tr align="center">
		<td>작성자</td>
		<td>제목</td>
		<td>조회수</td>
		<td>작성일</td>
		
	</tr>
	<%
	while(rs.next()){
	%>
	<tr>
		<td align="center"><%=rs.getString("name")%></td>
		<td><a href="content.jsp?id=<%=rs.getString("id")%>"><%=rs.getString("title")%></a></td>
		<td align="center"><%=rs.getString("hit")%></td>
		<td align="center"><%=rs.getString("writeday")%></td>
	</tr>
	<%
	}
	%>
	<tr>
		<td colspan="4" align="center"><a href="write.jsp">글쓰기</a></td>
	</tr>
	</table>
	

</body>
</html>
<%
stmt.close();
%>


