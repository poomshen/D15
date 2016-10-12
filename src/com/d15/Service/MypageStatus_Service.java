package com.d15.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;

public class MypageStatus_Service implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward=new ActionForward();
		HttpSession session=request.getSession();
		session.getAttribute("memberdto");
		return forward;
	}

}
