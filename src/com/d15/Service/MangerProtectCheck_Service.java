package com.d15.Service;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Organic_DAO;
import com.d15.DAO.Parcel_DAO;
import com.d15.DAO.Protect_DAO;

// 임시 보호
public class MangerProtectCheck_Service  implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		ActionForward  forward = new ActionForward();
		// TODO Auto-generated method stub
		String is =  request.getParameter("is");
		int no =  Integer.parseInt(request.getParameter("ck"));
		boolean ck = true;
		
		Protect_DAO  protect_DAO = new Protect_DAO();
		Organic_DAO organic_DAO = new Organic_DAO();
		
		
		
		//승낙 했을 때
		if(is.equals("true")){
			try {
				//성공적으로 업데이트가 되었다면
				if(protect_DAO.updateProtect(ck, no)){
					int org_no = protect_DAO.selectOrgno(no);
					organic_DAO.updateSituation(org_no, "대기(임시)");
					forward.setPath("MangerSuccess.jsp");
					forward.setRedirect(false);
					return forward;
				}else{
					forward.setPath("MangerFail.jsp");
					forward.setRedirect(false);
					return forward;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else {
			ck = false;
			// 삭제
			try {
				if(protect_DAO.updateProtect(ck, no)){
					int org_no = protect_DAO.selectOrgno(no);
					organic_DAO.updateSituation(org_no, "보호중");
					forward.setPath("MangerSuccess.jsp");
					forward.setRedirect(false);
					return forward;
				}else{
					forward.setPath("MangerFail.jsp");
					forward.setRedirect(false);
					return forward;
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return forward;
	}

}
