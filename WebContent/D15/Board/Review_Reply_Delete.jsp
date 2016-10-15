<!-- 
 * @Class : Review_Reply_Delete.jsp
 * @Date : 2016.10.14
 * @Author : 조한솔
 * @Desc : Q&A 게시판에서 답글 삭제기능을 위한 view
 -->

<%@page import="com.d15.DTO.ReviewReply_DTO"%>
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
	int re_no=Integer.parseInt(request.getParameter("rer_no"));
	int br_no=Integer.parseInt(request.getParameter("br_no"));

	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "kosta2","1004");
	String sql="delete from D15_reply2 where rer_no=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, re_no);
	int re = pstmt.executeUpdate();
	if(re > 0){
		
	}
/* 	List<ReviewReply_DTO> list = new ArrayList<ReviewReply_DTO>();
	if(re>0){
		sql="select rer_no, m_no, br_no, rer_content, rer_date from D15_reply2 where br_no=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, br_no);
		rs = pstmt.executeQuery();
		
	
		while(rs.next()){
			ReviewReply_DTO dto=new ReviewReply_DTO();
			dto.setRer_no(rs.getInt(1));
			dto.setM_no(rs.getInt(2));
			dto.setBr_no(rs.getInt(3));
			dto.setRer_content(rs.getString(4));
			String from = rs.getString(5);
			dto.setRer_date(rs.getString(6));
			
			list.add(dto);
		}
		
	}
	JSONArray json = JSONArray.fromObject(list); */
	
	rs.close();
	pstmt.close();
	conn.close();
%>
<%-- <%=json%> --%>