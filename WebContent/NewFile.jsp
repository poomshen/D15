<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
   img{max-width:100%; height:auto;}
</style>
<title>메인페이지</title>
<!-- bootstrap css -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
<style>
  label {
    display: inline-block;
    width: 5em;
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
         
            <h3>살아갈개 사랑할개!!</h3><br>
            <p>KOSTA 129기 1조가 만든 유기견 보호 사이트 입니다.</p>
            
            
         </div>
         <br/>
         <ul class="tab">
            <li><a href="#" class="tablinks"
               onclick="openCity(event, 'Livedog')">사랑할개!!</a></li>
            <li><a href="#" class="tablinks"
               onclick="openCity(event, 'Sequence')">분양절차</a></li>
            <li><a href="#" class="tablinks"
               onclick="openCity(event, 'Object')">취지</a></li>
            <li><a href="#" class="tablinks"
               onclick="openCity(event, 'Map')">Tokyo</a></li>
         </ul>



         <div id="Livedog" class="tabcontent">
            
            <div  class = "text-right" >
            	<a id = "file" href = "/TeamProject3_D15/D15/introduce/dog.hwp" class = "atch_view m-tcol-c" title="애완견 분양계획서">
            		★ 첨부파일(1)
            	</a>
            </div>
            <script type="text/javascript">
               $(function(){
                  $("#accordion").accordion({
                     collapsible: true
                  });
               });
            </script>
            <div id = "accordion">
            <div style = "display : block;" class = "container">
               <div class = "title">
                  <h1>사랑할개?</h1>
                  <p id = "love">欢迎 (huānyíng)。欢迎 (huānyíng)。- 환영합니다.</p>
                  <p>사랑할개 홈페이지에 오신 여러분을 진심으로 환영합니다.</p>
                  
                  <button type = "button" onclick = "myFunction()">
                  ♥Click Me!! (English, Japanese)♥
                  </button>
                  <br/><br/>
               </div>
            </div>
            <div><p>愛している犬  ホームページ訪問を歓迎します。</p></div><br/><br/>
         </div>
         <div class = "pic">
            <img src = "/TeamProject3_D15/images/shop_detail2.png" alt = "소개페이지_1"></img>
            <br/><br/>
            <br/><br/>
            <img src = "/TeamProject3_D15/images/view_policy.png" alt = "소개페이지_2"></img>
            <br/><br/>
         </div>
         <div>
            <div class = "margin"></div>
            <div class = "title">
               <h2>분양절차</h2>
               <hr/>
               <h3>사랑할개의 분양절차를 알려드립니다.</h3>
               <br/><br/>
            </div>
         </div>
         <div class = "pic">
            <img src = "/TeamProject3_D15/images/sellStepText.png" alt = "분양절차_1"></img>
         </div><br/><br/>
         <div class = "pic">
            <img src = "/TeamProject3_D15/images/doglove.PNG" alt = "러브펫"></img>
         </div>
         <div class = "margin">
            <p>
            &nbsp;&nbsp;&nbsp;"살아갈개 -> 사랑할개"는 전국의 길을 잃은 강아지들에 대해서 좋은 주인을 만날 수 있도록 도와주는 홈페이지로서
            저희는 더 이상 사랑하는 강아지들이 비난받고 아픔을 앓아가는 것을 그만 보고자 미래犬이 후원하고 (사)창조애완 스마
            트뉴딜실천연합, 전국애완견사랑협의회가 주최·주관하는 분양회로서 저희 강아지들이 행복한 주인을 만나 새로운 삶을 
            살아가기 위해서는 여러분의 관심과 격려와 많은 정보의 도움이 필요합니다. 그냥 단지 살아가는 강아지들을 사랑하는 
            사랑하는 강아지로 바꾸기 위해서 꾸준한 사랑이 필요합니다. 저희는 그에 맞게 섬세하고 철저한 강아지들의 파악뿐더러
            분양과정에서 차질이 없도록 옆에서 함께하는 동행자가 되도록 할 것임을 약속드립니다.
            </p>
         </div>
         
         <div id="Sequence" class="tabcontent">
            <h3>분양절차</h3>
            <br/>
            <p>사랑하개의 분양절차를 알려드립니다.</p>
            <br/><hr/><br/>
            <div class = "step">
               <img src = "/TeamProject3_D15/images/sell_step.png" alt = "분양절차_2"></img>
            </div>
         </div>

         <div id="Object" class="tabcontent">
            <h3>홈페이지 제작 취지</h3>
            <p>Paris is the capital of France.</p>
         </div>

         <div id="Map" class="tabcontent">
            <h1>찾아오시는 길</h1><hr/>
            <!--
   * Daum 지도 - 약도서비스
   * 한 페이지 내에 약도를 2개 이상 넣을 경우에는
   * 약도의 수 만큼 소스를 새로 생성, 삽입해야 합니다.
-->
<!-- 1. 약도 노드 -->
<div id="daumRoughmapContainer1476273207815" class="root_daum_roughmap root_daum_roughmap_landing"></div>

<!-- 2. 설치 스크립트 -->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="http://dmaps.daum.net/map_js_init/roughmapLoader.js"></script>

<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">
   new daum.roughmap.Lander({
      "timestamp" : "1476273207815",
      "key" : "dig3",
      "mapWidth" : "520",
      "mapHeight" : "300"
   }).render();
</script>
            <br/><br/><p>주소 :경기도 성남시 분당구 삼평동 대왕판교로 670길 유스페이스2 B동 13층</p>
            <p>대표자 : 이성준 / 이메일 : poomshen@gmail.com</p>
            <p>사업자 등록번호 : 123-80-88357</p>
         </div>



      </div>




   </section>
   <br><br><br>
   <footer>    
      <jsp:include page="include/footer.jsp"/>
   </footer>
   <!-- jQuery, ui -->
   <!-- 위에있음 -->
   <!-- bootstrap js -->
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

   
   <script type="text/javascript">
                     function myFunction(){
                        document.getElementById("love").style.fontSize = "25px";
                        document.getElementById("love").style.color = "skyblue";
                        document.getElementById("love").innerHTML = "LovelyDog Homepage I wholeheartedly welcome to come to you."
                     }
    </script>
 
  
</body>
</html>