<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
$(function(){
	
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

key = encodeURIComponent("${keyurl}");
yqlURL = [
    "http://query.yahooapis.com/v1/public/yql",
    "?q=" + encodeURIComponent("select * from xml where url='" + "${keyurl}&numOfRows=${numOfRows}&pageNo=${pageNo}" + "'"),
    "&format=xml&callback=?"
].join("");
$.getJSON(yqlURL, function(data){
	    var xmlContent = $(data.results[0]);
	    var i =0;
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
	        
	       i++;        
    	});
	});
});
</script>
</body>
</html>