package com.d15.keyURL;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;


public class wetPet_sigunguURL_Servie implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		WePet_property_animalKey searchkey = WePet_property_animalKey.init();
		HashMap<String,String> list = new HashMap<>();
		WePet_key key = new WePet_key();
		
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
