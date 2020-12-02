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
	String name = request.getParameter("name");
	String title = request.getParameter("title");
	String pwd = request.getParameter("pwd");
	String content = request.getParameter("content");
	String sung = request.getParameter("sung");
	String hobby = String.join(",", request.getParameterValues("hobby"));
	String birth = request.getParameter("birth");

	//쿼리 생성
	String sql = "insert into gesipan(name, title, pwd, content, sung, hobby, birth, writeday )";
	sql = sql + " values(?,?,?,?,?,?,?,now())";
	
	//심부름꾼 생성
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, title);
	pstmt.setString(3, pwd);
	pstmt.setString(4, content);
	pstmt.setString(5, sung);
	pstmt.setString(6, hobby);
	pstmt.setString(7, birth);
	
	//쿼리 실행
	pstmt.executeUpdate();
	
	
	//이동(list.jsp)
	response.sendRedirect("list.jsp");
%>