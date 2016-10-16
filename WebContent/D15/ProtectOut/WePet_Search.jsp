<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../../pickadate/lib/themes/default.css">
<link rel="stylesheet" 	href="../../pickadate/lib/themes/default.date.css">

<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {

		$.get("sido.keyurl", {}, function(data, textStatus, req) {
			yqlURL = [
				"http://query.yahooapis.com/v1/public/yql",
				"?q=" + encodeURIComponent("select * from xml where url='" + data + "'"),
				"&format=xml&callback=?"
			].join("");
			$.getJSON(yqlURL, {}, function(data, textStatus, req) {
				var xmlContent = $(data.results[0]);
				$(xmlContent).find('item').each(function() {
					$("#upr_cd").append("<option value='" + $(this).find('orgCd').text() + "'>" + $(this).find('orgdownNm').text() + "</option>");
				})
			})
		})

		$("#upr_cd").change(function() {
			$.get("sigungu.keyurl", {
				"upr_cd" : $("#upr_cd").val()
			}, function(data, textStatus, req) {
				yqlURL1 = [
					"http://query.yahooapis.com/v1/public/yql",
					"?q=" + encodeURIComponent("select * from xml where url='" + data + "'"),
					"&format=xml&callback=?"
				].join("");
				$.getJSON(yqlURL1, {}, function(data, textStatus, req) {
					var xmlContent = $(data.results[0]);
						$("#org_cd").html("<option value=''>시군구를 선택하세요</option>");
						$("#care_reg_no").html("<option value=''>보호소를 선택하세요</option>");
					$(xmlContent).find('item').each(function() {
						$("#org_cd").append("<option value='" + $(this).find('orgCd').text() + "'>" + $(this).find('orgdownNm').text() + "</option>");
					})
				})
			})
		})
		
		
		$("#org_cd").change(function() {
			$.get("shelter.keyurl", {
				"upr_cd" : $("#upr_cd").val(),
				"org_cd" : $("#org_cd").val()
			}, function(data, textStatus, req) {
				yqlURL2 = [
					"http://query.yahooapis.com/v1/public/yql",
					"?q=" + encodeURIComponent("select * from xml where url='" + data + "'"),
					"&format=xml&callback=?"
				].join("");
				$.getJSON(yqlURL2, {}, function(data, textStatus, req) {
					var xmlContent = $(data.results[0]);
					$("#care_reg_no").html("<option value=''>보호소를 선택하세요</option>");
					$(xmlContent).find('item').each(function() {
						$("#care_reg_no").append("<option value='" + $(this).find('careRegNo').text() + "'>" + $(this).find('careNm').text() + "</option>");
					})
				})
			})
		})
		
		$("#upkind").change(function(){
			$.get("kind.keyurl", {"up_kind_cd": $("#upkind").val()}, function(data, textStatus, req) {
				yqlURL3 = [
							"http://query.yahooapis.com/v1/public/yql",
							"?q=" + encodeURIComponent("select * from xml where url='" + data + "'"),
							"&format=xml&callback=?"
						].join("");
				$.getJSON(yqlURL3, {}, function(data, textStatus, req) {
					var xmlContent = $(data.results[0]);
					$("#kind").html("<option value=''>품종를 선택하세요</option>");
					$(xmlContent).find('item').each(function() {
						$("#kind").append("<option value='" + $(this).find('kindCd').text() + "'>" + $(this).find('KNm').text() + "</option>");
					})
				})
			})
		})
		
		$("#submits").click(function(){
			if( Number($("#bgnde").val()) <= Number($("#endde").val())){
			 var hrf = "abandonmentPublic.keyurl?bgnde="+$("#bgnde").val()+"&endde="+$("#endde").val();
			hrf+="&upkind="+$("#upkind").val();
			hrf +="&kind="+$("#kind").val();
			hrf+="&upr_cd="+$("#upr_cd").val();
			hrf+="&org_cd="+$("#org_cd").val()+"&care_reg_no="+$("#care_reg_no").val()
			hrf +="&state="+$("#state").val()+"&pageNo="+$("#pageNo").val()+"&numOfRows="+$("#numOfRows").val();
			location.href= hrf 
			}else{
				alert("시작 날짜가 끝 날짜보다 높습니다.");
			}
					
		})
	})
</script>
<style type="text/css">
#wrapper {
	margin-top: 100px;
	margin-bottom: 40px;
}
</style>
</head>
<body>
<header>
		<jsp:include page="../../include/header.jsp" />
	</header>
			<script src="../../pickadate/lib/picker.js"></script>
		<script src="../../pickadate/lib/picker.date.js"></script>
		<script src="../../pickadate/lib/legacy.js"></script>
 <div id="container"  ></div>
 <div id="wrapper">
 <div style="width: 60%; margin-left: 20%; margin-right: 20%; ">
		
				<div style="float: left; width: 48%">
				검색 시작 날짜
				<input type="text"  name="bgnde"   id ="bgnde"  class="bgnde form-control" ><br>
				</div>
				<div style="float: right; width: 48%;" >
				검색 끝 날짜
				<input type="text" name="endde"  id ="endde" class="endde form-control" ><br>
				</div>
				<br>
				<div style="float: left; width: 100% " >
				<label for="upkind">축종</label>
				<select id="upkind"  class="form-control"  name="upkind"><option value="417000">축종을 선택하세요</option>
				<option value="417000">개</option>
				<option value="422400">고양이</option>
				<option value="429900">기타</option>
				</select><br>
				</div>
				<!-- select 해서 값을 받고 싶은데.. -->
				<div style="float: left; width: 100% " >
				품종
				<select id="kind"  class="form-control" name="kind"><option value="">품종을 선택 하세요</option></select><br>
				</div>
			
				<div style="float: left; width: 100% " >
				시도
				<select id="upr_cd"  class="form-control"  name="upr_cd"><option value="">시도를
							선택하세요</option></select>
				</div>
				<div style="float: left; width: 100% " >
				시군구
				<select id="org_cd"  class="form-control" name="org_cd"><option value="">시군구를
							선택하세요</option></select>
				</div>
						<div style="float: left; width: 100% " >
				보호소
				<select id="care_reg_no"  class="form-control"  name="care_reg_no"><option value="">보호소를
							선택 하세요</option></select><br>
			</div>
					<div style="float: left; width: 100% " >
				상태
				<select name="state"  class="form-control"  id="state">
				<option value="">전체</option>
				<option value="notice">공고중</option>
				<option value="protect">보호중</option>
				 </select><br>
				</div>			
				<input type="hidden"  id ="pageNo" name="pageNo" value="1">
				<div style="float: left; width: 100% " >			
				페이지당 보여줄 개수
				<input type="text" id="numOfRows"  class="form-control" name="numOfRows" value="9"><br>
				</div>
		<br>
		<input id="submits" type="button" class="btn btn-info btn-block" value="검색">
		<br><br>
 </div>
 </div>
		
		<script type="text/javascript">
		var $input = $('.bgnde').pickadate({
			weekdaysFull : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일' ],
			weekdaysShort : [ '일', '월', '화', '수', '목', '금', '토' ],
			monthsFull : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
			// min: [2015, 7, 14],
			today : '오늘',
			clear : '지우기',
			close : '적용',
			format : 'yyyymmdd',
			formatSubmit : 'yyyymmdd',
			container : '#container',
			max:true,
			hiddenName : true,
			// editable: true,
			closeOnSelect : false,
		})
		var $input = $('.endde').pickadate({
			weekdaysFull : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일' ],
			weekdaysShort : [ '일', '월', '화', '수', '목', '금', '토' ],
			monthsFull : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
			// min: [2015, 7, 14],
			today : '오늘',
			clear : '지우기',
			close : '적용',
			format : 'yyyymmdd',
			formatSubmit : 'yyyymmdd',
			container : '#container',
			max:true,
			hiddenName : true,
			// editable: true,
			closeOnSelect : false,
		})
		var picker = $input.pickadate('picker');
		</script>
		<jsp:include page="../../include/footer.jsp" />
		<!-- <input type="submit" value="버튼"> -->
</body>
</html>