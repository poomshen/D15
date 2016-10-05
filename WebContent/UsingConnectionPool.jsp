<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tomcat pool 설정 확인하기</title>
</head>
<body>
	<h3>Tomcat dbcp</h3>
	<%
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		///////////////////////////////////////
		// context.xml 기술된 connection pool 사용
		
		Context context=  new InitialContext();
		//약속된 표현 : java:comp/env
		//context.xml 에 resource tag 안쪽에 name 속성 값
		DataSource datasource = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
		conn = datasource.getConnection();
		
	///////////////////////////////////////////////////////////
		
		out.print("db연결여부 : " + conn.isClosed() + "<br>");
		conn.close(); // 반환
		out.print("db연결여부 : " + conn.isClosed() + "<br>");
	%>
</body>
</html>