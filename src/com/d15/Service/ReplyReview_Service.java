package com.d15.Service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.BoardReply_DAO;
import com.d15.DAO.ReviewReply_DAO;
import com.d15.DTO.BoardReply_DTO;
import com.d15.DTO.ReviewReply_DTO;

public class ReplyReview_Service implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		ReviewReply_DAO reviewdao = new ReviewReply_DAO();
		ReviewReply_DTO reviewdto = new ReviewReply_DTO ();

	    Calendar cal=Calendar.getInstance();
	    Date sqldate=null;
	    
	    try {
	    
	    	SimpleDateFormat transFormat = new SimpleDateFormat("yy-MM-dd");
	    	java.util.Date date = transFormat.parse(transFormat.format(cal.getTime()));
	    	sqldate=new Date(date.getTime());

	    } catch (Exception e) {
	    	System.out.println(e.getMessage());
	    }
		
		
		int result = 0;
		reviewdto.setM_no(2);
		reviewdto.setBr_no(Integer.parseInt(request.getParameter("br_no")));
		reviewdto.setRer_content(request.getParameter("rer_content").replace("\r\n", "<br>"));
		System.out.println("콤마가 빠졌대");
		result = reviewdao.replywrite(reviewdto);
		System.out.println("콤마가 빠졌대2");	
		
		if(result>0) {
			System.out.println("댓글 입력 성공");
			request.setAttribute("result", "success");
		}
		else {
			System.out.println("댓글 입력 실패");
			request.setAttribute("result", "fail");
		}

		
		ActionForward forward = new ActionForward();   
	    forward.setRedirect(false);
		forward.setPath(null);
		
		return forward;


		}
}
