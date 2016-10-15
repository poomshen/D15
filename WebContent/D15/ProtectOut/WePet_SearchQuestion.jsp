<!-- 
 * @Class : WePet_searchTest.jsp
 * @Date : 2016.10.12
 * @Author : 이성준
 * @Desc : 유기견 임시보호 및 분양 게시판 view
 -->



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../../pickadate/lib/themes/default.css">
<link rel="stylesheet" 	href="../../pickadate/lib/themes/default.date.css">
<link rel="shortcut icon"  href="images/favicon.ico">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<link rel="shortcut icon"  href="/TeamProject3_D15/images/favicon.ico">
<title>임시보호/분양</title>


<style>

#search img {
	width: 100%;
	height: 200px;
	
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
	margin-top: -75px; 
}

#wrapper {
	margin-top: 100px;
	margin-bottom: 40px;
}
</style>
  <style>
  .modal-header, .close {
  	  background-size: 100%;
      background-color: #5cb85c;
      color:white !important;
      text-align: center;
      font-size: 30px;
  }
  .modal-footer {
      background-color: #f9f9f9;
  }
  </style>
<%@include file="WePet_searchTest.jsp"%>
</head>


<body>
	<header>
		<jsp:include page="../../include/header.jsp" />
	</header>

	<div id="wrapper">
		



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

	$(function(){
		$("#protectView").hide();
		$("#parcelView").hide();
		
		$(".detailSelect").click(function() {
			$("#detailSelect").show();
			$("#parcelView").hide();
			$("#protectView").hide();
		})
		$(".protectSelect").click(function() {
			$("#detailSelect").hide();
			$("#parcelView").hide();
			$("#protectView").show();
		})
		
		$(".parcelSelect").click(function(){
			$("#detailSelect").hide();
			$("#parcelView").show();
			$("#protectView").hide();
		})
		
		
		$(".close").click(function() {
			window.location.reload();
		})
		$(".btn-danger").click(function() {
			window.location.reload();
		})
		
	});
</script>

<!-- Modala 만든는 폼 -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <div class="modal-content">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <div style="float: right;"><br><br><h5 id="mCount" style="color: #429f20;"><span class="glyphicon glyphicon-eye-open"></span>조회수:</h5></div>
        <div class="modal-header" style="padding:300px 50px 0px ">
          <h3 id="mdate"><span class="glyphicon glyphicon-hourglass"></span></h3>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
        	
        	<!-- 상세보기 부분 -->
        	<div id="detailSelect">
        <label style="margin-left:33%; margin-right:30%;font-size: 30px;"><h5 id="mSituation" style="font-size: 25px;"><span class="glyphicon glyphicon-leaf"></span></h5></label>
            <div style="float: left; width: 48%">
               <label for="mName"><span class="glyphicon glyphicon-tint"></span>품종</label>
              <input type="text" readonly="readonly" class="form-control" id="mName" placeholder="품종">
            </div>
            <div style="float: right; width: 48%">
               <label for="usrname"><span class="glyphicon glyphicon-scale"></span>무게</label>
              	<input type="text" readonly="readonly" class="form-control" id="usrname" placeholder="무게">
            </div>
            <br>
            <div class="form-group">
              <label for="mSw"><span class="glyphicon glyphicon-star"></span>특징</label>
              <input type="text" class="form-control" readonly="readonly" id="mSw" placeholder="특징들">
            </div>
            <div class="form-group">
              <label for="mLoc"><span class="glyphicon glyphicon-map-marker"></span>주소</label>
              <input type="text" readonly="readonly" class="form-control" id="mLoc" placeholder="주소">
            </div>
            <div style="float: left; width: 48%">
              <button type="button" id="protectSelect" class="btn btn-info btn-block protectSelect"><span class="glyphicon glyphicon-refresh"></span>임시보호</button>
            </div>
            <div style="float: right; width: 48%">
              <button type="button" id="parcelSelect" class="btn btn-success btn-block parcelSelect"><span class="glyphicon glyphicon-heart"></span>분양</button>
            </div>
        	</div>
        	
        	<!-- 임시 보호 부분 -->
        	<div id="protectView">
        		<div style="width: 100%; font-size: 30px; text-align: center;">임시보호 받을 날을
						입력해주세요</div>
					<form id="protectform" method="post">
						<input  name="protectDSt" id="protectDSt" class="protectDSt"
							type="text"
							style="margin-left: 5%; margin-top: 5%; width: 90%; cursor: pointer;"
							value="보호시작 날짜"> 
						<input name="protectDEd" id="protectDEd" class="protectDEd" type="text"
							style="margin-left: 5%; margin-top: 2%; width: 90%; cursor: pointer;"
							value="보호종료 날짜"> 
							<button type="submit"  class="btn btn-info btn-block btn-lg"
							style=" margin-top: 5%; width: 100%;"><span class="glyphicon glyphicon-ok"></span>임시보호신청</button>
					</form>
					<br>
					<div style="float: left; width: 48%">
              			<button type="button" id="detailSelect" class="btn btn-primary btn-block detailSelect"><span class="glyphicon glyphicon-search"></span>상세보기</button>
            		</div>
            		<div style="float: right; width: 48%">
              			<button type="button" id="parcelSelect" class="btn btn-success btn-block parcelSelect"><span class="glyphicon glyphicon-heart"></span>분양</button>
            		</div>
        	</div>
        	
        	
        	<!-- 분양보기 -->
        	<div id="parcelView">
					<br><br>
					<div style="width: 100%; font-size: 30px; text-align: center;">분양 받을 날을 입력해주세요</div>
				<form id="parceform" method="post">
						<input name="parcelD" id="parcelD" class="parcelD" type="text"
							style="margin-left: 10%; margin-top: 10%; width: 80%; cursor: pointer;"
							value="날짜입력"> 
							<button type="submit"  class="btn btn-success btn-block btn-lg"
							style=" margin-top: 5%; width: 100%;"><span class="glyphicon glyphicon-ok"></span>분양신청</button>
				</form>
				<br>
					<div style="float: left; width: 48%">
              			<button type="button" id="detailSelect" class="btn btn-primary btn-block detailSelect"><span class="glyphicon glyphicon-search"></span>상세보기</button>
            		</div>
            		<div style="float: right; width: 48%">
            			<button type="button" id="protectSelect" class="btn btn-info btn-block protectSelect"><span class="glyphicon glyphicon-refresh"></span>임시보호</button>
            		</div>
			</div>
        	
        </div>
        <div class="modal-footer">
      	<button type="submit" style="width: 100%" class="btn btn-danger btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span>닫기</button>
        </div>
      </div>
    </div>
  </div>
 <div id="container"></div>

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