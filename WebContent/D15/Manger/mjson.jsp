<%@page import="com.d15.DTO.MemberSearch_DTO"%>
<%@page import="com.d15.DTO.MemberJoin_DTO"%>
<%@page import="com.d15.DAO.Member_DAO"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String search = request.getParameter("search");
	Member_DAO dao = new Member_DAO();
	List<MemberSearch_DTO> list = dao.MemberSearch(search);
	System.out.println(list);
	JSONArray jsonmember =  JSONArray.fromObject(list);
%>
<%=jsonmember%>