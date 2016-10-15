/*
 * @Class : MessageRemoveM_Service.java
 * @Date : 2016.10.12
 * @Author : 이성준
 * @Desc : 보낸 메세지 삭제를 위한  Service 클래스
 */

package com.d15.Service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Message_DAO;

public class MessageRemoveM_Service implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		int mes_no = Integer.parseInt(request.getParameter("mes_no")); 
		Message_DAO message_DAO = new Message_DAO();
		System.out.println(mes_no);
		if(message_DAO.MremoveMessage(mes_no)){
			try {
				//성공
				System.out.println("성공");
				response.getWriter().print("Y");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			try {
				//실패
				System.out.println("실패");
				response.getWriter().print("N");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return null;
	}

}
