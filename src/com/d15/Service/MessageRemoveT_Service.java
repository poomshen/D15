package com.d15.Service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Message_DAO;

public class MessageRemoveT_Service implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		int mes_no = Integer.parseInt(request.getParameter("mes_no")); 
		Message_DAO message_DAO = new Message_DAO();
		if(message_DAO.TremoveMessage(mes_no)){
			try {
				//성공
				response.getWriter().print("Y");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			try {
				//실패
				response.getWriter().print("N");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return null;
	}

}
