/*
 * @Class : ReviewReply_Service
 * @Date : 2016.10.11
 * @Author : 조한솔
 * @Desc : 후기 게시판에서 답글을 쓰는 기능을 위한  Service 클래스
 */

package com.d15.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Review_DAO;
import com.d15.DTO.Review_DTO;


public class ReviewReply_Service implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		Review_DAO reviewdao = new Review_DAO();
		Review_DTO reviewdto = new Review_DTO();
		
		int result = 0;
		
		reviewdto.setBr_no(Integer.parseInt(request.getParameter("BR_NO")));
		reviewdto.setM_id(request.getParameter("M_ID"));
		reviewdto.setBr_name(request.getParameter("BR_NAME"));
		reviewdto.setBr_content(request.getParameter("BR_CONTENT"));	
		reviewdto.setBr_ref(Integer.parseInt(request.getParameter("BR_REF")));
		reviewdto.setBr_depth(Integer.parseInt(request.getParameter("BR_DEPTH")));
		reviewdto.setBr_step(Integer.parseInt(request.getParameter("BR_STEP")));
		
		result = reviewdao.reviewReply(reviewdto);
		int no = reviewdao.MaxNo();
		
		if(result == 0){
			
			System.out.println("답변 실패");
			return null;
		}
		System.out.println("답변 성공");
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);		
		forward.setPath("/D15/ReviewDetail.Review?name=review&num=" +no );
		
		return forward;
	}
		

}
