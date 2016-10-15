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
	
	/* sql="select re_no, m_id, b_no, re_content, re_date from D15_reply where b_no=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, b_no);
	rs = pstmt.executeQuery();
	
	List<BoardReply_DTO> list=new ArrayList<BoardReply_DTO>();
	
	while(rs.next()){
		BoardReply_DTO dto=new BoardReply_DTO();
		dto.setRe_no(rs.getInt(1));
		dto.setM_id(rs.getString(2));
		dto.setB_no(rs.getInt(3));
		dto.setRe_content(rs.getString(4));

		String from = rs.getString(5);
		dto.setRe_date(from.substring(2, 10));
		
		list.add(dto);
	}
	JSONArray json = JSONArray.fromObject(list); */
	rs.close();
	pstmt.close();
	conn.close();
%>
<%-- <%=json%> --%>