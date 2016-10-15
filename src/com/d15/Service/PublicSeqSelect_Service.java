/*
 * @Class : NoticeDelete_Service
 * @Date : 2016.10.14
 * @Author : 박문수
 * @Desc : DB에서 유기견 데이터를 json으로 가져오는 Service
 */


package com.d15.Service;


import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Organic_DAO;
import com.d15.DTO.Organic_DTO;


/// 데이터베이스에 유기견 데이터을 집어 넣는 서비스
public class PublicSeqSelect_Service implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//한글 처리
		response.setContentType("text/html;charset=UTF-8");
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		// key와 value로 구성되어있는 HashMap 생성.
        //Map<string, string=""> m = new HashMap<string, string="">();
		JSONObject jobj = new JSONObject();
		String org_animal = request.getParameter("desertionNo");
        // Map 타입의 m을 BuilderFactory에 넣어준다. (JsonBuilderFactory는 Json을 만들기 위한 뼈대라고 보면 됨)
	
		Organic_DTO orgDto = new Organic_DTO();
		Organic_DAO orgDao = new Organic_DAO();
		 try {
			orgDto = orgDao.selectOrganic(org_animal);
			jobj.put("Org_no", orgDto.getOrg_no());
			jobj.put("getOrg_count", orgDto.getOrg_count());
			jobj.put("Org_situation", orgDto.getOrg_situation());
			
			//
			response.getWriter().print(jobj);
			
		} catch (Exception e) {
		}
		return null;
	}

}
