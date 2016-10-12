package com.d15.Service;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Organic_DAO;
import com.d15.DAO.Parcel_DAO;

public class MangerParcelCheck_Service  implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		ActionForward  forward = new ActionForward();
		// TODO Auto-generated method stub
		String is =  request.getParameter("is");
		int no =  Integer.parseInt(request.getParameter("ck"));
		boolean ck = true;
		
		Parcel_DAO parcel_DAO = new Parcel_DAO();
		Organic_DAO organic_DAO = new Organic_DAO();
		
		
		
		//승낙 했을 때
		if(is.equals("true")){
			try {
				//성공적으로 업데이트가 되었다면
				if(parcel_DAO.updateStart(ck, no)){
					organic_DAO.updateSituation(no, "[종료]분양");
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
		}else{
			// 삭제
			try {
					ck = false;
					if(parcel_DAO.updateStart(ck, no)){
					forward.setPath("MangerSuccess.jsp");
					forward.setRedirect(false);
					return forward;
				}else{
					forward.setPath("MangerFail.jsp");
					forward.setRedirect(false);
					return forward;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return forward;
	}

}
