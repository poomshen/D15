/*
 * @Class : BoarModifyView_Service
 * @Date : 2016.10.11
 * @Author : 조한솔
 * @Desc : 후기 게시판에서 글수정 화면을 보기위한  Service 클래스
 */

package com.d15.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Review_DAO;
import com.d15.DTO.Review_DTO;

public class ReviewModifyView_Service implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		int num =Integer.parseInt(request.getParameter("num"));
		
		Review_DAO reviewdao = new Review_DAO();
		Review_DTO reviewdata = new Review_DTO();
		
		try {
			reviewdata =reviewdao.getDetail(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(reviewdata == null){		
			System.out.println("수정 상세보기 실패");
			return null;
		}
		System.out.println("수정 상세보기 성공");
		

		request.setAttribute("reviewdata", reviewdata);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("Board/Review_Modify.jsp");
		
		return forward;
	}

}
