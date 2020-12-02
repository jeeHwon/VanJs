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
	
	//request 값
	request.setCharacterEncoding("utf-8");
	String name = "아이유";
	String title = "좋은날";
	String pwd = "1";
	String content = "좋은걸 어떡해";
	String sung = "2";
	String hobby = "1, 4";
	String birth = "2010";
	
	for (int i=0 ; i < 1000; i++){
		//쿼리 생성
		String sql = "insert into gesipan(name, title, pwd, content, sung, hobby, birth, writeday )";
		sql = sql + " values(?,?,?,?,?,?,?,now())";
		
		//심부름꾼 생성
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name+i);
		pstmt.setString(2, title+" "+i);
		pstmt.setString(3, pwd);
		pstmt.setString(4, content);
		pstmt.setString(5, sung);
		pstmt.setString(6, hobby);
		pstmt.setString(7, birth);
		
		//쿼리 실행
		pstmt.executeUpdate();
		
	}
	
	
	//이동(list.jsp)
	response.sendRedirect("list.jsp");
%>