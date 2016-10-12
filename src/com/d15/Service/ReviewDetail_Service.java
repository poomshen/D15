/*
 * @Class : ReviewDetail_Service
 * @Date : 2016.10.11
 * @Author : 조한솔
 * @Desc : 후기게시판의 상세보기 기능위한  Service 클래스
*/

package com.d15.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Board_DAO;
import com.d15.DAO.Review_DAO;
import com.d15.DTO.Board_DTO;
import com.d15.DTO.Review_DTO;

public class ReviewDetail_Service implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		int num =Integer.parseInt(request.getParameter("num"));
		
		Review_DAO reviewdao = new Review_DAO();
		Review_DTO reviewdto = new Review_DTO();
		
		String pageName=request.getParameter("name");
		
		try {
						
			reviewdao.setReadCountUpdate(num); 		//조회수update
			reviewdto = reviewdao.getDetail(num);	//상세보기
			
			if (reviewdto == null) {

				System.out.println("Null Data");
				return null;
			}
			System.out.println("reviewdto Data 완료");

			//view 처리
			request.setAttribute("reviewdto", reviewdto);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("Board/Review_View.jsp");

		return forward;
	}

}
