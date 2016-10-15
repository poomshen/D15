/*
 * @Class : ReviewModify_Service
 * @Date : 2016.10.11
 * @Author : 조한솔
 * @Desc : 후기게시판에서 작성한 글 수정기능위한  Service 클래스
*/

package com.d15.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Review_DAO;
import com.d15.DTO.Review_DTO;

public class ReviewModify_Service implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		boolean result = false;
		boolean userCheck = false;
		
		int num = Integer.parseInt(request.getParameter("BR_NO"));
		
		Review_DAO reviwdao = new Review_DAO();
		Review_DTO reviwdto = new Review_DTO();
			
        
		reviwdto.setBr_no(num);
		reviwdto.setBr_name(request.getParameter("BR_NAME"));
		reviwdto.setBr_content(request.getParameter("BR_CONTENT"));
		
		try {
			result = reviwdao.reviewModify(reviwdto);
			if (result == false) {

				System.out.println("게시판 수정 실패");
				return null;
			}
			System.out.println("게시판 수정 성공");
		} catch (Exception e) {
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/D15/ReviewDetail.Review?num="+reviwdto.getBr_no());
		
		return forward;
	}

}
