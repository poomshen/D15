<%@page import="net.sf.json.JSONArray"%>
<%@page import="com.d15.DTO.Kind_DTO"%>
<%@page import="java.util.List"%>
<%@page import="com.d15.DAO.Kind_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Kind_DAO dao = new Kind_DAO();
	List<Kind_DTO> list = dao.selectKind();
	JSONArray jsonmember =  JSONArray.fromObject(list);
%>
<%= jsonmember%>