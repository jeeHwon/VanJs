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
	
	//request 값 가져오기
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	//DB에 있는 비밀번호 가져오기
		//쿼리생성
	String sql = "select pwd from gesipan where id="+id;
		//심부름꾼 생성
	Statement stmt = conn.createStatement();
		//쿼리 실행
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	
	
	//**비밀번호 확인하기
	if (pwd.equals(rs.getString("pwd"))){
		//쿼리생성
		sql = "delete from gesipan where id="+id;
		//심부름꾼 생성
		stmt = conn.createStatement();
		//쿼리 실행
		stmt.executeUpdate(sql);
		//이동
		response.sendRedirect("list.jsp");
		
	} else{
		//이동
		response.sendRedirect("content.jsp?id="+id+"&chk=1");
	}
	stmt.close();
	
	
%>