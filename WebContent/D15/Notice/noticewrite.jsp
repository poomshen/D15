<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style = "margin-bottom:40px; margin-top:100px">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- bootstrap css -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
	<header>
		<jsp:include page = "../../include/header.jsp"/>
	</header>
	<div class="container">
	<h3>공지사항 등록</h3>
	<hr/>
	<form action="NoticeInsert.notice" method="get" 
		 name="boardform"  class="form-horizontal">
		
			 <div class="form-group">
	   			 <label class="control-label col-sm-2" for="notice_name">제목</label>
			    <div class="col-sm-4">
			      <input type="text" name="notice_name" class="form-control" id="notice_name">
			    </div>
			  </div>
			
			<div class="form-group">
	   			 <label class="control-label col-sm-2" for="m_id">글쓴이</label>
			    <div class="col-sm-4">
			      <input type="text" name="m_id" class="form-control" value="관리자" id="m_id" readonly="readonly">
			    </div>
			  </div>
		
			<div class="form-group">
	   			 <label class="control-label col-sm-2" for="notice_content">내용</label>
			    <div class="col-sm-8">
			      <textarea rows="10" name="notice_content" id="notice_content" class="form-control">
			      
			      </textarea>
			    </div>
			  </div>
			
			<div class="form-group">
	   			<div class="col-sm-2"></div>
			    <div class="col-sm-4">
			      	<input type="submit" class="btn btn-default" id="submitBtn" value="등록">  &nbsp;&nbsp;
			   		<a href="javascript:history.go(-1)" class="btn btn-default">뒤로</a>
			    </div>
			 </div>
		</form>
		
	</div>
	<footer>
		<jsp:include page = "../../include/footer.jsp"/>
	</footer>
</body>
</html>