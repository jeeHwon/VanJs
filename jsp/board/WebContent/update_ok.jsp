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
	
	//request 값 가져오기(한글 있으면 utf-8 있어야해)
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
	
	//비밀번호 먼저 체크하기
	String sql = "select pwd from board where id="+id;
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	if(pwd.equals(rs.getString("pwd"))){
		//쿼리 생성
		sql = "update board set name=?, title=?, content=? where id=?";
		
		//심부름꾼 만들기
		pstmt.setString(1, name);
		pstmt.setString(2, title);
		pstmt.setString(3, content);
		pstmt.setString(4, id);
		
		//쿼리 생성
		pstmt.executeUpdate();
		
		//이동
		response.sendRedirect("content.jsp?id="+id);
	} else{
		response.sendRedirect("content.jsp?id="+id+"&chk=1");
	}
	
	pstmt.close();
	stmt.close();
	
%>