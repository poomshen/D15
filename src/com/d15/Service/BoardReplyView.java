/*
 * @Class : BoardReplyView_Service
 * @Date : 2016.10.6
 * @Author : 조한솔
 * @Desc : Q&A 게시판에서 답글 작성시 답글페이지로 가기위한  Service 클래스
 */

package com.d15.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Board_DAO;
import com.d15.DTO.Board_DTO;

public class BoardReplyView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response){
		String reply=null;
		Board_DAO boarddao = new Board_DAO();
		Board_DTO boarddata = new Board_DTO();
		int num = Integer.parseInt(request.getParameter("num"));
		if(request.getParameter("reply")!=null){
			reply =request.getParameter("reply");
		}
		
		
		try {
			boarddata = boarddao.getDetail(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(boarddata == null){
			
			System.out.println("원본 데이터 로드 실패");
			return null;
		}
		System.out.println("원본 데이터 로드 성공");
		
		//원본 데이터 담기
		request.setAttribute("boarddata", boarddata);
		request.setAttribute("reply", reply);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("Board/Board_Reply.jsp");
		return forward;
	}

}
