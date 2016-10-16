<%--
 * @Class : MypageStatus.jsp
 * @Date : 2016.10.12
 * @Author : 길한종
 * @Desc : 분양 신청정보 보기 view
 			wrapper완료
 --%>

<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="shortcut icon"  href="/TeamProject3_D15/images/favicon.ico">
<!DOCTYPE html>
<html style = "margin-bottom : 40px; margin-top:100px">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>살아나개 사랑할개</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
#wrapper {
	margin-top: 100px;
	margin-botton: 40px;
}

</style>

</head>

<body>

	<header>

		<jsp:include page="../../include/header.jsp" />
	</header>
	<c:set var="dtolist" value="${requestScope.dtolist}" />
	
	<div class="container">
	<h3>분양 관리</h3>
	<br><br>
	<ul class="nav nav-tabs">
  		<li role="presentation"><a href="/TeamProject3_D15/D15/Login/Mypage.login">회원정보</a></li>
  		<li role="presentation" class="active"><a href="/TeamProject3_D15/D15/Login/MypageStatus.login">분양</a></li>
  		<li role="presentation"><a href="/TeamProject3_D15/D15/Login/MypageStatus2.login">임시보호</a></li>
  		<li role="presentation"><a href="/TeamProject3_D15/D15/Login/myTakeMessagelist.Message">받은 쪽지함</a></li>
  		<li role="presentation"><a href="/TeamProject3_D15/D15/Login/myMakeMessagelist.Message">보낸 쪽지함</a></li>
	</ul>
	</div>
	<script type="text/javascript">
	function isck(ck){
		$("#myModal"+ck).modal({backdrop: "static"});
	}
	</script>
	
	<div class = "col-sm-2"></div>
	<div class = "col-sm-8">
		<!-- <h1 style = "text-align:center">분양 신청 내역</h1> -->
		<table class="table table-hover">
				<tr>
					<th>분양번호</th>
					<th>유기견이미지</th>
					<th>유기견상태</th>
					<th>승인신청일</th>
					<th>분양시작일</th>
					<th>승인상태</th>
				</tr>
				<c:forEach var="i" items="${dtolist}">
					<tr>
						<td>${i.pc_no}</td>
						<td><img alt="개사진" src="${i.org_img }" style="width: 200px; height: 100px;" class="img-thumbnail"></td>
						<td>${i.org_situatton}</td>
						<td>${i.pc_reqdate}</td>
						<td>${i.pc_begdate}</td>
						<c:choose>
							<c:when test="${i.pc_argdate == null}">
								<td><button type="button" class="btn btn-warning">미승인</button></td>
							</c:when>
							<c:when test="${i.pc_argdate == '1992-09-21'}">
							<td><button type="button" class="btn btn-danger">승인거절</button></td>
							</c:when>
							<c:otherwise>
								<td><button type="button" onclick="isck(${i.pc_no})" class="btn btn-success">승인</button>
									${i.pc_argdate}</td>
	 	<div class="modal fade" id="myModal${i.pc_no}" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        <div class="modal-header"  style="padding:300px 50px 0px ; background-image: url('${i.org_img}'); background-repeat: repeat; " >
          <h3 id="mdate" style="text-align: center; "><span class="glyphicon glyphicon-hourglass">${i.pc_begdate}</span></h3>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
        	<!-- 상세보기 부분 -->
        	<div id="detailSelect">
        <label style="margin-left:33%; margin-right:30%;font-size: 30px;">
        <h5 id="mSituation" style="font-size: 25px;"><span class="glyphicon glyphicon-leaf">${ i.org_situatton}</span></h5></label>
            <div  width: 48%">
               <label for="mName"><span class="glyphicon glyphicon-tint"></span>품종</label>
              <input type="text" readonly="readonly" class="form-control" id="mName"value="${ i.org_code}" }>
            </div>
            <div class="form-group" >
              <label for="mSw"><span class="glyphicon glyphicon-star"></span>전화번호</label>
              <input type="text" class="form-control" readonly="readonly" id="mSw" value="${i.st_no }" }>
            </div>
            <div class="form-group">
              <label for="mAddr"><span class="glyphicon glyphicon-map-marker"></span>보호장소</label>
              <input type="text" readonly="readonly" class="form-control" id="mAddr" value="${ i.org_addr}">
            </div>
        	</div>
        </div>
        <div class="modal-footer">
      	<button type="submit" style="width: 100%" class="btn btn-danger btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span>닫기</button>
        </div>
      </div>
    </div>
  </div>
 <div id="container"></div>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="col-sm-2"></div>
		
	</div>
	
	<!-- Modala 만든는 폼 -->
 
	<footer>
		<jsp:include page="../../include/footer.jsp" />
	</footer>
	<div align="center">
</body>
</html>