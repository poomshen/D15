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
<html style="margin-bottom: 40px; margin-top: 100px">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>살아나개 사랑할개</title>

<script>


	$(function(){
	
		 $( "#mis_date" ).datepicker({
		      showOn: "button",
		      buttonImage: "../../images/calendar.gif",
		      buttonImageOnly: true,
		      buttonText: "Select date",
		      dateFormat: "yy-mm-dd"
		    });
	});	
		 
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
		
	 
		$("#button1").click(function(){
			if( $.trim($("#k_kind").val()) == '선택' ){
		        alert("견종을 알려주세요.");
		        $("#k_kind").focus();
		        return false;
		        
			 }else if( $.trim($("#p_color").val()) == '' ){
			        alert("강아지의 색은요.");
			        $("#p_color").focus();
			        return false;
			        
			 }else if( $.trim($("#p_image").val()) == '' ){
			        alert("강아지의 사진좀 보여줘");
			        $("#p_image").focus();
			        return false;
			        
			 }else if( $.trim($("#mis_date").val()) == '' ){
		        alert("실종 날짜를 알려주세요.");
		        $("#mis_date").focus();
		        return false;
		        
			 }else if( $.trim($("#mis_loc").val()) == '' ){
				alert("실종 위치를 알려주세요.");
			    $("#mis_loc").focus();
			    return false;
			 
			 }else{
				 alert("실종 신고가 완료 되었습니다.");
				 return true;
			 }
			
		});
		
		$("#button2").click(function(){
			 
			 location.href = "BoardList.missing";
		});
		
	


</script>
</head>

<body>
	<header>
		<jsp:include page="../../include/header.jsp" />
	</header>
	<div class="container">
		<h1>실종견 신고</h1>
		<hr />
		<br>
		<br>
		<form action="BoardWriteOk1.missing" name="form" id="form"
			method="post" enctype="multipart/form-data">
		<div class="form-group">
			<div class="col-sm-1"></div>
			<label for="k_kind" class="control-label col-sm-1"
				style="float: left;">견 종</label>
			<div class="col-sm-3">
				<select name="k_kind" id="k_kind" class="form-control">
					<option>선택</option>
				</select>
			</div>
			<div class="col-sm-2"></div>

			<label for="p_color" class="control-label col-sm-1"
				style="float: left;">색 상</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" name="p_color" id="p_color"
					placeholder="색상을 적어주세요.">
			</div>

			<div class="col-sm-3"></div>
		</div>
		<br>
		<br>
		<br>

		<div class="form-group">
			<div class="col-sm-1"></div>
			<label for="p_age" class="control-label col-sm-1"
				style="float: left;">나 이</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" name="p_age" id="p_age"
					placeholder="나이를 적어주세요.">
			</div>

			<div class="col-sm-2"></div>

			<div class="col-sm-1"></div>

			<label for="mis_date" class="control-label col-sm-1"
				style="float: left;">실종 날짜</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" name="mis_date"
					id="mis_date" placeholder="실종 날짜 선택.">
			</div>
		</div>
		<div class="col-sm-3"></div>
		<br>
		<br>
		<br>

		<div class="form-group">
			<div class="col-sm-1"></div>
			<label for="p_gender" class="control-label col-sm-1"
				style="float: left;">성 별</label>
			<div class="col-sm-2">
				<input type="radio" value="m" name="p_gender" checked>수컷 <input
					type="radio" value="f" name="p_gender">암컷
			</div>


			<div class="col-sm-2"></div>

			<div class="col-sm-1"></div>
			<label for="mis_loc" class="control-label col-sm-1"
				style="float: left;">실종 위치</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" name="mis_loc" id="mis_loc"
					placeholder="위치를 적어주세요.">
			</div>

		</div>

		<div class="col-sm-3"></div>
		<br>
		<br>
		<br>

		<div class="form-group">
			<div class="col-sm-1"></div>

			<label for="p_feature" class="control-label col-sm-1"
				style="float: left;">특 징</label>
			<div class="col-sm-2">
				<textarea rows="5" cols="10" name="p_feature" class="form-control"></textarea>
			</div>

			<div class="col-sm-2"></div>

			<div class="col-sm-1"></div>
			<label for="mis_content" class="control-label col-sm-1"
				style="float: left;">내 용</label>
			<div class="col-sm-2">
				<textarea rows="5" cols="20" name="mis_content" class="form-control"></textarea>
			</div>
		</div>
		<div class="col-sm-3"></div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>

		<div class="form-group">
			<div class="col-sm-1"></div>
			<label for="p_weight" class="control-label col-sm-1"
				style="float: left;">체 중</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" name="p_weight"
					id="p_weight" placeholder="체중을 적어주세요.">
			</div>
			<div class="col-sm-2"></div>

			<div class="col-sm-1"></div>
			<label for="p_image" class="control-label col-sm-1"
				style="float: left;">사진 첨부</label>
			<div class="col-sm-2">
				<input type="file" name="p_image" id="p_image">
			</div>


		</div>
		<div class="col-sm-3"></div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<div class="form-group" style="text-align: center">
			<input type="submit" value="작성완료" id="button1"
				class="btn btn-primary"> <input type="reset" value="다시작성"
				class="btn btn-default"> <input type="button" value="목록으로"
				id="button2" class="btn btn-default">
		</div>

	</form>
	</div>

	<footer>
		<jsp:include page="../../include/footer.jsp" />
	</footer>
</body>
</html>