package com.d15.keyURL;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;


public class D15_kindURL_Service implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		D15_Property_animalKey searchkey = D15_Property_animalKey.init();
		HashMap<String,String> list = new HashMap<>();
		D15_key key = new D15_key();

		String up_kind_cd = request.getParameter("up_kind_cd");
		String numOfRows = request.getParameter("numOfRows");
		String pageNo = request.getParameter("pageNo");
		list.put("up_kind_cd", up_kind_cd);
		list.put("numOfRows", numOfRows);
		list.put("pageNo", pageNo);
		String keyurl = key.urlKey(searchkey.ptAnimalKey.getProperty("kind"), list);
		request.setAttribute("keyurl", keyurl);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/boardlist.jsp");
		return forward;
	}

}
