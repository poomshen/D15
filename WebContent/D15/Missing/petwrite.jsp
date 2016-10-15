<%-- 
	@JSP : petwrite.jsp
	@Date : 2016-10-11
	@Author : 박문수, 김지율
	@Desc : 실종 신고 게시판의 글쓰기를 위한 jsp 페이지, css 수정
--%>
<%@page import="com.d15.DTO.Member_DTO"%>
<%@page import="com.d15.DTO.Kind_DTO"%>
<%@page import="java.util.List"%>
<%@page import="com.d15.DAO.Kind_DAO"%>
<%@page import="net.sf.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<<<<<<< HEAD
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>실종신고글쓰기ㅠ.ㅠ</title>

    <!-- Bootstrap Core CSS 원본-->
    <!-- <link href="boot2/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
 	<!-- Bootstrap Core CSS 수정본 [지율주석] 실제사용할것-->
    <link href="../../css/team01_bootstrap_core.css" rel="stylesheet">
    
    <!-- Theme CSS 원본 -->
    <!-- <link href="boot2/css/freelancer.min.css" rel="stylesheet"> -->    
    <!-- Theme CSS 수정본 [지율주석] 실제사용할것 -->
    <link href="../../css/team01_theme.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <!-- <link href="boot2/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"> -->
    <link href="../../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
=======
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

>>>>>>> bccf6296fb832d51c785abfc546fa2fc07f6edfc

	$(function(){
	
		 $( "#mis_date" ).datepicker({
		      showOn: "button",
		      buttonImage: "../../images/calendar.gif",
		      buttonImageOnly: true,
		      buttonText: "Select date",
		      dateFormat: "yy-mm-dd"
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
			 history.go(-1);
			 //location.href = "BoardList.missing";
		});
	});	
		
	


</script>

<<<<<<< HEAD



<body id="page-top" class="index">

<!-- Navigation -->
<nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header page-scroll">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
            </button>
            <!-- <a class="navbar-brand" href="#page-top">Start Bootstrap</a> -->
            <a class="navbar-brand" href="/TeamProject3_D15/index.jsp"><img style="margin-top:-20px" src="/TeamProject3_D15/images/logo.gif"></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li class="hidden">
                    <a href="#page-top">Home</a>
                </li>
                <li class="page-scroll">
                    <a href="#about">소개</a>
                </li>
                <!-- [지율주석] 공지사항~게시판 추가 시작 -->
                <li class="page-scroll">
                    <a href="#notice">공지사항</a>
                </li>
                <li class="page-scroll">
                    <a href="#cur_situ">현황</a>
                </li>
                <li class="page-scroll">
                	<a href="/TeamProject3_D15/D15/ProtectOut/ProtectOut.keyurl">분양/임시보호</a>
                    <!-- <a href="#parcelout">분양/임시보호</a> -->
                </li>
                <li class="page-scroll">
                	<a href="/TeamProject3_D15/D15/Missing/BoardList.missing">실종</a>
                    <!-- <a href="#cur_situ">실종</a> -->
                </li>
                <li class="page-scroll">
                    <a href="#board">게시판</a>
                </li>
                <!-- [지율주석] 공지사항~게시판 추가 끝 -->
                <!-- [지율주석] 버튼 스타일 먹이기 도전 시작 -->
                <!-- <li class="page-scroll">
                    <a><input type="button" value="로그인"></a>
                </li>
                <li class="page-scroll">
                    <a><input type="button" value="회원가입" id="reg"></a>
                </li>
                [지율주석] 버튼 스타일 먹이기 도전 끝  -->                   
                <li class="">
                	<a> 
                	<%
					String str = "";
				 	Member_DTO memberdto = (Member_DTO) session.getAttribute("memberdto");
				 	if (memberdto != null) {
				 		str += memberdto.getM_id() + "님 로그인 ";
				 		out.print("<form action='/TeamProject3_D15/D15/Login/Logout.login' method='post'>");
				 		out.print(str
				 				+ "<input type='submit' value='로그아웃'>&nbsp&nbsp<a href='/TeamProject3_D15/D15/Login/Mypage.login'>[마이페이지]</a>");
				
				 		out.print("</form>");
				 	} else {
				 		out.print("<form action='/TeamProject3_D15/D15/Login/Login.login' method='post'>");
				 		out.print("<input type='submit' value='로그인'>");
				 		out.print("<input type='button' value='회원가입' id = 'reg'>");
				 		out.print("</form>");
				 	}									
					%>
					</a>
				</li>                
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>

	<team01content>
	<div class="container">
		<div class="row">
		    <div class="col-lg-12 text-center">
		        <h2>실종신고글쓰기</h2>
		        <hr class="star-light">
		    </div>
		</div>
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<form action="BoardWriteOk1.missing" name="form" id="form"
					method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label>견종 선택 : </label>
						<select name="k_kind" id="k_kind">
							<option>선택</option>
						</select>
						<br> 
						<label>성 별 : </label>
						<input type="radio" value="m" name="p_gender" checked>수컷 
						<input type="radio" value="f" name="p_gender">암컷
						<br>
						<label>색 상 : </label>
						<input type="text" name="p_color" id="p_color">
						<br>
						<label>특 징 : </label>						
						<textarea rows="5" cols="20" name="p_feature"></textarea>
						<br>
						<label>나 이 : </label>
						<input type="text" name="p_age" id="p_age">
						<br>
						<label>체 중 : </label>
						<input type="text" name="p_weight" id="p_weight">
						<br>
						<label>사진 첨부 : </label>
						<input type="file" name="p_image" id="p_image" style="text-align: center;">
						<br>
						<label>실종 날짜 : </label>
						<input type="text" name="mis_date" id="mis_date">
						<br>
						<label>실종 위치 : </label>
						<input type="text" name="mis_loc" id="mis_loc">
						<br>
						<label>내용 : </label>
						<textarea rows="5" cols="20" name="mis_content"></textarea><br>
						<input type="submit" value="작성완료" id="button1" class="btn btn-lg btn-outline"> 
						<input type="reset" value="다시작성" class="btn btn-lg btn-outline"> 
						<input type="button" value="목록으로" id="button2" class="btn btn-lg btn-outline">					
					</div>					
				</form>
=======
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
>>>>>>> bccf6296fb832d51c785abfc546fa2fc07f6edfc
			</div>

			<div class="col-sm-3"></div>
		</div>
<<<<<<< HEAD
	</div>
	</team01content>

=======
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
>>>>>>> bccf6296fb832d51c785abfc546fa2fc07f6edfc

			<div class="col-sm-2"></div>

<<<<<<< HEAD


	<!-- Footer -->
<footer class="text-center">        
    <div class="footer-below">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    2016 &copy; KOSTA 129th. All Rights Reserved.
                </div>
            </div>
        </div>
    </div>
</footer>

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-top page-scroll hidden-sm hidden-xs hidden-lg hidden-md">
        <a class="btn btn-primary" href="#page-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </div>
    
<!-- jQuery -->
<script src="../../jquery/team01_jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../../js/team01_bootstrap.js"></script>

<!-- Plugin JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

<!-- Contact Form JavaScript -->
<script src="../../js/team01_jqBootstrapValidation.js"></script>
<script src="../../js/team01_contact_me.js"></script>

<!-- Theme JavaScript -->
<script src="../../js/team01_freelancer.min.js"></script>
=======
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
>>>>>>> bccf6296fb832d51c785abfc546fa2fc07f6edfc
</body>

</html>