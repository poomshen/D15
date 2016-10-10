package com.d15.keyURL;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;


public class D15_SidoURL_Service implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//유기동물조회 조회조건의 '시도'조건	동물보호관리시스템의 유기동물조회 조회조건의 '시도'조건을 가져올 수 있다
		D15_Property_animalKey searchkey = D15_Property_animalKey.init();
		HashMap<String,String> list = new HashMap<>();
		D15_key key = new D15_key();
		
		String numOfRows = request.getParameter("numOfRows");
		String pageNo = request.getParameter("pageNo");
		list.put("numOfRows", numOfRows);
		list.put("pageNo", pageNo);
		String keyurl = key.urlKey(searchkey.ptAnimalKey.getProperty("sido"), list);
		request.setAttribute("keyurl", keyurl);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/boardlist.jsp");
		return forward;
	}

}
