/*
 * @Class : NoticeDelete_Service
 * @Date : 2016.10.14
 * @Author : 박문수
 * @Desc : 공지사항 글삭제기능을 위한  Service
 */

package com.d15.Service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Board_DAO;
import com.d15.DAO.Notice_DAO;


public class NoticeDelete_Service implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response){

		boolean result = false;
		
		int no = Integer.parseInt(request.getParameter("no"));
		String page = request.getParameter("page");
		
		Notice_DAO dao = new Notice_DAO();

		result = dao.noticeDelete(no);
		
		if(result == false){
			
			System.out.println("게시물 삭제 실패");
			return null;
		}
		System.out.println("게시물 삭제 성공");
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("NoticeList.notice");
		return forward;
		
		
	}

}
