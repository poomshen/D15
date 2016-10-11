<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
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
	   $("#d15_body").hide();
		
		$("#protectView").hide();
		$("#parcelView").hide();
		
	
	   
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
    	    totalCont=Number($(xmlContent).find('totalCount').text());
            var pagesize=${numOfRows};
       		if(totalCont % pagesize==0){        //전체 건수 , pagesize > 
          		 pagecount = totalCont/pagesize;
      		 }else{
           		pagecount = Math.ceil(totalCont/pagesize)+ 1;
       		}
            	$("#pages").append("<a href='#' onclick=page("+(${pageNo}-1)+")>[이전]<a>");
            for(var i=1 ; i < pagecount ; i+=5){
         	   		for(var x=i ; x<i+5 ; x++){
         	   			if(x+1 <=pagecount){
            					if(${pageNo}==x ){
            					$("#pages").append("["+x+"]");
         	   				}else if(${pageNo}>i-1 && ${pageNo}<i+5){
            					$("#pages").append("<a href='#' onclick=page("+x+")>["+x+"]<a>");
            					}else if(x == i+5){
            						for(var y=x; y<x+5 ; y++){
            					$("#pages").append("<a href='#' onclick=page("+y+")>["+y+"]<a>");
            						}
            					} 
         	   			}
         	   		}
            }
            	$("#pages").append("<a href='#' onclick=page("+(${pageNo}+1)+")>[다음]<a>");
    	    var i =0;
    	    $("#search").html(" ");//페이지가 넘어 갈때마다 초기화
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
    	       
    	       /* $.getJSON("selectcount.keyurl", {"desertionNo":$(this).find('desertionNo').text()}, function(data, textStatus, req) {
    	    	   	console.log(data);	
    	    	   	processState[i] = data.Org_situation;
				});   */ 
    	         	/* <img alt='"+desertionNo[i]+"' src='"+popfile[i]+"' >"+age[i]+"<br>"+careNm[i]+"<br>"+careAddr[i]+"<br>"+processState[i]+"</div>"); */
    	       		//$("#search").append("<div class='clearfix visible-sm-block'></div>");
    	       		$.getJSON("SituationCheck.ProtectOut", {"desertionNo":$(this).find('desertionNo').text()}, function(data, textStatus, req) {
    	       			
    	       		})
    	         	
    	         	$("#search").append("<div class='col-md-4 col-sm-6 col-xxs-12' id=list"+i+"><a onclick='searchclick("+i+")' class='fh5co-project-item image-popup to-animate'><img src='"+popfile[i]+"' alt='"+desertionNo[i]+"' class='img-responsive'><div class='fh5co-text'><h2>"+processState[i]+"</h2><span>측정나이: "+age[i]+"<br> 보호소:"+careNm[i]+"<br> 품종:"+kindCd[i]+"<br></span>");
    	       		$("#search").append("</div></a></div>");
    	         
    	       i++;
           });
         });  
   		
   		
 		$("#close").click(function() {
				$("#d15_body").hide();
				$("#detailView").show();
				$("#protectView").hide();
				$("#parcelView").hide();
			})
		//상세 보기
		$("#detailSelect").click(function() {
				$("#protectView").hide();
				$("#parcelView").hide();
				$("#detailView").show();
				
		})
		//임시보호
		$("#parcelSelect").click(function() {
			$("#detailView").hide();
			$("#protectView").hide();
			$("#parcelView").show();
		})
		//
		$("#protectSelect").click(function() {
			$("#detailView").hide();
	 		$("#parcelView").hide();
			$("#protectView").show();
		})
     });
	
	//임시보호 함수
	function insertProtect(ck){
		console.log(ck);
	}
	
	//분양 함수
	function insertProtect(){
		
	}
	
	function ajaxLoading(){

	    var loading = $('<div id="loading" class="loading"></div><img id="loading_img" alt="loading" src="http://blog.teamtreehouse.com/wp-content/uploads/2015/05/InternetSlowdown_Day.gif" />').appendTo(document.body).hide();

	    $(window)   
	    .ajaxStart(function(){
	       loading.show();
	    })
	    .ajaxStop(function(){
	       loading.hide();
	    });
	}
   //게시판 이미지 클릭 시 이벤트
   function searchclick(index){
	   //$("#list"+index).append(kindCd[index])
	   var count;
	   //컨트롤러를 통해 DB저장
	   $.getJSON("/TeamProject3_D15/D15/ProtectOut/insertPublic.ProtectOut", {
	   "desertionNo":desertionNo[index],
	   "popfile":popfile[index],
	   "sexCd":sexCd[index],
	   "processState": encodeURIComponent(processState[index]),
	   "happenDt":happenDt[index],
	   "noticeEdt":noticeEdt[index],
	   "noticeSdt":noticeSdt[index],
	   "kindCd":encodeURIComponent(kindCd[index])
	   }, function(data, textStatus, req) {
		   //조회수 가지고 오기
		   //console.log(data.Org_situation);
		   count  = data.Org_count;
		   no = data.Org_no
	   $("#d15_body").show();
	   $("#d15_body1").addClass("d15_bodyEvt2");
	   $("#d15_body2").addClass("d15_bodyEvt3");
	   $("#protectform").attr("action", "insertProtect.ProtectOut?no="+no);
	   $("#parceform").attr("action", "insertParceform.ProtectOut?no="+no);
	   $("#detailView").html("<div><img alt='"+desertionNo[index]+"' src='"+popfile[index]+"'></div>");
	   $("#detailView").append("<div>"+count+"<br>"+careNm[index]+"<br>"+careAddr[index]+"<br>"+processState[index]+"</div>")
	   })
	   
	}
   
   //페이지 처리
   function page(index){
	   location.href="/TeamProject3_D15/D15/ProtectOut/page.ProtectOut?pageNo="+index+"&numOfRows=${numOfRows}&key="+key
	  /*  $.get("dskjfk.LoginManager", {"pageNo":index}, function(data, textStatus, req) {
	   	console.log(${pageNo});
	   }) */
	   
   }
   <%@ include file="../../js/main.js" %>
  </script>



