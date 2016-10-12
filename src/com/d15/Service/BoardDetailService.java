/*
 * @Class : BoardDetail_Service
 * @Date : 2016.10.5
 * @Author : 조한솔
 * @Desc : Q&A 게시판에서 상세보기기능을 위한  Service 클래스
 */

package com.d15.Service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Board_DAO;
import com.d15.DTO.Board_DTO;

public class BoardDetailService implements Action {

	
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response)  {

		//view 단 구성
		//글번호를 가지고 와서 
		int num =Integer.parseInt(request.getParameter("num"));
		Board_DAO boarddao = new Board_DAO();
		Board_DTO boarddto = new Board_DTO();
		
		String pageName=(String)request.getParameter("name");
		
		try {
			boarddao.setReadCountUpdate(num); //조회수 증가
			
			boarddto = boarddao.getDetail(num);
			
			if (boarddto == null) {

				System.out.println("Null Data 처리");
				return null;
			}
			System.out.println("boardto Data 완료");

			//view 페이지에서 처리되는 bean 객체
			request.setAttribute("boarddto", boarddto);
			System.out.println("검증: " + request.getAttribute("gogo"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("Board/Board_View.jsp");

		return forward;

	}

}
