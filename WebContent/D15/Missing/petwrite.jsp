<%-- 
	@JSP : petwrite.jsp
	@Date : 2016-10-05
	@Author : 박문수
	@Desc : 실종 신고 게시판의 글쓰기를 위한 jsp 페이지
--%>
<%@page import="com.d15.DTO.Kind_DTO"%>
<%@page import="java.util.List"%>
<%@page import="com.d15.DAO.Kind_DAO"%>
<%@page import="net.sf.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script type="text/javascript">
	$(function(){
		$.ajax({
			type:"get",
			url:"json.jsp",
			dataType:"json",
			success:function(data){
				$.each(data, function(index, item) {
					console.log(item.k_code + "/" + item.k_kind);
					var k_code = item.k_code;
					var k_kind = item.k_kind;
					$("#k_kind").append("<option value =" + k_code + ">" + k_kind + "</option>");
				});
			}
		});
		
		$("#mis_date").datepicker({
			  showOn: "button",
		      buttonImage: "../../images/calendar.gif",
		      buttonImageOnly: true,
		      buttonText: "Select date",
		      dateFormat: "yy-mm-dd"
		});
		
	});
	

</script>
</head>
<body>
	<form action ="BoardWriteOk.missing" name = "form" method = "post">
		견종 선택 : 
		<select name = "k_kind" id = "k_kind">
			<option>선택</option>		
		</select><br>
		성  별 : <input type = "radio" value = "m" name = "p_gender">수컷
			  <input type = "radio" value = "f" name = "p_gender">암컷 <br>
		색  상  : <input type = "text" name = "p_color"><br>
		특  징  : <textarea rows="5" cols="20" name = "p_feature"></textarea><br>	  
		나  이  : <input type = "text" name = "p_age"><br>
		체  중  : <input type = "text" name = "p_weight"><br>
		사진 첨부  : <input type = "file" name = "p_image"><br>
		실종 날짜 : <input type = "text" name = "mis_date" id ="mis_date"><br>
		실종 위치 : <input type = "text" name = "mis_loc"><br>
		내 용 : <textarea rows="5" cols="20" name = "mis_content"></textarea>
		<input type ="submit" value = "작성완료">
		<input type = "reset" value = "다시작성">
	</form>
</body>
</html>