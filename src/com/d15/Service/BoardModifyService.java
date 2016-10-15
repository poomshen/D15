/*
 * @Class : BoardModify_Service
 * @Date : 2016.10.5
 * @Author : 조한솔
 * @Desc : Q&A 게시판에서 글 수정 기능을 위한  Service 클래스
 */

package com.d15.Service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Board_DAO;
import com.d15.DTO.Board_DTO;

public class BoardModifyService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		boolean result = false;
		boolean userCheck = false;
		
		int num = Integer.parseInt(request.getParameter("B_NO"));
		
		Board_DAO boarddao = new Board_DAO();
		Board_DTO boarddata = new Board_DTO();
		
        //실수정 (글제목 , 글내용) => qna_board_Modify.jsp
		boarddata.setB_no(num);
		boarddata.setB_name(request.getParameter("B_NAME"));
		boarddata.setB_content(request.getParameter("B_CONTENT"));
		
		try {
			result = boarddao.boardModify(boarddata);
			if (result == false) {

				System.out.println("게시판 수정 실패");
				return null;
			}
			System.out.println("게시판 수정 성공");
		} catch (Exception e) {
			// TODO: handle exception
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/D15/BoardDetail.Board?num="+boarddata.getB_no());
		return forward;
	}

}
