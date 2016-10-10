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
	<%
		pageContext.include("../../include/head.jsp");
	%>
	<style>
		form > input, option, select {
			color: black;
		}
	</style>
	</head>
	
	<%
		pageContext.include("../../include/header.jsp");
	%>
	
	<!-- <section id="fh5co-home" data-section="home" style="background-image: url(images/full_image_2.jpg);" data-stellar-background-ratio="0.5">
		<div class="gradient"></div>
		<div class="container">
			<div class="text-wrap">
				<div class="text-inner">
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<h1 class="to-animate">회원 가입</h1>
							<h2 class="to-animate">좀 도와주십쇼</h2>
						</div>
					</div>
					 -->
					
					<h1 class="to-animate">회원 가입</h1>
					<div>
						가입 유형 <input name="radio" id="p" type="radio" value="person">개인 <input name="radio" id="g" type="radio" value="group">보호소<br>
					</div>
					
					<div id="person">
						<form action="RegisterPerOk.login" method="post">
							<table>
								<tr>
									<td>
							<!-- 회원번호 <input type="text" name="m_no"><br> 자동 입력 -->
							<div class="form-group" style="width:250px;">
     							 <label for="m_id" style="float:left;" >아이디</label>
      							 <input type="text" class="form-control" name="m_id" id = "m_id" placeholder="아이디 입력">
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
      							 <input type="text" class="form-control" name="m_phone" id = "m_phone" placeholder="연락처 입력">
    						</div>
							<div class="form-group" style="width:250px;">
     							 <label for="m_birth" style="float:left;" >생년월일</label>
      							 <input type="text" class="form-control" name="m_birth" id = "m_birth" placeholder="생년월일 입력">
    						</div>
							<div class="form-group" style="width:250px;">
     							 <label for="m_email" style="float:left;" >email</label>
      							 <input type="text" class="form-control" name="m_email" id = "m_email" placeholder="이메일 입력">
    						</div>
							<div class="form-group" style="width:250px;">
     							 <label for="m_addr" style="float:left;" >거주정보</label>
      							 <input type="text" class="form-control" name="m_addr" id = "m_addr" placeholder="주소 입력">
    						</div>
    						<div class="form-group" style="width:250px;">
    						<label for="m_petok" style="float:left;" >입양 경험 여부</label>
    						<select name="m_petok">
								<option value="N">없음</option>
								<option value="Y">있음</option>
							</select>
     						</div>
     						</table>
							<!-- 파일 업로드 <input type="text" name="m_birth"><br> 개인은 필요없음-->
							<!-- 정보수정일 update 실행시에 자동 입력 -->
							<!-- 회원가입일 insert 실행시에 자동 입력 -->
							<input type ="submit" value="가입하기" class = "btn btn-primary">
							<input type ="reset" value = "다시입력" class = "btn btn-default">
						</form>
					</div>
					
					<div id="group">
						<form action="RegisterGrpOk.login" method="post">
							<!-- 보호소번호 자동입력-->
							보호소명 <input type="text" name="st_name"><br>
							전화번호 <input type="text" name="st_phone"><br>
							위치 <input type="text" name="st_loc"><br>
							담당자명 <input type="text" name="st_mgr"><br>
							담당자 연락처 <input type="text" name="mgrphone"><br>
							<input type="submit" value="가입하기">
						</form>
					</div>	
					
					
		<!-- 			
				</div>
			</div>
		</div>
		<div class="slant"></div>
	</section>
	 -->
	
	
	
	<%-- <%
		pageContext.include("../../include/footer.jsp");
	%>
	 --%>
	
	<%
		pageContext.include("../../include/script.jsp");
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
			
			$('#group').hide();
			$('#person').hide();
			
			//회원가입 유형선택
			$('#p').click(function(){
				$('#group').hide();
				$('#person').show();
			});
			$('#g').click(function(){
				$('#person').hide();
				$('#group').show();
			});
		});
	</script>

	</body>
</html>