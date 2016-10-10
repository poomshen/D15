package com.d15.Service;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jettison.json.JSONObject;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Organic_DAO;
import com.d15.DTO.Organic_DTO;


/// 데이터베이스에 유기견 데이터을 집어 넣는 서비스
public class PublicDB_Service implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		try {
		//한글 처리
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		/*
		  "desertionNo":desertionNo[index],: 동물번호
	   		"popfile":popfile[index], : 이미지
	   		"sexCd":sexCd[index], : 성별
	   		"processState":processState[index],: 상태
	   		"happenDt":happenDt[index], 발견 날짜
	   "noticeEdt":noticeEdt[index],: 끝 날짜
	   "noticeSdt":noticeSdt[index] : 시작 날짜
		*/
		// 제이슨 객체 만들기 위함
		JSONObject jobj = new JSONObject();
		
		String org_animal = request.getParameter("desertionNo");
		String org_img = request.getParameter("popfile");
		//여기에 품종 가져오자
		String kindCd = URLDecoder.decode(request.getParameter("kindCd"));
		String org_gender = request.getParameter("sexCd");
		String org_situation = URLDecoder.decode(request.getParameter("processState"));
		int org_date = (Integer.parseInt(request.getParameter("noticeEdt")) - Integer.parseInt(request.getParameter("noticeSdt")));
		
		Organic_DTO org =new Organic_DTO(org_animal, org_img, org_gender, org_situation, org_date,kindCd);
		Organic_DTO orgck = new Organic_DTO();
		Organic_DAO orgDao = new Organic_DAO();
		
		
			orgck = orgDao.selectOrganic(org_animal);
			
			if(orgck.getOrg_no() == 0 ){
				System.out.println("없는 시퀀스 일때 생성");
				//데이터베이스 저장
				orgDao.insertOrganic(org);
				//조회수올리기 
				orgDao.insertCount(org_animal);
				
				org = orgDao.selectOrganic(org_animal);
				jobj.put("Org_no", org.getOrg_no());//시퀀스 번호
				jobj.put("Org_count", org.getOrg_count());//조회수
				jobj.put("Org_situation", org.getOrg_situation());//상태
				response.getWriter().print(jobj);
			}else{
				System.out.println("있는 아이디");
				//조회수
				orgDao.insertCount(org_animal);
				
				jobj.put("Org_no", orgck.getOrg_no());
				jobj.put("Org_count", orgck.getOrg_count());
				jobj.put("Org_situation", orgck.getOrg_situation());
				response.getWriter().print(jobj);
			}
			
	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
