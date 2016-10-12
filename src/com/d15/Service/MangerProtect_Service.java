package com.d15.Service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Protect_DAO;
import com.d15.DTO.MangerProtect_DTO;

// 임시 보호
public class MangerProtect_Service  implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		ActionForward forward = new ActionForward();
		
		Protect_DAO  protect_DAO = new Protect_DAO();
		try {
			ArrayList<MangerProtect_DTO> list = protect_DAO.mangerlist();
			request.setAttribute("protectlist", list);
		} catch (Exception e) {
			// TODO: handle exception
		}
		forward.setRedirect(false);
		forward.setPath("MangerProtect.jsp");
			
		return forward;
	}

}
