<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	//DB 연결
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3307/jee";
	String user = "root";
	String password = "asdf1038";
	Connection conn = DriverManager.getConnection(url, user, password);

	// limit에 들어갈 index 번호 생성
	int index; //limit에 전달할 index 값
	int pager; //page 는 jsp 에서 예약어라 변수 사용불가
	if (request.getParameter("pager") == null) {
		pager = 1;
	} else {
		pager = Integer.parseInt(request.getParameter("pager"));
	}
	//index 만들기
	index = (pager - 1) * 10;
	//쿼리 생성
	String sql = "select * from gesipan order by id desc limit " + index + ", 10";

	//심부름꾼 생성
	Statement stmt = conn.createStatement();

	//쿼리 실행 => ResultSet
	ResultSet rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
a{
	text-decoration:None;
	color:black;
}
a:hover{
	text-decoration:underline;
	color:crimson;
}
</style>
</head>
<body>
	<!-- 레코드 내용 출력 -->
	<table width="600">
		<tr>
			<td>이름</td>
			<td>제목</td>
			<td>성별</td>
			<td>작성일</td>

		</tr>
		<%
			while (rs.next()) {
				//숫자로 된 성별을 문자로 변환
				String sung = null;
				switch (rs.getInt("sung")) {
				case 0:
					sung = "남자";
					break;
				case 1:
					sung = "여자";
					break;
				case 2:
					sung = "선택안함";
				}
		%>
		<tr>
			<td><%=rs.getString("name")%></td>
			<td><a href="content.jsp?id=<%=rs.getString("id")%>"><%=rs.getString("title")%></a></td>
			<td><%=sung%></td>
			<td><%=rs.getString("writeday")%></td>

		</tr>
		<%
			}
		%>
		<!-- 사용자가 클릭하여 이동할 수 있는 페이지 출력 -->
		<tr>
			<td colspan="4" align="center">
				<%
					//총 페이지 값을 구하기 (총 레코드수 /페이지당 레코드수)
					sql = "select count(*) as cnt from gesipan";
					ResultSet rs2 = stmt.executeQuery(sql);
					rs2.next();
					int page_cnt = (int)Math.ceil(rs2.getInt("cnt")*0.1);
					
					int pstart = (int)Math.ceil(pager*0.1)*10-9;
					int pend = pstart + 9;

					if(page_cnt < pend){
						pend = page_cnt;
					}
				%>
				<!-- 이전 페이지 -->
				<!-- 현재 페이지 그룹 이전 10페이지 -->
				<%
					if (pstart!=1){
				%>
					<a href="list.jsp?pager=<%=pstart-1%>">☜</a>
				<%
					} else{
				%>
					☜
				<%
					}
				%>
				
				<!-- 현재 페이지 기준 1페이지 이전 -->
				<%
					if (pager !=1){
				%>
					<a href="list.jsp?pager=<%=pager-1%>">◀</a>
				<%
					} else{
				%>
					◀
				<%	
					}
				%>
				<%
					for (int i = pstart; i <= pend; i++) {
						String str = "";
						if(pager ==i){
							str="style='font-weight:bold;color:blue'";
						}
				%>
							<a href="list.jsp?pager=<%=i %>"<%=str %> ><%=i %></a>
				<%
					}
				%>
				<!-- 다음 페이지 -->
				<!-- 현재 페이지 기준 1페이지 이후 -->
				<%
					if (pager < page_cnt){
				%>
				<a href="list.jsp?pager=<%=pager+1%>">▶</a>
				<%
					}else{
				%>
					▶
				<%
					}
				%>
				<!-- 현재 페이지 기준 다음 그룹페이지 -->
				<%
					if(pend!=page_cnt){
				%>
				<a href="list.jsp?pager=<%=pend+1%>">☞</a>
				<%
					} else{
				%>
				☞
				<%
					}
				%>
			</td>
		</tr>


		<tr>
			<td colspan="2"><a href="write.jsp">글쓰기</a></td>
		</tr>

	</table>

</body>
</html>