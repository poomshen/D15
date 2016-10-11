package com.d15.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;

public class SituationCheck_Service implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		request.getParameter("desertionNo");
		
		
		return null;
	}

}
