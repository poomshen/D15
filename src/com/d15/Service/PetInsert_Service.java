/*
 * @Class : MissingInsertService
 * @Date : 2016.10.7
 * @Author : 박문수
 * @Desc : 실종신고 게시판의 글쓰기에 펫 테이블  Service 클래스
 */
package com.d15.Service;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Missing_DAO;
import com.d15.DAO.Pet_DAO;
import com.d15.DTO.Member_DTO;
import com.d15.DTO.Missing_DTO;
import com.d15.DTO.Pet_DTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class PetInsert_Service implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		Pet_DTO petdto=new Pet_DTO();
		ActionForward forward = new ActionForward();
		
		String uploadpath = request.getRealPath("upload");
		HttpSession session = request.getSession();
		Member_DTO dto =  (Member_DTO)session.getAttribute("memberdto");
		
		int size = 10*1024*1024;
		
		MultipartRequest multi = null;
		try{
			multi = new MultipartRequest(
					request,//원래 jsp 사용했던 request 객체
					uploadpath,// 실 저장 경로
					size, // 한번에 업로드 가능한 파일의 크기  : 10MB
					"utf-8",
					new DefaultFileRenamePolicy() // 파일을 새로 생성
					//파일업로드(upload > btn.jpg > 파일 업로드(btn.jpg) > btn_1.jpg)
					);
		}catch(Exception e){
			System.out.println("multi error");
			e.printStackTrace();
		}
		System.out.println("p_image : " + multi.getFilesystemName("p_image"));
		System.out.println("uploadpath : " + uploadpath);
		petdto.setP_image(multi.getFilesystemName("p_image"));
		petdto.setP_gender(multi.getParameter("p_gender"));
		petdto.setP_color(multi.getParameter("p_color"));
		petdto.setP_feature(multi.getParameter("p_feature"));
		petdto.setP_age(Integer.parseInt(multi.getParameter("p_age")));
		petdto.setP_weight(Integer.parseInt(multi.getParameter("p_weight")));	
		
		//Kind_DTO kinddto=new Kind_DTO();
		//kinddto.setK_kind(request.getParameter("k_kind"));
		
		Pet_DAO petdao = new Pet_DAO();
		Missing_DAO missdao = new Missing_DAO();
	    Missing_DTO missingdto=new Missing_DTO();
		
	    
	    int n = petdao.insertPet(petdto, multi.getParameter("k_kind"));
		
		System.out.println(petdto);
		//System.out.println(kinddto);
		System.out.println(n);
		Date sqldate=null;
	      try {
	    	  SimpleDateFormat transFormat = new SimpleDateFormat("yy-MM-dd");
	    	  java.util.Date date = transFormat.parse(multi.getParameter("mis_date"));
	    	  sqldate=new Date(date.getTime());
	         
	         System.out.println("to값은 뭐다? "+sqldate);
	      } catch (Exception e) {
	         System.out.println(e.getMessage());
	      }
	      
	      missingdto.setMis_date(sqldate); //폼의 datepicker에서 입력 받아 java.sql.date 타입으로 저장
	      missingdto.setMis_loc(multi.getParameter("mis_loc")); //폼의 실종위치를 text로 입력받음
	      missingdto.setMis_content(multi.getParameter("mis_content")); //폼의 신고내용을 text area로 입력받음
	      //조회수는 db저장시 자동 입력
	      
	      int n2 = missdao.insertMissingBoard(missingdto , dto.getM_no());
	      
	      if(n2 > 0){
	    	  forward.setRedirect(false);
	    	  forward.setPath("BoardList.missing");
	      }else{
	    	  System.out.println("missdao 삽입 실패");
	    	  forward.setRedirect(false);
	    	  forward.setPath("petwrite.jsp");
	      }
		return forward;
	}

}
