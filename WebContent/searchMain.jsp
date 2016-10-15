<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	   var age =[];
       var careAddr=[];
       var careNm=[];
       var careTel=[];
       var chargeNm=[];
       var colorCd=[];
       var desertionNo=[];
       var filename=[];
       var happenDt=[];
       var happenPlace=[];
       var kindCd=[];
       var neuterYn=[];
       var noticeEdt=[];
       var noticeNo=[];
       var noticeSdt=[];
       var officetel=[];
       var orgNm=[];
       var popfile=[];
       var processState=[];
       var sexCd=[];
       var specialMark=[];
       var weight=[];
       var totalCont;
       var pagecount=0;
       var key = "";
       var yqlURL;
       var ck=0;
       
   $(function(){
	   ajaxLoading();
	   function ajaxLoading(){
			console.log("로딩중")
		    var loading = $('<div id="loading" class="loading"></div><img id="loading_img" alt="loading" src="http://blog.teamtreehouse.com/wp-content/uploads/2015/05/InternetSlowdown_Day.gif" />').appendTo(document.body).hide();

		    $(window)   
		    .ajaxStart(function(){
		       loading.show();
		    })
		    .ajaxStop(function(){
		       loading.hide();
		    });
		}
	   
      //공공데이터 포탈의 service key 형태가 일반적인 형태의 키가 아님(%같은 기호 포함)
      //그래서 .ajax의 data안에 파라미터들이 json 형태로 전달되지 않아 직접 url 사용
      //yahoo api - crossdomain 해결
      //나중에 서버키가 정상 작동되면 필요없을지도...
      key = encodeURIComponent("${keyurl}");
       yqlURL = [
           "http://query.yahooapis.com/v1/public/yql",
           "?q=" + encodeURIComponent("select * from xml where url='" + "${keyurl}&numOfRows=${numOfRows}&pageNo=${pageNo}" + "'"),
           "&format=xml&callback=?"
       ].join("");
       $.getJSON(yqlURL, function(data){
    	   ajaxLoading();
    	    var xmlContent = $(data.results[0]);
    	    //item 태그마다 필요한 값 뽑아내기 
    	    //굳이  xml을 json으로 바꿀 필요는 없음
    	    //var item = $(xmlContent).find('item').text();
    	    //document.setAttribute("item", item);
            
    	    var i =1;
    	   $(xmlContent).find('item').each(function(){
    	        age[i] =$(this).find('age').text();
    	        careAddr[i]=$(this).find('careAddr').text();
    	        careNm[i]=$(this).find('careNm').text();
    	        careTel[i]=$(this).find('careTel').text();
    	        chargeNm[i]=$(this).find('chargeNm').text();
    	        colorCd[i]=$(this).find('colorCd').text();
    	        desertionNo[i]=$(this).find('desertionNo').text();
    	        filename[i]=$(this).find('filename').text();
    	        happenDt[i]=$(this).find('happenDt').text();
    	        happenPlace[i]=$(this).find('happenPlace').text();
    	        kindCd[i]=$(this).find('kindCd').text();
    	        neuterYn[i]=$(this).find('neuterYn').text();
    	        noticeEdt[i]=$(this).find('noticeEdt').text();
    	        noticeNo[i]=$(this).find('noticeNo').text();
    	        noticeSdt[i]=$(this).find('noticeSdt').text();
    	        officetel[i]=$(this).find('officetel').text();
    	        orgNm[i]=$(this).find('orgNm').text();
    	        popfile[i]=$(this).find('popfile').text();
    	        processState[i]=$(this).find('processState').text();
    	        sexCd[i]=$(this).find('sexCd').text();
    	        specialMark[i]=$(this).find('specialMark').text();
    	        weight[i]=$(this).find('weight').text();
    	        
    	        $("#img"+i).attr("src",popfile[i]);
    	        var kind = kindCd[i].substring(3);
    	        $("#st"+i).append(kind);
    	        $("#so"+i).append(careAddr[i]);
				
    	       i++;        
           });

        });  
   		
     });
	
	
  </script>



