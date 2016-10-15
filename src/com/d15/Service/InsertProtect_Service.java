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
		 String sts =  st.replace("/", "");
		 String eds =  ed.replace("/", "");
		 //아이디 체크
		 if(session.getAttribute("memberdto")==null){
			 forward.setPath("ProtectFail.jsp");
			 forward.setRedirect(false);
			 return forward;
		 }
		 //임시등록 시작 등록 일이  종료등록 일보다 크다면
		 if(Integer.parseInt(sts) > Integer.parseInt(eds)){
			 forward.setPath("ProtectFail.jsp");
			 forward.setRedirect(false);
			 return forward;
		 }
		 Member_DTO member =(Member_DTO)session.getAttribute("memberdto");
		 
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
		 Protect_DTO proDto = new Protect_DTO();
		 Protect_DAO proDao = new Protect_DAO();
		 proDto.setM_no(member.getM_no());
		 proDto.setOrg_no(Integer.parseInt(no));
		 proDto.setPr_begdate(sqldate);
		 proDto.setPr_enddate(sqldate2);
		 
		 try {
			Organic_DTO organic_DTO = new Organic_DTO();
			Organic_DAO orgDao = new Organic_DAO();
			organic_DTO  =  orgDao.selectOrganic(Integer.parseInt(no));
			
			 if(organic_DTO.getOrg_situation().substring(0,2).equals("대기")){
				 forward.setPath("ProtectFail.jsp");
				 forward.setRedirect(false);
				 return forward;
			 }else if(organic_DTO.getOrg_situation().substring(0,2).equals("종료")){
				 forward.setPath("ProtectFail.jsp");
				 forward.setRedirect(false);
				 return forward;
			 }
			if(proDao.insertProtect(proDto)){
				 //제대로 임시보호 성공적으로 됬다면
				 try {
					 //상태 변경 
					 if(orgDao.updateSituation(Integer.parseInt(no), "대기(임시)")){
						 forward.setPath("ProtectSuccess.jsp");
						 forward.setRedirect(false);
					 }else{
						 forward.setPath("ProtectFail.jsp");
						 forward.setRedirect(false);
					 }
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
					 
			 }else{
				
			 }
		} catch (NumberFormatException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return forward;
		
	}

}
