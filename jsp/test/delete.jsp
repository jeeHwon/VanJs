<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
    
<%
	// 1. DB연결 (무조건 해주자)
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3307/jee";
	String user = "root";
	String password = "asdf1038";
	Connection conn = DriverManager.getConnection(url, user, password);
	
	// 1-1. 받을 값이 있다면 request로 받자
	String id = request.getParameter("id");
	// 2. 쿼리생성
	String sql = "delete from member where id="+id;
	// 3. 심부름꾼 생성
	Statement stmt = conn.createStatement();
	// 4. 쿼리 실행
	stmt.executeUpdate(sql);
	
	response.sendRedirect("list.jsp");
	
%>