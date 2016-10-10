package com.d15.Service;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Organic_DAO;
import com.d15.DAO.Protect_DAO;
import com.d15.DTO.Member_DTO;
import com.d15.DTO.Organic_DTO;
import com.d15.DTO.Protect_DTO;

public class InsertProtect_Service implements Action{
	//임시보호 서비스
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		 response.setContentType("text/html;charset=UTF-8");
	       try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		ActionForward forward = new ActionForward();
		 String st = request.getParameter("protectDSt");
		 String ed = request.getParameter("protectDEd");
		 String no = request.getParameter("no");
		 //String m_no = request.getSession();
		 HttpSession session = request.getSession();
		 Member_DTO member =(Member_DTO)session.getAttribute("memberdto");
		 
		 Protect_DTO proDto = new Protect_DTO();
		 Protect_DAO proDao = new Protect_DAO();
		
		 //시간 데이트 타입 으로 넘기기
		 Date sqldate=null;
		 Date sqldate2=null;
		    try {
		    	SimpleDateFormat transFormat = new SimpleDateFormat("yy/MM/dd");
		    	java.util.Date date = transFormat.parse(st);
		    	java.util.Date date2 = transFormat.parse(ed);
		    	sqldate=new Date(date.getTime());
		    	sqldate2=new Date(date2.getTime());
		    } catch (Exception e) {
		    	System.out.println(e.getMessage());
		    }
		 proDto.setM_no(member.getM_no());
		 proDto.setOrg_no(Integer.parseInt(no));
		 proDto.setPr_begdate(sqldate);
		 proDto.setPr_enddate(sqldate2);
		 
		 if(proDao.insertProtect(proDto)){
			 //제대로 임시보호 성공적으로 됬다면
			 Organic_DTO orgDto = new Organic_DTO();
			 Organic_DAO orgDao = new Organic_DAO();
			  
			 try {
				 //상태 변경 
				 if(orgDao.updateSituation(no, "[등록중]임시")){
					 System.out.println("임시 보호 등록 성공");
					 forward.setPath("ProtectSuccess.jsp");
					 forward.setRedirect(false);
				 }else{
					 System.out.println("임시 보호 등록 실패");
					 forward.setPath("ProtectFail.jsp");
					 forward.setRedirect(false);
				 }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				 
		 }else{
			 System.out.println("임시 보호 등록 실패");
			 forward.setPath("ProtectFail.jsp");
			 forward.setRedirect(false);
		 }
		 return forward;
		
	}

}
