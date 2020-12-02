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
	//request 값 가졍괴
	String id = request.getParameter("id");
	
	//쿼리 생성
	String sql = "select * from gesipan where id="+id;
	
	//심부름꾼 생성
	Statement stmt = conn.createStatement();
	
	//쿼리 실행 => ResultSet
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	//하나의 레코드를 읽어와서 폼태그에 전달
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	//성별, 취미, 태어난 해를 적용하여 처음 선택했던 값으로 표현되게
	function init(){
		//성별
		document.frm.sung[<%=rs.getInt("sung")%>].checked=true
		
		//취미 : 0, 2, 4
		var hob = "<%=rs.getString("hobby")%>"
		var hobby = hob.split(",")
		for(i=0; i<hobby.length; i++){
			document.frm.hobby[hobby[i]].checked=true
		}
		
		//태어난 해
		document.frm.birth.value=<%=rs.getString("birth")%>
	}

</script>
</head>
<body onload="init()">
	<form name="frm" method="post" action="update_ok.jsp">
		<input type="hidden" name="id" value="<%=id%>">
		<table width="600" align="center">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" size="40" value="<%=rs.getString("title")%>"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%=rs.getString("name")%>"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="40" rows="5" name="content"></textarea></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="sung" value="0">남자 
					<input type="radio" name="sung" value="1">여자 
					<input type="radio"	name="sung" value="2">선택안함
				</td>
			</tr>
			<tr>
				<td>취미</td>
				<td><input type="checkbox" name="hobby" value="0">서핑 <input
					type="checkbox" name="hobby" value="1">독서 <input
					type="checkbox" name="hobby" value="2">여행 <input
					type="checkbox" name="hobby" value="3">음주 <input
					type="checkbox" name="hobby" value="4">잠자기 <input
					type="checkbox" name="hobby" value="5">게임</td>
			</tr>

			<tr>
				<td>태어난 해</td>
				<td><select name="birth">
					<%
						for(int i=2020; i>=1960; i--){
					%>
						<option value="<%=i%>"><%=i %></option>
					<%
						}
					%>	
				</select></td>
			</tr>
			<tr>
			<td colspan="2" align="center">
				<input type="submit" value="수정하기">
			</td>
			</tr>
		</table>
	</form>

</body>
</html>