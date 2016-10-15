/*
 * @Class : BoarModifyView_Service
 * @Date : 2016.10.5
 * @Author : 조한솔
 * @Desc : Q&A 게시판에서 글수정 화면을 보기위한  Service 클래스
 */

package com.d15.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Board_DAO;
import com.d15.DTO.Board_DTO;

public class BoardModifyView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		int num =Integer.parseInt(request.getParameter("num"));
		System.out.println("num" + num);
		Board_DAO boarddao = new Board_DAO();
		Board_DTO boarddata = new Board_DTO();
		
		try {
			boarddata =boarddao.getDetail(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(boarddata == null){
			
			System.out.println("수정 상세보기 실패");
			return null;
		}
		System.out.println("수정 상세보기 성공");
		

		request.setAttribute("boarddata", boarddata);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("Board/Board_Modify.jsp");
		return forward;
		
		
	}

}
