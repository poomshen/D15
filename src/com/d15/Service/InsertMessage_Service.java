package com.d15.Service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Message_DAO;
import com.d15.DAO.Member_DAO;
import com.d15.DTO.Message_DTO;
import com.d15.DTO.Member_DTO;

public class InsertMessage_Service implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		
		//보낼사람 시퀀스 받기
		String m_id = request.getParameter("m_id");//보낼사람
		Member_DAO member_DAO = new Member_DAO();
		int m_no = member_DAO.selectid(m_id);
		System.out.println("m_no");
		
		//보낼 내용 저장
		String mes_content = request.getParameter("mes_content");
		//회원 넘버 시퀀스 받기
		HttpSession session = request.getSession();
		Member_DTO member =(Member_DTO)session.getAttribute("memberdto");
		
		
		Message_DTO message_DTO = new Message_DTO();
		
		//저장
		message_DTO.setM_no(m_no);
		message_DTO.setMes_send(member.getM_no());
		message_DTO.setMes_content(mes_content);
		
		Message_DAO massage_DAO = new Message_DAO();
		if(massage_DAO.insertMessge(message_DTO)){
			System.out.println("메세지 전송 성공");
			try {
				response.getWriter().print("1");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			/*request.setAttribute("massage_id", m_id);
			forward.setPath("MessageSuccess.jsp");
			forward.setRedirect(false);*/
		}else{
			System.out.println("메세지 전송 실패");
			try {
				response.getWriter().print("2");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return null;
	}

}
