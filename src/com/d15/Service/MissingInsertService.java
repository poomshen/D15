/*
 * @Class : MissingInsertService
 * @Date : 2016.10.5
 * @Author : 길한종
 * @Desc : 실종신고 게시판의 글쓰기에 적용할  Service 클래스
 */
package com.d15.Service;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Missing_DAO;
import com.d15.DAO.Pet_DAO;
import com.d15.DTO.Kind_DTO;
import com.d15.DTO.Missing_DTO;
import com.d15.DTO.Pet_DTO;

public class MissingInsertService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		  ActionForward forward = new ActionForward();
		//Missing db에 추가하는 로직
		  Missing_DAO missdao = new Missing_DAO();
	      Missing_DTO missingdto=new Missing_DTO();
	      
	      //missingdto.setMis_no(request.getParameter("mis_no")); sequence로 자동입력
	      //missingdto.setM_no(request.getParameter("m_no")); session으로 자동입력
	      //missingdto.setP_no(request.getParameter("p_no")); 위의 펫정보에서 자동으로 입력되야 하는데.. 그러면 db저장이 필요한데...
	      Date sqldate=null;
	      try {
	    	  SimpleDateFormat transFormat = new SimpleDateFormat("yy-MM-dd");
	    	  java.util.Date date = transFormat.parse(request.getParameter("mis_date"));
	    	  sqldate=new Date(date.getTime());
	         
	         System.out.println("to값은 뭐다? "+sqldate);
	      } catch (Exception e) {
	         System.out.println(e.getMessage());
	      }
	      
	      missingdto.setMis_date(sqldate); //폼의 datepicker에서 입력 받아 java.sql.date 타입으로 저장
	      missingdto.setMis_loc(request.getParameter("mis_loc")); //폼의 실종위치를 text로 입력받음
	      missingdto.setMis_content(request.getParameter("mis_content")); //폼의 신고내용을 text area로 입력받음
	      //조회수는 db저장시 자동 입력
	      
	      int n2 = missdao.insertMissingBoard(missingdto);
	      
	      if(n2 > 0){
	    	  forward.setRedirect(false);
	    	  forward.setPath("index.jsp");
	      }else{
	    	  System.out.println("missdao 삽입 실패");
	    	  forward.setRedirect(false);
	    	  forward.setPath("petwrite.jsp");
	      }
		return forward;
	}
}
