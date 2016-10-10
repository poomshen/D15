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


<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>살아나개 사랑할개</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO" />

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300,600,400italic,700' rel='stylesheet' type='text/css'>
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="http://kosta129.esy.es/elate/css/animate.css">
	<!-- Icomoon Icon Fonts -->
	<link rel="stylesheet" href="http://kosta129.esy.es/elate/css/icomoon.css">
	<!-- Simple Line Icons -->
	<link rel="stylesheet" href="http://kosta129.esy.es/elate/css/simple-line-icons.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="http://kosta129.esy.es/elate/css/magnific-popup.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="http://kosta129.esy.es/elate/css/bootstrap.css">

	
	<!-- Default Theme Style 
	You can change the style.css (default color purple) to one of these styles
	
	1. pink.css
	2. blue.css
	3. turquoise.css
	4. orange.css
	5. lightblue.css
	6. brown.css
	7. green.css -->

	
	<link rel="stylesheet" href="http://kosta129.esy.es/elate/css/style.css">
	<link rel="stylesheet" id="theme-switch" href="http://kosta129.esy.es/elate/css/style.css">
	<link rel="stylesheet" href="http://kosta129.esy.es/elate/css/demo.css">

	<!-- Modernizr JS -->
	<script src="http://kosta129.esy.es/elate/js/modernizr-2.6.2.min.js"></script>
	
<!-- 	 10월 5일 지율 추가 시작 
   Bootstrap Core CSS -->
    <link href="boot2/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

   <!--  Theme CSS -->
    <link href="boot2/css/freelancer.min.css" rel="stylesheet">

   <!--  Custom Fonts -->
    <link href="boot2/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
   
   
  <style>
.navbar-custom {
	background: #ffffff;
}

.navbar-custom .navbar-nav li a, header {
	color: #000000;
}

header .container {
	padding-top: 10px;
	padding-bottom: 10px;
}

#fh5co-home .text-inner h1, #fh5co-home .text-inner h2, #fh5co-home .text-inner h3,
	#fh5co-home .text-inner h2 a {
	/* font-size: 50px; */
	color: #000000;
	margin: 0 0 20px 0;
}


#fh5co-home .text-inner #lgform {
	/* font-size: 50px; */
	color: #3f95ea;
	margin: 0 0 20px 0;
}

#fh5co-home {
	background-color: transparent;
	background-size: cover;
	background-attachment: fixed;
	position: relative;
	width: 100%;
	background-color: #fff;
	color: #000000;
	overflow: hidden;
}

.form-group {
    margin: 30px 0;
}

.form-control {   
    width: 250px;
    align:center;
    }

</style>  
  <!--  10.05 지율 추가  끝
 -->

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
		
	});


</script>
</head>

	<%
		pageContext.include("../../include/header.jsp");
	%>
	<!-- <section id="fh5co-home" data-stellar-background-ratio="0.5">
	<div class="container">
		<div class="text-wrap">
			<div class="text-inner">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h1 class="to-animate">실종신고</h1>
						<h2 class="to-animate">작성</h2>
					</div> -->
					<!-- <div class="col-md-8 col-md-offset-2"> -->
							<center>
							<form action="BoardWriteOk1.missing" name="form" id="form"
								method="post" enctype="multipart/form-data">
								
								<br><br><br><br><br><br><br>
								<label for ="k_kind">견 종</label>
								<select name="k_kind" id="k_kind">
								<option>선택</option>
								</select><br><br>
								
								<label for = "p_gender">성 별</label>&nbsp;
								<input type="radio" value="m" name="p_gender" checked>수컷
								<input type="radio" value="f" name="p_gender">암컷 <br>
								
								<div class="form-group" style="width:250px;">
     								 <label for="p_color" style="float:left;" >색 상</label>
      								 <input type="text" class="form-control" name="p_color" id = "p_color" placeholder="색상을 적어주세요.">
       							</div>
       							
       							
								<div class="form-group" style="width:250px;">
     								 <label for="p_feature" style="float:left;" >특 징</label>
									<textarea rows="5" cols="20" name="p_feature" class="form-control"></textarea>
       							</div>
								
								<div class="form-group" style="width:250px;">
     								 <label for="p_age" style="float:left;" >나 이</label>
      								 <input type="text" class="form-control" name="p_age" id = "p_age" placeholder="나이를 적어주세요.">
       							</div>
       							
       							<div class="form-group" style="width:250px;">
     								 <label for="p_weight" style="float:left;" >체 중</label>
      								 <input type="text" class="form-control" name="p_weight" id = "p_weight" placeholder="체중을 적어주세요.">
       							</div>
       							
       							<label for = "p_image">사진 첨부</label>
								<input type="file" name="p_image" id="p_image"><br>
								
								<div class="form-group" style="width:250px;">
     								 <label for="mis_date" style="float:left;" >실종 날짜</label>
      								 <input type="text" class="form-control" name="mis_date" id = "mis_date" placeholder="실종 날짜 선택.">
       							</div>
       							
       							<div class="form-group" style="width:250px;">
     								 <label for="mis_loc" style="float:left;" >실종 위치</label>
      								 <input type="text" class="form-control" name="mis_loc" id = "mis_loc" placeholder="위치를 적어주세요.">
       							</div>
       							
       							<div class="form-group" style="width:250px;">
     								 <label for="mis_content" style="float:left;" >내 용</label>
									<textarea rows="5" cols="20" name="mis_content" class="form-control"></textarea>
       							</div>
								
								<br> <input type="submit" value="작성완료" id="button1" class = "btn btn-primary">
								<input type="reset" value="다시작성" class = "btn btn-default"> 
								<input type="button"
									value="목록으로" id="button2" class = "btn btn-default">
							</form>
						</center>
						<!-- </div> -->
	<!-- 			</div>			
			</div>
		</div>
	</div>
</section> -->

<%
	pageContext.include("../../include/footer.jsp");
%>


<%
	pageContext.include("../../include/script.jsp");
%>

<script>
	$(function() {
		//fadeinout();
		$('#colour-variations ul').styleSwitcher({
			defaultThemeId : 'theme-switch',
			hasPreview : false,
			cookie : {
				expires : 30,
				isManagingLoad : true
			}
		});
		$('.option-toggle').click(function() {
			$('#colour-variations').toggleClass('sleep');
		});
	});
</script>
	
	
	
	
</body>
</html>