/*
 * @Class : NoticeUpdateGo_Service
 * @Date : 2016.10.14
 * @Author : 박문수
 * @Desc :공지사항 글수정 화면을 보기위한  Service
 */

package com.d15.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Board_DAO;
import com.d15.DAO.Notice_DAO;
import com.d15.DTO.Board_DTO;
import com.d15.DTO.Notice_DTO;

public class NoticeUpdateGo_Service implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		int no =Integer.parseInt(request.getParameter("no"));
		Notice_DAO dao = new Notice_DAO();
		Notice_DTO dto = new Notice_DTO();
		
		try {
			dto =dao.getDetail(no);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		if(dto == null){
			
			System.out.println("수정 상세보기 실패");
			return null;
		}
		System.out.println("수정 상세보기 성공");
		

		request.setAttribute("noticedto", dto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("noticeupdate.jsp");
		return forward;
		
		
	}

}
