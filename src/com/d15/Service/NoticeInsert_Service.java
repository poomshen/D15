package com.d15.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Notice_DAO;
import com.d15.DTO.Member_DTO;
import com.d15.DTO.Notice_DTO;

public class NoticeInsert_Service implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		Notice_DAO dao = new Notice_DAO();
		
		//세션 가져오기
		HttpSession session = request.getSession();
		Member_DTO mdto =(Member_DTO)session.getAttribute("memberdto");
		
		if(mdto.getM_id().equals("admin")){

			String notice_content = request.getParameter("notice_content");
			String notice_name = request.getParameter("notice_name");
		
			int m_no = mdto.getM_no();
		
			int row = dao.NoticeWrite(m_no,notice_name,notice_content);
		
			if(row > 0){
				System.out.println("공지사항 등록 성공!");
				forward.setRedirect(false);
				forward.setPath("noticesuccess.jsp");
			}else{
				System.out.println("공지사항 등록 실패");
				forward.setPath("noticefail.jsp");
				forward.setRedirect(false);
			}
		}else{
			System.out.println("관리자 아님");
			forward.setRedirect(false);
			forward.setPath("noadmin.jsp");
		}
		
		return forward;
	}

}
