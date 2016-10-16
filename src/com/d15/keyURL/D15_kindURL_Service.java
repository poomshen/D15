/*
 * @Class : D15_kindURL_Service
 * @Date : 2016.10.6
 * @Author : 이성준
 * @Desc : 필요없는 서비스
 */

package com.d15.keyURL;

import java.io.IOException;
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
		list.put("up_kind_cd", up_kind_cd);
		list.put("numOfRows", "999");
		list.put("pageNo", "1");
		String keyurl = key.urlKey(searchkey.ptAnimalKey.getProperty("kind"), list);
		
		try {
			response.getWriter().print(keyurl);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

}
