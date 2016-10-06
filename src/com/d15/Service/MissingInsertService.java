package com.d15.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Pet_DAO;
import com.d15.DTO.Kind_DTO;
import com.d15.DTO.Pet_DTO;

public class MissingInsertService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		//
		Pet_DTO petdto=new Pet_DTO();
		
		petdto.setP_image(request.getParameter("p_image"));
		petdto.setP_gender(request.getParameter("p_gender"));
		petdto.setP_color(request.getParameter("p_color"));
		petdto.setP_feature(request.getParameter("p_feature"));
		petdto.setP_age(Integer.parseInt(request.getParameter("p_age")));
		petdto.setP_weight(Integer.parseInt(request.getParameter("p_weight")));	
		
		//Kind_DTO kinddto=new Kind_DTO();
		//kinddto.setK_kind(request.getParameter("k_kind"));
		
		Pet_DAO petdao = new Pet_DAO();
		int n = petdao.insertPet(petdto, request.getParameter("k_kind"));
		
		System.out.println(petdto);
		//System.out.println(kinddto);
		System.out.println(n);
		
		return null;
	}
}