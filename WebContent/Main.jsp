<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon"  href="images/favicon.ico">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>메인페이지</title>

<!-- bootstrap css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<!-- bootstrap js -->
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<style>
#wrap03 {
	margin-top: 100px;
	margin-bottom: 100px;
}
</style>
<style type="text/css">
/* 로딩 이미지*/
#loading {
	height: 100%;
	left: 0px;
	position: fixed;
	_position: absolute;
	top: 0px;
	width: 100%;
	filter: alpha(opacity = 50);
	-moz-opacity: 0.5;
	opacity: 0.5;
}

.loading {
	background-color: white;
	z-index: 199;
}

#loading_img {
	position: absolute;
	top: 50%;
	left: 45%;
	height: 90px;
	margin-top: -75px; //
	이미지크기 margin-left: -75px; //
	이미지크기 z-index: 200;
}

#wrapper {
	margin-top: 100px;
	margin-bottom: 40px;
}
.row > div{
	background-color: white;
 	height: 360px ;
  	 width: 30%;
    margin: 10px 0px 25px 3% ;
}
.w3-card-4 >img{
	margin: 0px  -6% 0px ;
	width: 113%;
	height: 236px;
}

</style>

</head>

<body>

	<header>
		<jsp:include page="include/header.jsp" />
	</header>
	<%@ include file="searchMain.jsp"%>
	<div id="wrap03">
		<div>
			<img alt="메인화면" src="images/main.jpg" height="400px;" width="76%" style="margin-left: 12%; margin-right: 10%;">
		</div>
		<hr>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<br>
				<a id="gotoProtect" href="/TeamProject3_D15/D15/ProtectOut/ProtectOut.ProtectOut" class="btn btn-default" >보러가기</a>
			</ol>
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">

				<div class="item active" >
					<section>
						<div class="container" >
							<div class="row">
								<div class="col-sm-4 w3-card-4 "   >
									<img id="img1" 	alt="Cinque Terre"  >
									<div class="w3-container">
									<h2 id="st1"></h2>
									<p id="so1"></p>
									<br>
									</div>
								</div>

								<div class="col-sm-4 w3-card-4"   >
									<img id="img2"   alt="Cinque Terre">
										<div class="w3-container">
									<h2 id="st2"></h2>
									<p id="so2"></p>
									</div>
								</div>
								
								<div class="col-sm-4 w3-card-4" >
									<img id="img3"  alt="Cinque Terre"	>
								<div class="w3-container">
									<h2 id="st3"></h2>
									<p id="so3"></p>
								</div>
								</div>
							</div>
						</div>
					</section>
				</div>

				<div class="item">
					
					<section>
						<div class="container">
							<div class="row">
								<div class="col-sm-4 w3-card-4" style="background-color: white;">
									<img id="img4"  alt="Cinque Terre" >
								<div class="w3-container">
									<h2 id="st4"></h2>
									<p id="so4"></p>
									</div>
								</div>

								<div class="col-sm-4 w3-card-4" style="background-color: white;">
									<img id="img5"  alt="Cinque Terre">
								<div class="w3-container">
									<h2 id="st5"></h2>
									<p id="so5"></p>
								</div>
								</div>

								<div class="col-sm-4 w3-card-4"  style="background-color: white;">
									<img id="img6"  alt="Cinque Terre"	>
								<div class="w3-container">
									<h2 id="st6"></h2>
									<p id="so6"></p>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>

				<div class="item">
					
					<section>
						<div class="container">
							<div class="row">
								<div class="col-sm-4 w3-card-4" style="background-color: white;">
									<img id="img7"  alt="Cinque Terre" >
								<div class="w3-container">
									<h2 id="st7"></h2>
									<p id="so7"></p>
									</div>
								</div>

								<div class="col-sm-4 w3-card-4" style="background-color: white;">
									<img id="img8" 	 alt="Cinque Terre">
								<div class="w3-container">
									<h2 id="st8"></h2>
									<p id="so8"></p>
									</div>
								</div>

								<div class="col-sm-4 w3-card-4" style="background-color: white;">
									<img id="img9"  alt="Cinque Terre"	>
								<div class="w3-container">
									<h2 id="st9"></h2>
									<p id="so9"></p>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>
					<div style="float: left; margin-left: 12%">
						<a href="#myCarousel" role="button" data-slide="prev">
							<h1>
								<span class="glyphicon glyphicon-chevron-left"
									aria-hidden="true"></span> <span class="sr-only">Previous</span>
							</h1>
						</a>
					</div>
				<div style="float: right; margin-right:12%">
					<a href="#myCarousel" role="button" data-slide="next">
						<h1>
							<span class="glyphicon glyphicon-chevron-right"
								aria-hidden="true"></span> <span class="sr-only">Next</span>
						</h1>
					</a>
				</div>
				</div>

		</div>
</div>
		<footer>
			<jsp:include page="include/footer.jsp" />
		</footer>
		<!-- jQuery, ui -->

	</div>
</body>
</html>