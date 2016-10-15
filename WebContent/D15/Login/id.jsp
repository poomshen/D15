<!-- 
 * @Class : id.jsp
 * @Date : 2016.10.12
 * @Author : 박문수
 * @Desc : id찾기
 -->

<%@page import="com.d15.DAO.Member_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String m_phone = request.getParameter("phone");
	int m_birth = Integer.parseInt(request.getParameter("birth"));
	Member_DAO dao = new Member_DAO();

	String id = dao.idSearch(m_birth, m_phone);
%>
<%= id %>