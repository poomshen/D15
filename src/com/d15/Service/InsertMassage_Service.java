package com.d15.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Massage_DAO;
import com.d15.DAO.Member_DAO;
import com.d15.DTO.Massage_DTO;
import com.d15.DTO.Member_DTO;

public class InsertMassage_Service implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		//보낼사람 시퀀스 받기
		String m_id = request.getParameter("m_id");//보낼사람
		Member_DAO member_DAO = new Member_DAO();
		int m_no = member_DAO.selectid(m_id);
		//보낼 내용 저장
		String mes_content = request.getParameter("mes_content");
		//회원 넘버 시퀀스 받기
		HttpSession session = request.getSession();
		Member_DTO member =(Member_DTO)session.getAttribute("memberdto");
		Massage_DTO massage_DTO = new Massage_DTO();
		//저장
		massage_DTO.setM_no(m_no);
		massage_DTO.setMes_send(member.getM_no());
		massage_DTO.setMes_content(mes_content);
		
		Massage_DAO massage_DAO = new Massage_DAO();
		if(massage_DAO.insertMassge(massage_DTO)){
			System.out.println("메세지 전송 성공");
		}else{
			
		}

		return null;
	}

}
