<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>메인페이지</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript">
$(function(){		
		$("#mis_date").datepicker({
			  showOn: "button",
		      buttonImage: "images/calendar.gif",
		      buttonImageOnly: true,
		      buttonText: "Select date",
		      dateFormat: "yy-mm-dd"
		});
});
</script>
</head>

<body>
<div class="form-group" style="width:250px;">
     			 <label for="mis_date" style="float:left;" >실종 날짜</label>
      			 <input type="text" class="form-control" name="mis_date" id = "mis_date" placeholder="실종 날짜 선택.">
</div>
  
 
  
</body>
</html>