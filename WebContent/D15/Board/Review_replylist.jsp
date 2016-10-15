<%@page import="com.d15.DTO.ReviewReply_DTO"%>
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
	int br_no=Integer.parseInt(request.getParameter("br_no"));

	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "kosta2","1004");
	String sql="select rer_no, m_id, br_no, rer_content, rer_date from D15_reply2 where br_no=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, br_no);

	rs = pstmt.executeQuery();
	List<ReviewReply_DTO> list=new ArrayList<ReviewReply_DTO>();
	
	while(rs.next()){
		ReviewReply_DTO dto=new ReviewReply_DTO();
		dto.setRer_no(rs.getInt(1));
		dto.setM_id(rs.getString(2));
		dto.setBr_no(rs.getInt(3));
		dto.setRer_content(rs.getString(4));
		String from = rs.getString(5);
		dto.setRer_date(from.substring(2, 10));
		
		list.add(dto);
	}
	JSONArray json = JSONArray.fromObject(list);
/* 	rs.close();
	pstmt.close();
	conn.close(); */
%>
<%=json%>