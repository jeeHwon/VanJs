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

	// request 값 한글처리
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String age =request.getParameter("age");
	String juso = request.getParameter("juso");
	
	// String sql = "create table imsi(id int)";
	String sql = "insert into member(name, age, juso) values('"+name+"', "+age+", '"+juso+"')";
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	
	//list로 이동
	response.sendRedirect("list.jsp");
	
	// 웹페이지에 출력하기
	//out.print(name);
	//out.print(age);
	//out.print(juso);
%>
<