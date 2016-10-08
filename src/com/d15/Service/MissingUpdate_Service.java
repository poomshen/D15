package com.d15.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Missing_DAO;
import com.d15.DTO.Missing_DTO;

public class MissingUpdate_Service implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		Missing_DAO dao = new Missing_DAO();
		Missing_DTO dto = new Missing_DTO();
		
		System.out.println(request.getParameter("list"));
		int n = dao.updateMissData((Integer.parseInt(request.getParameter("mis_no"))));
		
		if(n > 0){
			forward.setRedirect(false);
			forward.setPath("BoardList.missing");
		}else{
			forward.setPath("TeamProject3_D15/index.jsp");
			forward.setRedirect(false);
		}
		return forward;
	}

}
