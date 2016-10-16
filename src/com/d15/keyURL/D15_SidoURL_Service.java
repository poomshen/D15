/*
 * @Class : D15_SidoURL_Service
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


public class D15_SidoURL_Service implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//유기동물조회 조회조건의 '시도'조건	동물보호관리시스템의 유기동물조회 조회조건의 '시도'조건을 가져올 수 있다
		D15_Property_animalKey searchkey = D15_Property_animalKey.init();
		HashMap<String,String> list = new HashMap<>();
		D15_key key = new D15_key();
		
		list.put("numOfRows", "999");
		list.put("pageNo", "1");
		String keyurl = key.urlKey(searchkey.ptAnimalKey.getProperty("sido"), list);
		
		try {
			response.getWriter().print(keyurl);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

}
