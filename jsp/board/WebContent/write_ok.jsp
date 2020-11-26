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
	
	//입력할값 가져오기
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
		
	//쿼리생성
	String sql = "insert into board(title,name,content,pwd,writeday) ";
	sql = sql + " values(?, ?, ?, ?, now())";
		
	//심부름꾼 생성
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,title);
	pstmt.setString(2,name);
	pstmt.setString(3,content);
	pstmt.setString(4,pwd);
	
	//쿼리 실행
	pstmt.executeUpdate();	//preparedstmt는 객체 만들때 이미sql 넣었으니 여기선 안넣어줘
	
	//이동하고 싶은 문서
	response.sendRedirect("list.jsp");
	
%>







