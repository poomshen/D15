package com.d15.Service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Parcel_DAO;
import com.d15.DTO.MangerParcel_DTO;

public class MangerParcel_Service  implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		System.out.println("skdk");
		Parcel_DAO parcel_DAO = new Parcel_DAO();
		ArrayList<MangerParcel_DTO> list  =  parcel_DAO.mangerlist();
		
		request.setAttribute("parcellist", list);
		
		forward.setRedirect(false);
		forward.setPath("MangerParcel.jsp");
			
		return forward;
	}

}
