/*
 * @Class : D15_SigunguURL_Service
 * @Date : 2016.10.6
 * @Author : 이성준
 * @Desc : 노필요
 */


package com.d15.keyURL;

import java.io.IOException;
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
		list.put("upr_cd", upr_cd);
		list.put("numOfRows", "999");
		list.put("pageNo", "1");
		String keyurl = key.urlKey(searchkey.ptAnimalKey.getProperty("sigungu"), list);

		try {
			response.getWriter().print(keyurl);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

}
