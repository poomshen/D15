package com.d15.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Review_DAO;

public class ReviewDelete_Service implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		boolean result = false;
		boolean userCheck = false;
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageName=(String)request.getParameter("name");
		System.out.println("name확인 : " + request.getParameter("name"));
		
		Review_DAO reviewdao = new Review_DAO();

		result = reviewdao.reviewDelete(num);
		
		if(result == false){
			
			System.out.println("게시물 삭제 실패");
			return null;
		}
		System.out.println("게시물 삭제 성공");
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		
		if(pageName.equals("review")){
			System.out.println("if 내부 실행");
			forward.setPath("ReviewList.Review?name=review");
		}
		return forward;
	}


}
