/*
 * @Class : NoticeUpdate_Service
 * @Date : 2016.10.14
 * @Author : 박문수
 * @Desc : 공지사항 에서 글 수정 기능을 위한  Service
 */

package com.d15.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Notice_DAO;
import com.d15.DTO.Notice_DTO;

public class NoticeUpdate_Service implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		boolean result = false;
		
		int notice_no = Integer.parseInt(request.getParameter("notice_no"));
		int page = Integer.parseInt(request.getParameter("page"));
		
		Notice_DAO dao = new Notice_DAO();
		Notice_DTO dto = new Notice_DTO();
		
		
		dto.setNotice_no(notice_no);
		dto.setNotice_name(request.getParameter("notice_name"));
		dto.setNotice_content(request.getParameter("notice_content"));
		
		try {
			result = dao.noticeUpdate(dto);
			if (result == false) {

				System.out.println("게시판 수정 실패");
				return null;
			}
			System.out.println("게시판 수정 성공");
		} catch (Exception e) {
			
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/D15/Notice/NoticeDetail.notice?no="+dto.getNotice_no()+"&page=" + page);
		return forward;
	}

}
