package com.d15.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.BoardReply_DAO;

public class ReplyDelete_Service implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		int re_no =	 Integer.parseInt(request.getParameter("re_no")); //덧글의 순번(고유값)

		BoardReply_DAO  replydao = new BoardReply_DAO();
		boolean result = replydao.replyDelete(re_no);
		
		if(result!=false) {
			
			request.setAttribute("result", "success");
		}
		else {
			
			request.setAttribute("result", "success");
		}
		
		ActionForward forward = new ActionForward();
	    request.setAttribute("re_no", re_no);	    
	    forward.setRedirect(false);
	    forward.setPath("/Board/Board_Reply_deleteOk.jsp");
		
		return forward;
	}

}
