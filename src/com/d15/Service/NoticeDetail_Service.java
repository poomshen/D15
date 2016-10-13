package com.d15.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Notice_DAO;
import com.d15.DTO.Notice_DTO;

public class NoticeDetail_Service implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		Notice_DAO dao = new Notice_DAO();
		Notice_DTO dto = new Notice_DTO();
		
		int notice_no = Integer.parseInt(request.getParameter("no"));
		int page = Integer.parseInt(request.getParameter("page"));
		
		
		dao.setReadCountUpdate(notice_no); // 조회수 증가
		dto = dao.detailNotice(notice_no); // 상세 보기
		
		request.setAttribute("noticedto", dto);
		request.setAttribute("page", page);
		
		forward.setRedirect(false);
		forward.setPath("noticedetail.jsp");
		
		return forward;
	}

}
