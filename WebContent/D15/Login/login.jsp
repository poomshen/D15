<%--
 * @Class : login.jsp
 * @Date : 2016.10.7
 * @Author : 길한종
 * @Desc : 로그인 폼
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
							<h1 class="to-animate">로그인</h1>
							<h2 class="to-animate">들어가십쇼...</h2>
						</div>
					</div>
					<div>
						<form action="LoginOk.login" method="post">
							<center>
							<div class="form-group" style="width:250px;">
      							<label for="m_id" style="float:left;">ID</label>
      							<input type="text" class="form-control" name="m_id" id = "m_id" placeholder="아이디 입력" >   
    						</div>
    						<div class="form-group" style="width:250px;">
     							 <label for="m_pwd" style="float:left;" >비밀번호</label>
      							 <input type="password" class="form-control" name="m_pwd" id = "m_pwd" placeholder="비밀번호 입력">
    						</div>
    						</center>
							<input type="submit" value="로그인">
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