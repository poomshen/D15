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
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else {
			ck = false;
			// 삭제
			try {
				parcel_DAO.updateStart(ck, no);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}

}
