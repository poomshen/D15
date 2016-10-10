<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../../pickadate/lib/themes/default.css">
<link rel="stylesheet" href="../../pickadate/lib/themes/default.date.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<meta charset="UTF-8">

<title>임시보호/분양</title>

<%@include file="WePet_searchTest.jsp" %>
<style type="text/css">
 #search img{
 	width: 100%; 
 	height: 200px;
 }
  #detailView img{
  	margin-top:2%;
  	margin-left:2%;
 	width: 200px; 
 	height: 200px;
 	border-radius:5px;
 	
 }
  .d15_bodyEvt1{
 	z-index: 1;
 }
  .d15_bodyEvt2{
 	background-color:black ;
 	z-index: 1000;
 	height:100%; 
 	width: 100%;
 	position:fixed;
 	opacity:0.7;
 }
 .d15_bodyEvt3{
 	z-index: 1000;
 	margin-left:25%;
 	margin-right:25%;
 	margin-top:8%;
 	margin-bottom:10%;
 	height:70%; 
 	width: 50%;
 	position:fixed;
 	overflow : hidden ;
 }
 a {
 	cursor : pointer ;
 }
</style>  
</head>

<div id="d15_body">
<!-- 화면이벤트   -->
<div id="d15_body1"></div>
<div id="container"></div>
<!-- 클릭시 화면 보여주는 div -->
<div id="d15_body2">
<button title="Close (Esc)" type="button" class="mfp-close" style="z-index:11;" id="close">×</button>
<div style="z-index:11; margin-bottom: -2px;">
&nbsp;
<span style="background-color: white; border-radius:5px 5px 0px 0px; cursor : pointer ;" id="detailSelect">&nbsp; 상세보기&nbsp; </span>
<span style="background-color: red; border-radius:5px 5px 0px 0px; cursor : pointer ;" id="protectSelect">&nbsp; 임시보호&nbsp; </span>
<span style="background-color: blue; border-radius:5px 5px 0px 0px; cursor : pointer ;" id="parcelSelect">&nbsp;&nbsp;분양받기&nbsp;&nbsp;</span>
</div>
<div id="detailView" style="background-color: white; z-index: 11; width: 98%; height: 78%; margin-top: 0%; border-radius:5px; ">
</div>
<!-- 임시보호  -->
<div id="protectView" style="background-color: white; z-index: 11; width: 98%; height: 78%; margin-top: 0%; border-radius:5px; ">
	<br><br>
	<div style="margin-left: 25%; margin-top: 0px;" >임시보호 받을 날을 입력해주세요</div>
	<form id="protectform" method="post" >
	<input id="protectDSt" class="protectDSt" type="text" style="margin-left: 10%; margin-top: 5%; width:420px; cursor : pointer ;" value="보호시작 날짜" >
	<input id="protectDEd" class="protectDEd" type="text" style="margin-left: 10%; margin-top: 2%; width:420px; cursor : pointer ;" value="보호종료 날짜" >
	<input type="submit" value="임시보호신청" style="margin-left: 35%; margin-top: 5%;">
	</form>
</div>
<!-- 분양 -->
<div id="parcelView" style="background-color: white; z-index: 11; width: 98%; height: 78%; margin-top: 0%; border-radius:5px; ">
	<br><br>
	<div style="margin-left: 25%; margin-top: 0px;" >분양 받을 날을 입력해주세요</div>
	<form id="parceform" method="post" >
	<input id="parcelD" class="parcelD" type="text" style="margin-left: 10%; margin-top: 10%; width:420px; cursor : pointer ;" value="날짜입력">
	<input type="submit" value="임시보호신청" style="margin-left: 35%; margin-top: 5%;">
	</form>
</div>
</div>
</div>
<%@include file="../../include/head.jsp" %>

<%@ include file="../../include/header.jsp" %>
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
<div class='row row-bottom-padded-sm' id="search">
</div>
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
		 var $input = $( '.parcelD' ).pickadate({
	            weekdaysFull: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	            weekdaysShort: ['일', '월', '화', '수', '목', '금', '토'],
	            monthsFull: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	            // min: [2015, 7, 14],
	           	today: '오늘',
	           	clear: '지우기',
	            close: '적용',
	            format: '분양 받을 날은!: mm 월 dd 일 dddd 입니다.',
	            formatSubmit: 'yy/mm/dd',
	            container: '#container',
	            min: true,
	            // editable: true,
	            closeOnSelect: false,
	            closeOnClear: false,
	        })
 
		 
		 var $input = $( '.protectDSt' ).pickadate({
	            weekdaysFull: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	            weekdaysShort: ['일', '월', '화', '수', '목', '금', '토'],
	            monthsFull: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	            // min: [2015, 7, 14],
	           	today: '오늘',
	           	clear: '지우기',
	            close: '적용',
	            format: '임시보호 받을 날은!: mm 월 dd 일 dddd 입니다.',
	            formatSubmit: 'yy/mm/dd',
	            container: '#container',
	            min: true,
	            // editable: true,
	            closeOnSelect: false,
	            closeOnClear: false,
	        })
	        
		 var $input = $( '.protectDEd' ).pickadate({
	            weekdaysFull: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	            weekdaysShort: ['일', '월', '화', '수', '목', '금', '토'],
	            monthsFull: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	            // min: [2015, 7, 14],
	           	today: '오늘',
	           	clear: '지우기',
	            close: '적용',
	            format: '임시보호 종료 날은!: mm 월 dd 일 dddd 입니다.',
	            formatSubmit: 'yy/mm/dd',
	            container: '#container',
	            min: true,
	            // editable: true,
	            closeOnSelect: false,
	            closeOnClear: false,
	        })
	        
	        var picker = $input.pickadate('picker');
		</script>
<script src="../../js/main.js"></script>
<br>
<br><br>
<%@ include file="../../include/footer.jsp" %>
<%@include file="../../include/script.jsp" %>
</body>
</html>