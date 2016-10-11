package com.d15.Service;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jettison.json.JSONObject;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Organic_DAO;
import com.d15.DTO.Organic_DTO;

public class SituationCheck_Service implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String desertion = request.getParameter("desertionNo");
		System.out.println(desertion);
		response.setContentType("text/html;charset=UTF-8");
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		Organic_DAO organic_DAO = new Organic_DAO();
		JSONObject jobj = new JSONObject();
		try {
			Organic_DTO ck = organic_DAO.selectOrganic(desertion);
			if(ck == null){
				System.out.println("없는거");
			}else{
				System.out.println("있는거");
				jobj.put("Org_no", ck.getOrg_no());
				jobj.put("Org_count", ck.getOrg_count());
				jobj.put("Org_situation", ck.getOrg_situation());
				response.getWriter().print(jobj);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		return null;
	}

}
