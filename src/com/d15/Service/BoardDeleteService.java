/*
 * @Class : BoardDelete_Service
 * @Date : 2016.10.5
 * @Author : 조한솔
 * @Desc : Q&A 게시판에서 글삭제기능을 위한  Service 클래스
 */

package com.d15.Service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Board_DAO;


public class BoardDeleteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response){

		boolean result = false;
		boolean userCheck = false;
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageName=(String)request.getParameter("name");
		System.out.println("name확인 : " + request.getParameter("name"));
		
		Board_DAO boarddao = new Board_DAO();

		result = boarddao.boardDelete(num);
		
		if(result == false){
			
			System.out.println("게시물 삭제 실패");
			return null;
		}
		System.out.println("게시물 삭제 성공");
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		
		if(pageName.equals("qna")){
			forward.setPath("BoardList.Board?name=qna");
		}else if(pageName.equals("review")){
			forward.setPath("BoardList.Board?name=review");
		}
		return forward;
		
		
	}

}
