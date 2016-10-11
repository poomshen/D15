<%--
 * @Class : register_per.jsp
 * @Date : 2016.10.7
 * @Author : 길한종
 * @Desc : 회원가입 폼
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js">
	<head>
	
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>살아나개 사랑할개</title>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <style>
   .navbar-custom{
       background: #ffffff;
   }
   
   .navbar-custom .navbar-nav li a, header {
    color: #3f95ea;
   
   </style>   
 
	
	
	<style>
		form > input, option, select {
			color: black;
		}
	</style>
	</head>
	
	<%
		pageContext.include("../../include/header.jsp");
	%>
					
					<div id="person">
						<form action="RegisterPerOk.login" method="post">
							<!-- 회원번호 <input type="text" name="m_no"><br> 자동 입력 -->
							<div class="form-group" style="width:250px;">
     							 <label for="m_id" style="float:left;" >아이디</label>

      							 	<input type="text" class="form-control" name="m_id" id = "m_id" placeholder="아이디 입력">
      							 	<input type="button" id="idcheck"  class = "btn btn-default" value="ID중복확인">

      							 <span id="checkid"></span>
      							 
    						</div>
    								</td>
							<div class="form-group" style="width:250px;">
     							 <label for="m_pwd" style="float:left;" >비밀번호</label>
      							 <input type="password" class="form-control" name="m_pwd" id = "m_pwd" placeholder="비밀번호 입력">
    						</div>
							<div class="form-group" style="width:250px;">
     							 <label for="re_pwd" style="float:left;" >비밀번호 다시 입력</label>
      							 <input type="password" class="form-control" name="re_pwd" id = "re_pwd" placeholder="비밀번호 다시 입력">
    						</div>
							<!-- js로 유효성 검사 해야됨 -->
							<!-- 최종방문일 <input type="text" name="m_lastdate"><br> 자동입력 -->	
							<!-- 권한코드 <input type="text" name="c_code"><br> 자동입력 -->
							<!-- 회원번호 <input type="text" name="m_no"><br> 자동 입력 -->
							<div class="form-group" style="width:250px;">
     							 <label for="m_name" style="float:left;" >이름</label>
      							 <input type="text" class="form-control" name="m_name" id = "m_name" placeholder="이름 입력">
    						</div>
							<div class="form-group" style="width:250px;">
     							 <label for="m_phone" style="float:left;" >연락처</label>
      							 <input type="text" class="form-control" name="m_phone" id = "m_phone" placeholder="- 없이 입력하세요.">
    						</div>
							<div class="form-group" style="width:250px;">
     							 <label for="m_birth" style="float:left;" >생년월일</label>
      							 <input type="text" class="form-control" name="m_birth" id = "m_birth" placeholder="ex)890213">
    						</div>
							<div class="form-group" style="width:250px;">
     							 <label for="m_email" style="float:left;" >email</label>
      							 <input type="text" class="form-control" name="m_email" id = "m_email" placeholder="이메일 입력">
    						</div>
							<div class="form-group" style="width:250px;">
     							 <label for="m_addr" style="float:left;" >우편주소</label>
      							 <input type="text" class="form-control" name="m_addr" id = "m_addr" placeholder="주소 입력">
      						</div>	
      						
      						 
<!-- 다음 우편번호 -->   							 
<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class = "btn btn-default"><br>
<span id="guide" style="color:#999"></span>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                /* document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress; */
               	var str=data.zonecode+" "+fullRoadAddr+" "+data.jibunAddress;
                document.getElementById('m_addr').value= str;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
<!-- 다음 우편번호 -->					 
    						<div class="form-group" style="width:250px;">
     							 <label for="m_daddr" style="float:left;" >상세주소</label>
      							 <input type="text" class="form-control" name="m_daddr" id = "m_daddr" placeholder="주소 입력">
      						</div>	
      						
    						<div class="form-group" style="width:250px;">
    						<label for="m_petok" style="float:left;" >입양 경험 여부</label>
    						<select name="m_petok">
								<option value="N">없음</option>
								<option value="Y">있음</option>
							</select>
     						</div>

							<!-- 파일 업로드 <input type="text" name="m_birth"><br> 개인은 필요없음-->
							<!-- 정보수정일 update 실행시에 자동 입력 -->
							<!-- 회원가입일 insert 실행시에 자동 입력 -->
							<input id="submit" type ="submit" value="가입하기" class = "btn btn-primary">
							<input type ="reset" value = "다시입력" class = "btn btn-default">
						</form>
					</div>
	
					
	
	
	 <%
		pageContext.include("../../include/footer.jsp");
	%>
	
	
	
	
	<script>
		$(function(){
			//fadeinout();
			$('#colour-variations ul').styleSwitcher({
				defaultThemeId: 'theme-switch',
				hasPreview: false,
				cookie: {
		          	expires: 30,
		          	isManagingLoad: true
		      	}
			});	
			$('.option-toggle').click(function() {
				$('#colour-variations').toggleClass('sleep');
			});
			
			//아이디 중복검사
			$('#idcheck').click(function(){
				$('#checkid').empty();	
				$.ajax({
					type:"post",
					dataType:"html",
					url:"checkid.jsp",
					data:{id:$('#m_id').val().trim()},
					success:function(receiveddata){
						
						if($.trim(receiveddata)=="y"){
							$('#checkid').append("이미 있는 ID 입니다!");
							$('#m_id').focus();
						}else{
							$('#checkid').append("사용 가능한 ID 입니다!");
						}
					}
				});
			});

			//유효성 검사
			$("#submit").click(function(){
				if($.trim($("#m_id").val()) == ''){
					alert("아이디를 입력하세요.");
			        $("#m_id").focus();
			        return false;
				}else if($.trim($("#m_name").val()) == '' ){
			        alert("이름을 입력하세요.");
			        $("#m_name").focus();
			        return false;
				}else if( $.trim($("#m_pwd").val()) == '' ){
				    alert("비밀번호를 입력하세요.");
				    $("#m_pwd").focus();
				    return false;  
				}else if( $.trim($("#m_pwd").val()) != $.trim($("#re_pwd").val()) ){
				    alert("비밀번호가 일치하지 않습니다.");
				    $("#re_pwd").focus();
				    return false;   
				}else if(!chk(/^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/, $('#m_phone'))){
					alert("전화번호가 잘못 되었습니다.");
					$("#m_mail").focus();
					return false;
				}else if(!chk(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/, $('#m_email'))){
					alert("이메일이 잘못 되었습니다.");
					$("#m_mail").focus();
					return false;
				}else if( $.trim($("#m_addr").val()) == '' ){
					alert("주소를 알려주세요.");
					$("#m_addr").focus();
					return false;			 
				}else if( $.trim($("#checkid").html()) == "이미 있는 ID 입니다!" ){
					$("#m_id").focus();
					return false;			 
				}else{
					alert("회원 가입이 완료 되었습니다.");
					return true;
				}
			});			
		});
		
		//정규식 체크함수
		function chk(re, e) {
			if (re.test(e.val())) {
		    	return true;
		    } else {
		    	return false;
		    }
		}
	</script>

	</body>
</html>