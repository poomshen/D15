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
		form > input {
			color: black;
		}
	</style>
	</head>
	<body>
	<%
		pageContext.include("../../include/header.jsp");
	%>
	
	<section id="fh5co-home" data-section="home" style="background-image: url(images/full_image_2.jpg);" data-stellar-background-ratio="0.5">
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
					<div>
						<form action="RegisterPerOk.login">
							<!-- 회원번호 <input type="text" name="m_no"><br> 자동 입력 -->
							아이디 <input type="text" name="m_id"><br>
							패스워드 <input type="password" name="m_pwd" id="m_pwd"><br>
							패스워드 다시 입력 <input type="password" id="re_pwd"><br><!-- js로 유효성 검사 해야됨 -->
							<!-- 최종방문일 <input type="text" name="m_lastdate"><br> 자동입력 -->	
							<!-- 권한코드 <input type="text" name="c_code"><br> 자동입력 -->
							
							<!-- 회원번호 <input type="text" name="m_no"><br> 자동 입력 -->
							이름 <input type="text" name="m_name"><br>
							연락처 <input type="text" name="m_phone"><br>
							생년월일 <input type="text" name="m_birth"><br>
							Email <input type="text" name="m_birth"><br>
							거주정보 <input type="text" name="m_birth"><br>
							입양 경험 여부 <input type="text" name="m_birth"><br>
							생년월일 <input type="text" name="m_birth"><br>
							<!-- 정보수정일 update 실행시에 자동 입력 -->
							<!-- 회원가입일 insert 실행시에 자동 입력 -->
							
							<input type="submit" value="가입하기">
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="slant"></div>
	</section>
	
	
	
	
	<%
		pageContext.include("../../include/footer.jsp");
	%>
	
	
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
		});
	</script>
	<!-- End demo purposes only -->

	</body>
</html>