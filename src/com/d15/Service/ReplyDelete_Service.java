package com.d15.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Board_DAO;
import com.d15.DAO.Reply_DAO;

public class ReplyDelete_Service implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		int b_no =  Integer.parseInt(request.getParameter("b_no")); //덧글의 원본 게시글 번호
		int re_no =	 Integer.parseInt(request.getParameter("re_NO")); //덧글의 순번(고유값)

		Reply_DAO  replydao = new Reply_DAO();
		boolean result = replydao.replyDelete(b_no);
		
		if(result!=false) {
			
			request.setAttribute("result", "success");
		}
		else {
			
			request.setAttribute("result", "success");
		}
		
		ActionForward forward = new ActionForward();
	    request.setAttribute("b_no", b_no);
	    
	    forward.setRedirect(false);
	    forward.setPath("BoardList.Board");
		
		return forward;
	}

}
