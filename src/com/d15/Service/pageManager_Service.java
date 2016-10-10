package com.d15.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;

public class pageManager_Service implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		String pageno = request.getParameter("pageNo");
		String keyurl = request.getParameter("key");
		String numOfRows = request.getParameter("numOfRows");
		//String pageno = request.getAttribute("pageNo");
		request.setAttribute("pageNo", Integer.parseInt(pageno));
		request.setAttribute("numOfRows", numOfRows);
		request.setAttribute("keyurl", keyurl);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("WePet_SearchQuestion.jsp");
		
		return forward;
	}
	

	
}
