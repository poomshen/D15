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
<script   src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<%-- <%
	Kind_DAO dao = new Kind_DAO();
	List<Kind_DTO> list = dao.selectKind();
	JSONArray jsonmember =  JSONArray.fromObject(list);
%> --%>
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
					$("#k_code").append("<option value =" + k_code + ">" + k_kind + "</option>");
				});
			}
		});

		$("#k_code").change(function() {
			
		});
	});
	

</script>
</head>
<body>
	<form action ="" name = "form" method = "post">
		견종 선택 : 
		<select name = "k_code" id = "k_code">
			<option>선택</option>			
		</select><br>
		성  별 : <input type = "radio" value = "m" name = "p_gender">수컷
			  <input type = "radio" value = "f" name = "p_gender">암컷 <br>
		색  상  : <input type = "text" name = "p_color"><br>
		특  징  : <textarea rows="5" cols="20" name = "p_feature"></textarea><br>	  
		나  이  : <input type = "text" name = "p_age"><br>
		체  중  : <input type = "text" name = "p_weight"><br>
		사진 첨부  : <input type = "file" name = "p_image"><br><br>
		<input type ="submit" value = "작성완료">
		<input type = "reset" value = "다시작성">
	</form>
</body>
</html>