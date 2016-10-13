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
<style>
   img{max-width:100%; height:auto;}
</style>  
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
										
<body style="margin-bottom:40px;">

	<header>
		<jsp:include page="include/header.jsp" />
	</header>
	<section>

		<div class="container">
			
			<div class="jumbotron">
				<h3>살아갈개 사랑할개!!</h3><br>
				<p>KOSTA 129기 1조가 만든 유기견 보호 사이트 입니다.</p>
			</div>
			
			<ul class="tab" id="title">
	            <li><a href="#title" class="tablinks"
	               onclick="openCity(event, 'Livedog')">사랑할개?</a></li>
	            <li><a href="#Sequence" class="tablinks"
	               onclick="openCity(event, 'Sequence')">분양 절차</a></li>
	            <li><a href="#Object" class="tablinks"
	               onclick="openCity(event, 'Object')">사이트 개설 목적</a></li>
	            <li><a href="#Location" class="tablinks"
	               onclick="openCity(event, 'Location')">찾아오시는 길</a></li>
         	</ul>
         	
			<div id="Livedog" class="tabcontent">
				<div class = "text-right" >
            		<a id = "file" href = "/TeamProject3_D15/D15/introduce/dog.hwp" class = "atch_view m-tcol-c" title="애완견 분양계획서">
            			★ 첨부파일(1)
            		</a>
            	</div>
               	<div>
               		<h3>사랑할개 홈페이지에 오신 여러분을 진심으로 환영합니다.</h3>
                     <button id="button" class = "btn btn-default">
               			Click Me (English, Japanese)
               		</button>
               		<br/>
               		<div id="love" style="display:none;font-size:25px;color:skyblue;">
               			<p>LovelyDog Homepage I wholeheartedly welcome to come to you.</p>
               			<p>欢迎 (huānyíng)。欢迎 (huānyíng)。</p>
           				<p>愛している犬  ホームページ訪問を歓迎します。</p>
                 	</div>
                 	<br/>
              	</div>
         		<div>
		            <img src = "/TeamProject3_D15/images/shop_detail2.png" alt = "소개페이지_1"></img>
		            <br/><br/>
		            <img src = "/TeamProject3_D15/images/view_policy.png" alt = "소개페이지_2"></img>
         		</div> 	
			</div>

			<div id="Sequence" class="tabcontent">
	            <div class = "title">        
	               <h3>사랑할개의 분양절차를 알려드립니다.</h3>
	               <br/><br/>
	            </div>
				<div class = "pic">
	          		<img src = "/TeamProject3_D15/images/sellStepText.png" alt = "분양절차_1"></img>
	       		</div>
			</div>

			<div id="Object" class="tabcontent">
	          	<img class="center-block" src = "/TeamProject3_D15/images/doglove.PNG" alt = "러브펫"></img>
				<p>&nbsp;&nbsp;&nbsp;"살아갈개 사랑할개"는 전국의 길을 잃은 견공들이 좋은 주인을 만날 수 있도록 도와주는 사이트 입니다.
            	사랑스러운 견공들이 고통받는 것을 줄이고자 미래犬이 후원하고 (사)창조애완스마트뉴딜실천연합, 전국애완견사랑협의회가 주관하여 운영하고 있습니다.
            	강아지들이 행복한 주인을 만나 새로운 삶을 살아가기 위해서는 여러분의 많은 관심과 격려, 그리고 정보공유가 필요합니다.
            	본 사이트에서는 여러분들의 사랑에 맞춰 견공들과 함께하는 동행자가 될 수 있도록 최선의 노력을 다 할 것임을 약속드립니다.</p>
			</div>
			
			<div id="Location" class="tabcontent">
				<h1>찾아오시는 길</h1>
				<p>주소 :경기도 성남시 분당구 삼평동 대왕판교로 670길 유스페이스2 B동 13층</p>
            	<p>대표자 : 이성준 / 이메일 : poomshen@gmail.com</p>
            	<p>사업자 등록번호 : 123-80-88357&nbsp;<input type = "button" id="button1" value = "지도보기" class = "btn btn-default">
    			</p>
    			<div id = "display"></div>
    					
			</div>

		</div>

	</section>

	<footer>    
		<jsp:include page="include/footer.jsp"/>
	</footer>
	
	<!-- jQuery, ui -->
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- bootstrap js -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<!-- 지도표시 스크립트 -->
	<script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=907df564dd90f479c37c43bccdbaa153"></script>
	<!-- 버튼클릭 이벤트 -->
	<script type="text/javascript">

        $(function(){
        	$('#button').click(function(){
        		$('#love').show();
        	});
        	
        	$("#button1").click(function(){ //지도표시
        		$.ajax({
        			type:"post",
        			url:"map.jsp",
        			dataType:"html",
        			success:function(data){
        				$("#display").empty();
        				$("#display").append(data);
        			}
        		});
        	});
        });
    </script>
</body>
</html>