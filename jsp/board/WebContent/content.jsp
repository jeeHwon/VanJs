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
	
	//request 값 읽어오기
	String id = request.getParameter("id");
	
	//조회수 증가
	String sql = "update board set hit=hit+1 where id="+id;
	
	//심부름꾼 생성
	Statement stmt = conn.createStatement();
	
	//쿼리실행
	stmt.executeUpdate(sql);
	
	//쿼리 생성
	sql = "select* from board where id="+ id;
	
	//심부름꾼 생성
	stmt = conn.createStatement();
	
	//쿼리 실행 =>ResultSet 이동
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
		
	//body에 출력
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
#del {
    position:absolute;
    visibility:hidden;
}
</style>
<script>
	function view_del(){
		//alert(event.clientX+" "+event.clientY)
		var x =event.clientX
		var y =event.clientY
		document.getElementById("del").style.visibility="visible"
		document.getElementById("del").style.left=(x-30)+"px"
		document.getElementById("del").style.top=(y+30)+"px"
		
	}
</script>
</head>
<body>
	<!-- ResultSet의 내용(name,title,content,hit,writeday을 출력 -->
	<table width="500" align="center">
		<tr align="center">
			<td>작성자</td>
			<td><%=rs.getString("name") %></td>
			<td>조회수</td>
			<td><%=rs.getString("hit") %></td>
			<td>작성일</td>
			<td><%=rs.getString("writeday")%></td>
		</tr>
		<tr>
			<td align="center">제목</td>
			<td colspan="5"><%=rs.getString("title")%></td>
		</tr>
		<tr height="300">
			<td align="center">내용</td>
			<td colspan="5"><%=rs.getString("content")%></td>
		</tr>
		<tr>
			<td colspan="6" align="center">
			<a href="update.jsp?id=<%=id%>">수정</a>
			<a href="#" onclick="view_del()">삭제</a>
			<a href="list.jsp">목록</a>
			</td>
		</tr>
		<%
        if(request.getParameter("chk") != null){
      	%>
      		<tr>
       			<td colspan="6" align="center"> 비번이 틀렸네요 </td>
      		</tr>
     	<%
        }
     	%>
	</table>
	
	<form method="post" action="delete.jsp" id="del">
			<input type="hidden" name="id" value="<%=id %>">
		비번 <input type="password" name="pwd" size="4">
			<input type="submit" value="삭제">
	</form>	
	
</body>
</html>
<%
stmt.close();
%>