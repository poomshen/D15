/*
 * @Class : MangerParcelCheck_Service.java
 * @Date : 2016.10.10
 * @Author : 이성준
 * @Desc : 관리자가 분양 승인/거절을 위한  Service 클래스
 */


package com.d15.Service;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Organic_DAO;
import com.d15.DAO.Parcel_DAO;
import com.d15.DAO.Protect_DAO;

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
					int org_no = parcel_DAO.selectOrgno(no);
					organic_DAO.updateSituation(org_no, "종료(분양)");
					Protect_DAO protect_DAO = new Protect_DAO();
					
					//승인이 없는 임시분양 신청이 있다면 을 승인일 날짜를 넣어줌
					protect_DAO.updateProtect(org_no);
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
					int org_no = parcel_DAO.selectOrgno(no);
					organic_DAO.updateSituation(org_no, "보호중");
					forward.setPath("MangerFail.jsp");
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
