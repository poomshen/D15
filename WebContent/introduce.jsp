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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
.navbar {
	background-color: white;
	border: 0px;
}

#rowdiv {
	background-color: white;
}

#rowdiv a {
	
}

.logo {
	font-size: 18px;
}

ul.tab {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
}

/* Float the list items side by side */
ul.tab li {float: left;}

/* Style the links inside the list items */
ul.tab li a {
    display: inline-block;
    color: black;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    transition: 0.3s;
    font-size: 17px;
}

/* Change background color of links on hover */
ul.tab li a:hover {background-color: #ddd;}

/* Create an active/current tablink class */
ul.tab li a:focus, .active {background-color: #ccc;}

/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
}

</style>

<script>
$(function(){
	
	$('#London').css('display','block');
	
});

function openCity(evt, cityName) {
    // Declare all variables
    var i, tabcontent, tablinks;

    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabcontent");
    
    tabcontent[0].style.display = "block";
    
    
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the link that opened the tab
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}
</script>
</head>

<body>

	<header>
		<jsp:include page="include/header.jsp" />
	</header>
	<section>

		<div class="container">
			
			<div class="jumbotron" style="background-color: white;">
			
				<h3>살아나개 사랑하개!!</h3><br>
				<p>KOSTA 129기 1조가 만든 유기견 보호 사이트 입니다.</p>
				
				
			</div>
			<br/>
			<ul class="tab">
				<li><a href="#" class="tablinks"
					onclick="openCity(event, 'London')">살아나개!</a></li>
				<li><a href="#" class="tablinks"
					onclick="openCity(event, 'Paris')">취지</a></li>
				<li><a href="#" class="tablinks"
					onclick="openCity(event, 'Tokyo')">Tokyo</a></li>
			</ul>

			<div id="London" class="tabcontent">
				<h3>London</h3>
				<h4>우리집</h4>
			</div>

			<div id="Paris" class="tabcontent">
				<h3>Paris</h3>
				<p>Paris is the capital of France.</p>
			</div>

			<div id="Tokyo" class="tabcontent">
				<h3>Tokyo</h3>
				<p>Tokyo is the capital of Japan.</p>
			</div>



		</div>




	</section>
	<br><br><br>
	<footer>    
		<jsp:include page="include/footer.jsp"/>
	</footer>
	<!-- jQuery, ui -->
	
	<!-- bootstrap js -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</body>
</html>