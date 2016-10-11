package com.d15.Service;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Member_DAO;
import com.d15.DTO.MemberJoin_DTO;

public class MypageEditOk_Service implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward=new ActionForward();
		Member_DAO dao=new Member_DAO();
		
		HttpSession session=request.getSession();
		MemberJoin_DTO dto=(MemberJoin_DTO)session.getAttribute("memberjoindto");
		
		dto.setM_no(dto.getM_no());
		dto.setM_id(dto.getM_id());
		dto.setM_pwd(request.getParameter("m_pwd"));
		dto.setM_lastdate(dto.getM_lastdate());
		dto.setC_code(dto.getC_code());
		dto.setM_name(request.getParameter("m_name"));
		dto.setM_phone(request.getParameter("m_phone"));
		dto.setM_email(request.getParameter("m_email"));
		dto.setM_addr(request.getParameter("m_addr"));
		dto.setM_daddr(request.getParameter("m_daddr"));
		dto.setM_petok(request.getParameter("m_petok"));
		
		
		Calendar cal=Calendar.getInstance();
		java.sql.Date sqldate=null;
		try{
			SimpleDateFormat formatter=new SimpleDateFormat("yy-MM-dd");
			java.util.Date date=formatter.parse(formatter.format(cal.getTime()));
			sqldate=new java.sql.Date(date.getTime());
		} catch(Exception e){
			System.out.println(e.getMessage());
		}
		
		dto.setM_update(sqldate);
		dto.setM_regdate(dto.getM_regdate());
		
		int n=dao.MypageUpdate(dto);
		if(n>0){
			session.setAttribute("memberjoindto", dto);
			forward.setPath("updatesuccess.jsp");
			forward.setRedirect(false);	
		} else {
			//forward.setPath("MypageUpdate.login");
			forward.setPath("updatefail.jsp");
			forward.setRedirect(false);			
		}
		
		return forward;
	}

}
