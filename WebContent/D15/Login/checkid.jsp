<!-- 
 * @Class : checkid.jsp
 * @Date : 2016.10.08
 * @Author : 길한종
 * @Desc : id체크하는 view
 -->


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=request.getParameter("id");
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "kosta2", "1004");
	String sql = "select m_id from D15_Member where m_id=?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, id);
	ResultSet rs = ps.executeQuery();

	if (rs.next()) {
		id="y";
	}

	rs.close();
	ps.close();
	con.close();
%>
<%=id%>
