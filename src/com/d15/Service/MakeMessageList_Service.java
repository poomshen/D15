/*
 * @Class : MakeMessageList_Service.java
 * @Date : 2016.10.14
 * @Author : 이성준
 * @Desc : 발신자 메세지를 리스트에 뿌려주는  Service 클래스
 */


package com.d15.Service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Message_DAO;
import com.d15.DTO.Member_DTO;
import com.d15.DTO.Message_DTO;

public class MakeMessageList_Service implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Member_DTO member =(Member_DTO)session.getAttribute("memberdto");
		Message_DAO message_DAO = new Message_DAO();
		System.out.println(member.getM_no());
		ArrayList<Message_DTO> list =  message_DAO.selectSendlist(member.getM_no());
		
		request.setAttribute("messagelist", list);
		
		ActionForward forward = new ActionForward();
		
		forward.setPath("MyMakeMessagelist.jsp");
		forward.setRedirect(false);
		
		return forward;
		
	}

}
