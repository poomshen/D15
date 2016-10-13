<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-3.1.1.min.js" ></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
//setInterval(function() { console.log("돈다")} ,100);


$(function(){
	$("#dd").click(function(){
		window.open("InputMessagefrom.jsp","","width=300 height=400");
	})
});
</script>
<div style="background-image: url('../../images/message.gif') ;background-size:100%; width:30px;text-align:right; " id="message_new"><h3 style="color: green;"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4</b></h3></div>
<input type="button" value="버튼" id="dd">
</body>
</html>