<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <c:set var="list" value="${requestScope.protectlist}" />
 <c:forEach var="list" items="${list }">
 <div>
 	${list.id } / ${list.name } / ${list.phone } / ${list.email } /${list.addr } /${list.petOk } /
 	${list.reqdate } / ${list.begdate } /${list.enddate } / <img alt="" src=""${list.img }> /
 	${list.code } /${list.count } /${list.date }
 </div>
 </c:forEach>
내일 모양  내요~
</body>
</html>