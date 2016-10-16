<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<!-- bootstrap js -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
			var hrf = "abandonmentPublic.keyurl?bgnde="+$("#bgnde").val()+"&endde="+$("#endde").val();
			hrf+="&upkind="+$("#upkind").val();
			hrf +="&kind="+$("#kind").val();
			hrf+="&upr_cd="+$("#upr_cd").val();
			hrf+="&org_cd="+$("#org_cd").val()+"&care_reg_no="+$("#care_reg_no").val()
			hrf +="&state="+$("#state").val()+"&pageNo="+$("#pageNo").val()+"&numOfRows="+$("#numOfRows").val();
			location.href= hrf
					
		})
	})
</script>
</head>
<body>
		<table style="width: 600">
			<tr>
				<td>시작 날짜:</td>
				<td><input type="text" name="bgnde"  id ="bgnde" value="20161001"><br></td>
				<!--켈렌더 로 바꾸고  -->
			</tr>
			<tr>
				<td>끝 날짜:</td>
				<td><input type="text" name="endde"  id ="endde" value="20161010"><br>
				</td>
			</tr>
			<tr>
				<td>축종코드:</td>
				<td><select id="upkind" name="upkind"><option value="417000">축종을 선택하세요</option>
				<option value="417000">개</option>
				<option value="422400">고양이</option>
				<option value="429900">기타</option>
				</select><br></td>
				<!-- select 해서 값을 받고 싶은데.. -->
			</tr>
			<tr>
				<td>품종코드:</td>
				<td><select id="kind" name="kind"><option value="">품종을 선택 하세요</option></select><br></td>
			</tr>
			<tr>
				<td>시도코드:</td>
				<td><select id="upr_cd" name="upr_cd"><option value="">시도를
							선택하세요</option></select></td>
			</tr>
			<tr>
				<td>시군구코드:</td>
				<td><select id="org_cd" name="org_cd"><option value="">시군구를
							선택하세요</option></select></td>
			</tr>
			<tr>
				<td>보호소번호:</td>
				<td><select id="care_reg_no" name="care_reg_no"><option value="">보호소를
							선택 하세요</option></select><br></td>
			</tr>
			<tr>
				<td>상태:</td>
				<td>
				<select name="state" id="state">
				<option value="">전체</option>
				<option value="notice">공고중</option>
				<option value="protect">보호중</option>
				 </select><br></td>
			</tr>
			<tr>
				<td>페이지 번호:</td>
				<td><input type="hidden"  id ="pageNo" name="pageNo" value="1"><br></td>
			</tr>
			<tr>
				<td>페이지당 보여줄 개수:</td>
				<td><input type="text" id="numOfRows" name="numOfRows" value="9"><br></td>
			</tr>
		</table>
		<input id="submits" type="button" value="버튼">
		<!-- <input type="submit" value="버튼"> -->
</body>
</html>