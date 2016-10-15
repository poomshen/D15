/*
 * @Class : BoardReply_Servic
 * @Date : 2016.10.6
 * @Author : 조한솔
 * @Desc : Q&A 게시판에서 답글을 쓰는 기능을 위한  Service 클래스
 */

//답글
package com.d15.Service;

//답글
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Board_DAO;
import com.d15.DTO.Board_DTO;


public class BoardReplyService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {

		Board_DAO boarddao = new Board_DAO();
		Board_DTO boarddto = new Board_DTO();
		
		int result = 0;
		
		boarddto.setM_no(Integer.parseInt(request.getParameter("m_no")));
		boarddto.setB_no(Integer.parseInt(request.getParameter("B_NO")));
		boarddto.setB_name(request.getParameter("B_NAME"));
		boarddto.setB_content(request.getParameter("B_CONTENT"));	
		boarddto.setB_ref(Integer.parseInt(request.getParameter("B_REF")));
		boarddto.setB_depth(Integer.parseInt(request.getParameter("B_DEPTH")));
		boarddto.setB_step(Integer.parseInt(request.getParameter("B_STEP")));
		
		result = boarddao.boardReply(boarddto);
		int no = boarddao.MaxNo();
		
		if(result == 0){
			
			System.out.println("답변 실패");
			return null;
		}
		System.out.println("답변 성공");
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);			
		forward.setPath("/D15/BoardDetail.Board?name=qna&num=" + no );

		return forward;
	}

}
