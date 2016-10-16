/*
 * @Class : InsertParcel_Service.java
 * @Date : 2016.10.14
 * @Author : 이성준
 * @Desc : 분양 객체에 저장하는  Service 클래스
 */


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
import com.d15.DAO.Parcel_DAO;
import com.d15.DTO.Member_DTO;
import com.d15.DTO.Myparcel_DTO;
import com.d15.DTO.Organic_DTO;
import com.d15.DTO.Parcel_DTO;

public class InsertParcel_Service implements Action{

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
		String dates = request.getParameter("parcelD");
		String no = request.getParameter("no");
		HttpSession session = request.getSession();
		 if(session.getAttribute("memberdto")==null){
			 forward.setPath("ProtectFail.jsp");
			 forward.setRedirect(false);
			 return forward;
		 }
		Member_DTO member =(Member_DTO)session.getAttribute("memberdto");
		//Date 객체로 만들기
		Date sqldate=null;
		    try {
		    	SimpleDateFormat transFormat = new SimpleDateFormat("yy/MM/dd");
		    	java.util.Date date = transFormat.parse(dates);
		    	sqldate=new Date(date.getTime());
		    } catch (Exception e) {
		    	System.out.println(e.getMessage());
		    }
		   Parcel_DTO  parcel_DTO = new Parcel_DTO();
		   Parcel_DAO  parcel_DAO = new Parcel_DAO();
		   
		   parcel_DTO.setM_no(member.getM_no());
		   parcel_DTO.setOrg_no(Integer.parseInt(no));
		   parcel_DTO.setFc_begdate(sqldate);
		   
		   try {
			   Organic_DTO organic_DTO = new Organic_DTO();
				Organic_DAO orgDao = new Organic_DAO();
				organic_DTO  =  orgDao.selectOrganic(Integer.parseInt(no));
				System.out.println(organic_DTO.getOrg_situation());
				 if(organic_DTO.getOrg_situation().equals("대기(분양)")){
					 forward.setPath("ProtectFail.jsp");
					 forward.setRedirect(false);
					 return forward;
				 }else if(organic_DTO.getOrg_situation().substring(0,2).equals("종료")){
					 forward.setPath("ProtectFail.jsp");
					 forward.setRedirect(false);
					 return forward;
				 }else if(organic_DTO.getOrg_situation().equals("보호(임시)")){
					 Myparcel_DTO myparcel_DTO = orgDao.selectUpdateOrg(Integer.parseInt(no));
					 parcel_DAO.insertParcel(parcel_DTO);
					 if(orgDao.updateSituation(Integer.parseInt(no), myparcel_DTO)){
						 forward.setPath("ParcelSuccess.jsp");
						 forward.setRedirect(false);
						 return forward;
					 }
				 }
			if(parcel_DAO.insertParcel(parcel_DTO)){
				   //등록이 성공 되었다면
				   Organic_DAO organic_DAO = new Organic_DAO();
				   try {
					if(organic_DAO.updateSituation(Integer.parseInt(no), "대기(분양)")){
							forward.setPath("ParcelSuccess.jsp");
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
				   //등록이 실패 했다면
			   }
		} catch (NumberFormatException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		return forward;
	}

}
