package com.d15.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Member_DAO;
import com.d15.DTO.Detail_DTO;
import com.d15.DTO.Member_DTO;

public class MemberInsert_Service implements Action {
	
	private String code;
	public MemberInsert_Service(String string) {
		this.code=string;
	}

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward forward = new ActionForward();
			
		Member_DAO memeberdao = new Member_DAO();
		Member_DTO memberdto=new Member_DTO();
		  
		memberdto.setM_id(request.getParameter("m_id"));
		memberdto.setM_pwd(request.getParameter("m_pwd"));
		    
		    /*//자바의 시스템 시간(java.util.Date) -> java.sql.Date로 변경
		    Calendar cal=Calendar.getInstance(); ;
		    Date sqldate=null;
		    try {
		    	SimpleDateFormat transFormat = new SimpleDateFormat("yy-MM-dd");
		    	java.util.Date date = transFormat.parse(transFormat.format(cal.getTime()));
		    	sqldate=new Date(date.getTime());
		    } catch (Exception e) {
		    	System.out.println(e.getMessage());
		    }*/
		    //memberdto.setM_lastdate(sqldate); db에서 자동입력
		    
		memberdto.setC_code(code);
		
		
		 //멤버디테일dto 
		Detail_DTO detaildto=new Detail_DTO();
		//m_no는 sql에서 자동으로 입력
		detaildto.setM_name(request.getParameter("m_name"));
		detaildto.setM_phone(request.getParameter("m_phone"));
		detaildto.setM_birth(Integer.parseInt(request.getParameter("m_birth")));
		detaildto.setM_email(request.getParameter("m_email"));
		detaildto.setM_addr(request.getParameter("m_addr"));
		detaildto.setM_petok(request.getParameter("m_petok"));
		//정보수정일은 sql에서 자동으로
		//회원가입일은 sql에서 자동
		detaildto.setM_file(request.getParameter("m_file"));
		
		
		memeberdao.insertMember(memberdto, detaildto);

		forward.setRedirect(false);
		forward.setPath("../../index.jsp");

		return forward;
	}
}
