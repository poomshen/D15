<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script type="text/javascript">
 $(function(){
	 $("#basic").submit();
 })
</script>
</head>
<body>
<form id="basic" action="abandonmentPublic.keyurl" method="post">
<% 
Calendar sysdate = Calendar.getInstance();
Calendar sysdate2 = Calendar.getInstance();
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");
sysdate2.add(sysdate.DATE, -15);
DecimalFormat df = new DecimalFormat("00");
String strYear   = Integer.toString(sysdate2.get(Calendar.YEAR));
String strMonth  = df.format(sysdate2.get(Calendar.MONTH) + 1);
String strDay   = df.format(sysdate2.get(Calendar.DATE));
String strDate = strYear + strMonth + strDay;
%>
<input type="hidden" name="bgnde" value="<%= strDate%>">
<input type="hidden" name="endde" value="<%=  formatter.format(sysdate.getTime()) %>">
<input type="hidden" name="upkind" value="417000">
<input type="hidden" name="pageNo" value="1">
<input type="hidden" name="numOfRows" value="9">
<input type="hidden" name="kind">
<input type="hidden" name="upr_cd">
<input type="hidden" name="org_cd">
<input type="hidden" name="care_reg_no">
<input type="hidden" name="state">
</form>
</body>
</html>