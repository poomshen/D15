<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>메인페이지</title>

	<!-- bootstrap css -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	 <style>
  	.navbar{
  		background-color:white;
  		border: 0px;
  	}

	#rowdiv{
		background-color: white;
	}

	#rowdiv a{
	}

	.logo{
		font-size : 18px;
	}

  	</style>

</head>

<body>

	<header>
		<jsp:include page="include/header.jsp"/>  
	</header>

	<section>	
			<div class="container">
			
				<div class="row">
					
					<div class="col-sm-4">
						
						  <img src="/TeamProject3_D15/images/Koala.jpg" class="img-thumbnail" alt="Cinque Terre" width="304" height="236">
						    <h2>멍멍</h2>
						 	 <p>크르르릉크르르르릉</p>
						  	<input type="button" class="btn btn-default" value="보러가기">
					</div>
				
					<div class="col-sm-4">
							  <img src="/TeamProject3_D15/images/Koala.jpg" class="img-thumbnail" alt="Cinque Terre" width="304" height="236">
								  <h2>왈왈</h2>
								  <p>끼잉끼이이끼이잉</p>
						    	<input type="button" class="btn btn-default" value="보러가기">
					</div>
			
					<div class="col-sm-4">
						  <img src="/TeamProject3_D15/images/Koala.jpg" class="img-thumbnail" alt="Cinque Terre" width="304" height="236">
						  <h2>컹컹</h2>
						  <p>꺄륵꺄르르르르륵꺄륵</p>
						  <input type="button" class="btn btn-default" value="보러가기">
					</div>
					
					
				</div>
					
		    </div> <!-- /container -->
	</section>

	<br><br><br>    

	<footer>    
		<jsp:include page="include/footer.jsp"/>
	</footer>
	<!-- bootstrap js -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</body>
</html>