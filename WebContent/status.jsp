<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style = "margin-bottom:40px; margin-top:100px">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>메인페이지</title>

	<!-- bootstrap css -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<!-- 특별히 앞쪽에 -->
	<script src="http://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
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
  	<style>
   /* 로딩 이미지*/
   #loading {
      height: 100%;
      left: 0px;
      position: fixed;
      _position:absolute; 
      top: 0px;
      width: 100%;
      filter:alpha(opacity=50);
      -moz-opacity:0.5;
      opacity : 0.5;
   }
   
   .loading {
      background-color: white;
      z-index: 199;
   }
   
   #loading_img{
      position:absolute; 
      top:50%;
      left:45%;
      height:90px;
      margin-top:-75px;   //   이미지크기
      margin-left:-75px;   //   이미지크기
      z-index: 200;
   }
</style>
</head>

<body>

	<header>
		<jsp:include page="include/header.jsp"/>  
	</header>

	<!-- 하이차트 js -->
	<script src="http://code.highcharts.com/highcharts.js"></script>
	<script>
	
	$(function(){
		
		//쿼리 및 차트 생성
		$(function(){
			ajaxLoading();
			logic();
			console.log(result);
			$(document).ajaxStop(function(){
		    	makeChart();
			});
		});
		
		//ajax로딩화면 처리
		function ajaxLoading(){
	    	var loading = $('<div id="loading" class="loading"></div><img id="loading_img" alt="loading" src="http://blog.teamtreehouse.com/wp-content/uploads/2015/05/InternetSlowdown_Day.gif" />').appendTo('#container').hide();
	    	$(window)
	    	.ajaxStart(function(){
	       		loading.show();
	    	})
	    	.ajaxStop(function(){
	       		loading.hide();
	    	});
	    }
		
		var request="http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?ServiceKey=pkOhzZ%2BOoa4ITGGyF6z47sKIHLuKlaBLDuxHRIjs1mSORv6G6zFi3gh5tnhHPmmfKq3KALQDPSt7Tw0iEi65XA%3D%3D&upkind=417000&pageNo=1&startPage=1&numOfRows=1&pageSize=1";
		var date={
		    y2012:[
		           {start:"20120101", end:"20120131"},
		           {start:"20120201", end:"20120229"},
		           {start:"20120301", end:"20120331"},
		           {start:"20120401", end:"20120430"},
		           {start:"20120501", end:"20120531"},
		           {start:"20120601", end:"20120630"},
		           {start:"20120701", end:"20120731"},
		           {start:"20120801", end:"20120831"},
		           {start:"20120901", end:"20120930"},
		           {start:"20121001", end:"20121031"},
		           {start:"20121101", end:"20121130"},
		           {start:"20121201", end:"20121231"}
		       ],
		    y2013:[
		           {start:"20130101", end:"20130131"},
		           {start:"20130201", end:"20130228"},
		           {start:"20130301", end:"20130331"},
		           {start:"20130401", end:"20130430"},
		           {start:"20130501", end:"20130531"},
		           {start:"20130601", end:"20130630"},
		           {start:"20130701", end:"20130731"},
		           {start:"20130801", end:"20130831"},
		           {start:"20130901", end:"20130930"},
		           {start:"20131001", end:"20131031"},
		           {start:"20131101", end:"20131130"},
		           {start:"20131201", end:"20131231"}
		       ],
		    y2014:[
		           {start:"20140101", end:"20140131"},
		            {start:"20140201", end:"20140228"},
		            {start:"20140301", end:"20140331"},
		            {start:"20140401", end:"20140430"},
		            {start:"20140501", end:"20140531"},
		            {start:"20140601", end:"20140630"},
		            {start:"20140701", end:"20140731"},
		            {start:"20140801", end:"20140831"},
		            {start:"20140901", end:"20140930"},
		            {start:"20141001", end:"20141031"},
		            {start:"20141101", end:"20141130"},
		            {start:"20141201", end:"20141231"}
		        ],
		    y2015:[
		            {start:"20150101", end:"20150131"},
		            {start:"20150201", end:"20150228"},
		            {start:"20150301", end:"20150331"},
		            {start:"20150401", end:"20150430"},
		            {start:"20150501", end:"20150531"},
		            {start:"20150601", end:"20150630"},
		            {start:"20150701", end:"20150731"},
		            {start:"20150801", end:"20150831"},
		            {start:"20150901", end:"20150930"},
		            {start:"20151001", end:"20151031"},
		            {start:"20151101", end:"20151130"},
		            {start:"20151201", end:"20151231"}
		        ],
		    y2016:[
		            {start:"20160101", end:"20160131"},
		            {start:"20160201", end:"20160229"},
		            {start:"20160301", end:"20160331"},
		            {start:"20160401", end:"20160430"},
		            {start:"20160501", end:"20160531"},
		            {start:"20160601", end:"20160630"},
		            {start:"20160701", end:"20160731"},
		            {start:"20160801", end:"20160831"},
		            {start:"20160901", end:"20160930"}
		        ]
		};
		         
		//년도별 데이터 구하기
		var result=[];
		var result1=[];
		var result2=[];
		var result3=[];
		var result4=[];
		var term;
		var _url;
		var yqlURL;
		var count;
		var xmlContent;
		    
		function logic(){

			//2012년도 데이터
		    $.each(date.y2012, function(index, obj){    
		       	yearData(index,obj);
		       	//xml 파싱, totalcount를 result에 저장
		       	$.getJSON(yqlURL, function(data){
		       		xmlContent = $(data.results[0]);
		       		count=Number($(xmlContent).find('totalCount').text());
		          	result[index]=count;
		       	}); 
		    });
		       
		    //2013년도 데이터
		    $.each(date.y2013, function(index, obj){
		       	yearData(index,obj);
		        $.getJSON(yqlURL, function(data){
		            xmlContent = $(data.results[0]);
		            count=Number($(xmlContent).find('totalCount').text());
		            result1[index]=count;
		        }); 
		    }); 
		       
		    //2014년도 데이터
		    $.each(date.y2014, function(index, obj){
		        yearData(index,obj);
		        $.getJSON(yqlURL, function(data){
		            xmlContent = $(data.results[0]);
		            count=Number($(xmlContent).find('totalCount').text());
		            result2[index]=count;
		        }); 
		    });  
		        
		    //2015년도 데이터
		    $.each(date.y2015, function(index, obj){
		        yearData(index,obj);
		        $.getJSON(yqlURL, function(data){
		            xmlContent = $(data.results[0]);
		            count=Number($(xmlContent).find('totalCount').text());
		            result3[index]=count;
		        });
		    });
		        
		    //2016년도 데이터
		    $.each(date.y2016, function(index, obj){
		        yearData(index,obj);
		        $.getJSON(yqlURL, function(data){
		            xmlContent = $(data.results[0]);
		            count=Number($(xmlContent).find('totalCount').text());
		            result4[index]=count;
		        });
		    });
		        
		} //logic()끝
		    
		function yearData(index , obj){
		    term="&bgnde="+obj.start+"&endde="+obj.end;
		    _url=request+term;   
		          
		    //yahoo api - crossdomain 해결
		    yqlURL = [
		        "http://query.yahooapis.com/v1/public/yql",
		        "?q=" + encodeURIComponent("select * from xml where url='" + _url + "'"),
		        "&format=xml&callback=?"
		    ].join("");
		};
		    
		//하이차트 생성 함수
		function makeChart(){ 
		        
		    $('#container').highcharts({
		        title: {
		        	text: '연도별 유기동물 신고 수',
		        	x: -20 //center
		        },
		        subtitle: {
		            text: 'Source: 공공데이터 포털(www.data.go.kr)',
		            x: -20
		        },
		        xAxis: {
		        	categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
		            'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
		        },
		        yAxis: {
		            title: {
		                text: '신고 수 (건)'
		            },
		            plotLines: [{
		                value: 0,
		                width: 1,
		                color: '#808080'
		            }]
		        },
		        tooltip: {
		            valueSuffix: '건'
		        },
		        legend: {
		            layout: 'vertical',
		            align: 'right',
		            verticalAlign: 'middle',
		            borderWidth: 0
		        },
		        series: [
		            { name: "2012년", data: result },
		            { name: "2013년", data: result1 },
		            { name: "2014년", data: result2 },
		            { name: "2015년", data: result3 },
		            { name: "2016년", data: result4 }
		        ]
		    });
		} //makeChart()끝		
	}); //onload끝
	
    </script>

	<section>	
			<div class="container" id="container"></div> <!-- /container -->
	</section>
	
	<br><br><br>    
	<footer>    
		<jsp:include page="include/footer.jsp"/>
	</footer>
	
	<!-- jQuery, ui -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU=" crossorigin="anonymous"></script>
	<!-- bootstrap js -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>