<!-- 
 * @Class : Board_Modify.jsp
 * @Date : 2016.10.12
 * @Author : 조한솔
 * @Desc : Q&A 게시판에서 댓글 삭제기능을 위한 view
 -->


<%@page import="com.d15.DTO.BoardReply_DTO"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.logging.SimpleFormatter"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<% 
	int re_no=Integer.parseInt(request.getParameter("re_no"));
	int b_no=Integer.parseInt(request.getParameter("b_no"));

	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "kosta2","1004");
	String sql="delete from D15_reply where re_no=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, re_no);
	pstmt.executeUpdate();

	rs.close();
	pstmt.close();
	conn.close();
%>
