/*
 * @Class : ReviewReplyView_Service
 * @Date : 2016.10.12
 * @Author : 조한솔
 * @Desc : 후기 게시판에서 답글 작성시 답글페이지로 가기위한  Service 클래스
 */

package com.d15.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Review_DAO;
import com.d15.DTO.Review_DTO;


public class ReviewReplyView_Service implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		String reply=null;
		
		Review_DAO reviewdao = new Review_DAO();
		Review_DTO reviewdto = new Review_DTO();
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		if(request.getParameter("reply")!=null){
			
			reply =request.getParameter("reply");
		}
		
		try {
			reviewdto = reviewdao.getDetail(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(reviewdto == null){
			
			System.out.println("원본 데이터 로드 실패");
			return null;
		}
		System.out.println("원본 데이터 로드 성공");
		
		//원본 데이터 가져오기
		request.setAttribute("reviewdto", reviewdto);
		request.setAttribute("reply", reply);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("Board/Review_Reply.jsp");
		
		return forward;
		
	}

}
