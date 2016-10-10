package com.d15.keyURL;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;


public class D15_SigunguURL_Servie implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		D15_Property_animalKey searchkey = D15_Property_animalKey.init();
		HashMap<String,String> list = new HashMap<>();
		D15_key key = new D15_key();
		
		String upr_cd = request.getParameter("upr_cd");
		String numOfRows = request.getParameter("numOfRows");
		String pageNo = request.getParameter("pageNo");
		list.put("upr_cd", upr_cd);
		list.put("numOfRows", numOfRows);
		list.put("pageNo", pageNo);
		String keyurl = key.urlKey(searchkey.ptAnimalKey.getProperty("sigungu"), list);
		request.setAttribute("keyurl", keyurl);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/boardlist.jsp");
		return forward;
	}

}
