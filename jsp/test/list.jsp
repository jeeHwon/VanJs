<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<% 
	//DB 연결 (DB정보, 아이디, 비밀번호)
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3307/jee";
	String user = "root";
	String password = "asdf1038";
	Connection conn = DriverManager.getConnection(url, user, password);
	
	//쿼리생성
	String sql = "select * from member";
	
	//심부름꾼(DB에 갔다 올수 있는 클래스)
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
 %> 
    
    
<!DOCTYPE html>
<html>
<head>	<!-- list.jsp -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table width="400" align="center">
	<tr>
		<td>이름</td>
		<td>나이</td>
		<td>주소</td>
		<td>삭제</td>
		<td>수정</td>
		
	</tr>
<%
	while(rs.next()){
%>
	
	<tr>
		<td><%=rs.getString("name") %></td>
		<td><%=rs.getString("age") %></td>
		<td><%=rs.getString("juso") %></td>
		<td><a href="delete.jsp?id=<%=rs.getString("id")%>">클릭</a></td>
		<td><a href="update.jsp?id=<%=rs.getString("id")%>">클릭</a></td>
		
	</tr>
	
	
<%
	}
%>
<tr>
<td colspan="3" align="center"><a href="write.jsp">글쓰기</a></td>
</tr>
</table>


</body>
</html>