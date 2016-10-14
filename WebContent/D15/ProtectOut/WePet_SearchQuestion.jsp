<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../../pickadate/lib/themes/default.css">
<link rel="stylesheet"
	href="../../pickadate/lib/themes/default.date.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<title>임시보호/분양</title>


<style>
.detail {
	background-color: #ccffff;
}

.parcel {
	background-color: #6699cc;
}

.protect {
	background-color: #9999cc;
}

#search img {
	width: 100%;
	height: 200px;
}

#detailView img {
	margin-top: 2%;
	margin-left: 2%;
	width: 200px;
	height: 200px;
	border-radius: 5px;
}

.d15_bodyEvt1 {
	z-index: 1;
}

.d15_bodyEvt2 {
	background-color: black;
	z-index: 9000;
	height: 100%;
	width: 100%;
	position: fixed;
	opacity: 0.7;
}

.d15_bodyEvt3 {
	z-index: 9000;
	margin-left: 25%;
	margin-right: 25%;
	margin-top: 8%;
	margin-bottom: 10%;
	height: 70%;
	width: 50%;
	position: fixed;
	overflow: hidden;
}

a {
	cursor: pointer;
}

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
</style>
<%@include file="WePet_searchTest.jsp"%>
</head>


<body>
	<header>
		<jsp:include page="../../include/header.jsp" />
	</header>

	<div id="wrapper">
		<div id="d15_body">
			<!-- 화면이벤트   -->
			<div id="d15_body1"></div>
			<div id="container"></div>
			<!-- 클릭시 화면 보여주는 div -->
			<div id="d15_body2">
				<div style="z-index: 11; margin-bottom: 10px;">
					<button title="Close (Esc)" type="button" class="mfp-close"
						style="z-index: 11;" id="close">×</button>
				</div>
				<div style="z-index: 11; margin-bottom: -5px;">
					&nbsp;<span
						style="font-size: large; background-color: #ccffff; border-radius: 5px 5px 0px 0px; cursor: pointer;"
						id="detailSelect">&nbsp;상세보기&nbsp;</span><span
						style="font-size: large; background-color: #9999cc; border-radius: 5px 5px 0px 0px; cursor: pointer;"
						id="protectSelect">&nbsp;임시보호&nbsp;</span><span
						style="font-size: large; background-color: #6699cc; border-radius: 5px 5px 0px 0px; cursor: pointer;"
						id="parcelSelect">&nbsp;&nbsp;분양받기&nbsp;&nbsp;</span>
				</div>
				<div id="detailView"
					style="z-index: 11; width: 98%; height: 78%; margin-top: 0%; border-radius: 5px;">

				</div>
				<!-- 임시보호  -->
				<div id="protectView"
					style="z-index: 11; width: 98%; height: 78%; margin-top: 0%; border-radius: 5px;">
					<br> <br>
					<div style="width: 100%; text-align: center;">임시보호 받을 날을
						입력해주세요</div>
					<form id="protectform" method="post">
						<input name="protectDSt" id="protectDSt" class="protectDSt"
							type="text"
							style="margin-left: 5%; margin-top: 5%; width: 90%; cursor: pointer;"
							value="보호시작 날짜"> <input name="protectDEd" id="protectDEd"
							class="protectDEd" type="text"
							style="margin-left: 5%; margin-top: 2%; width: 90%; cursor: pointer;"
							value="보호종료 날짜"> <input type="submit" value="임시보호신청"
							style="margin-left: 10%; margin-right: 10%; margin-top: 5%; width: 80%;">
					</form>
				</div>
				<!-- 분양 -->
				<div id="parcelView"
					style="z-index: 11; width: 98%; height: 78%; margin-top: 0%; border-radius: 5px;">
					<br> <br>
					<div style="width: 100%; text-align: center;">분양 받을 날을 입력해주세요</div>
					<form id="parceform" method="post">
						<input name="parcelD" id="parcelD" class="parcelD" type="text"
							style="margin-left: 10%; margin-top: 10%; width: 80%; cursor: pointer;"
							value="날짜입력"> <input type="submit" value="임시보호신청"
							style="margin-left: 10%; margin-right: 10%; margin-top: 5%; width: 80%;">
					</form>
				</div>
			</div>
		</div>



		<div class="d15_bodyEvt1">
			<section id="fh5co-work" data-section="work">
				<div class="container">
					<div class="row">
						<div class="col-md-12 section-heading text-center">
							<h2 class="to-animate">당신을 기다리는...</h2>
							<div class="row">
								<div class="col-md-8 col-md-offset-2 subtext to-animate">
									<h3>당신의 사랑이 절실히 필요한 친구들 입니다.</h3>
								</div>
							</div>
						</div>
					</div>
					<div class='row row-bottom-padded-sm' id="search"></div>
					<div class="clearfix visible-sm-block"></div>
				</div>
			</section>
			<div align="center">
				<div id="pages"></div>
			</div>
		</div>
		<script src="../../pickadate/lib/picker.js"></script>
		<script src="../../pickadate/lib/picker.date.js"></script>
		<script src="../../pickadate/lib/legacy.js"></script>

		<script type="text/javascript">
			var $input = $('.parcelD').pickadate({
				weekdaysFull : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일' ],
				weekdaysShort : [ '일', '월', '화', '수', '목', '금', '토' ],
				monthsFull : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
				// min: [2015, 7, 14],
				today : '오늘',
				clear : '지우기',
				close : '적용',
				format : '분양 받을 날은!: mm 월 dd 일 dddd 입니다.',
				formatSubmit : 'yy/mm/dd',
				container : '#container',
				min : true,
				hiddenName : true,
				// editable: true,
				closeOnSelect : false,
				closeOnClear : false,
			})
		
		
			var $input = $('.protectDSt').pickadate({
				weekdaysFull : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일' ],
				weekdaysShort : [ '일', '월', '화', '수', '목', '금', '토' ],
				monthsFull : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
				// min: [2015, 7, 14],
				today : '오늘',
				clear : '지우기',
				close : '적용',
				format : '임시보호 받을 날은!: mm 월 dd 일 dddd 입니다.',
				formatSubmit : 'yy/mm/dd',
				container : '#container',
				min : true,
				hiddenName : true,
				// editable: true,
				closeOnSelect : false,
				closeOnClear : false,
			})
		
			var $input = $('.protectDEd').pickadate({
				weekdaysFull : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일' ],
				weekdaysShort : [ '일', '월', '화', '수', '목', '금', '토' ],
				monthsFull : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
				// min: [2015, 7, 14],
				today : '오늘',
				clear : '지우기',
				close : '적용',
				format : '임시보호 종료 날은!: mm 월 dd 일 dddd 입니다.',
				formatSubmit : 'yy/mm/dd',
				container : '#container',
				min : true,
				hiddenName : true,
				// editable: true,
				closeOnSelect : false,
				closeOnClear : false,
			})
		
			var picker = $input.pickadate('picker');
		</script>

		<!-- <script src="../../js/main.js"></script> -->
		<br> <br> <br>
	</div>
	<footer>
		<jsp:include page="../../include/footer.jsp" />
	</footer>

</body>
</html>