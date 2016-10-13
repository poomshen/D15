<%@page import="com.d15.DAO.Member_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String m_phone = request.getParameter("phone");
	String m_id = request.getParameter("id");
	Member_DAO dao = new Member_DAO();

	String pwd = dao.pwRandom(m_id,m_phone);
	
	
%>
<%= pwd %>