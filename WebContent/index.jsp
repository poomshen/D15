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
						
						  <img src="/images/Koala.jpg" class="img-thumbnail" alt="Cinque Terre" width="304" height="236">
						    <h2>Thumbnail</h2>
						 	 <p>The .img-thumbnail class creates a thumbnail of the image:</p>
						  	<input type="button" class="btn btn-default" value="보러가기">
					</div>
				
					<div class="col-sm-4">
							  <img src="/images/Koala.jpg" class="img-thumbnail" alt="Cinque Terre" width="304" height="236">
								  <h2>Thumbnail</h2>
								  <p>The .img-thumbnail class creates a thumbnail of the image:</p>
						    	<input type="button" class="btn btn-default" value="보러가기">
					</div>
			
					<div class="col-sm-4">
						  <img src="/images/Koala.jpg" class="img-thumbnail" alt="Cinque Terre" width="304" height="236">
						  <h2>Thumbnail</h2>
						  <p>The .img-thumbnail class creates a thumbnail of the image:</p>
						  <input type="button" class="btn btn-default" value="보러가기">
					</div>
					
					
				</div>
					
		    </div> <!-- /container -->
	</section>
	<br/><br/>    
	<footer>    
		<jsp:include page="include/footer.jsp"/>
	</footer>
	<!-- jQuery, ui -->
	<script src="http://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU=" crossorigin="anonymous"></script>
	<!-- bootstrap js -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</body>
</html>