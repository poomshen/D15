package com.d15.keyURL;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;


/**
 * Servlet implementation class WePet_OrganicAnimalSearch_Service
 */
@WebServlet("*.keyurl")
public class WePet_OrganicAnimalSearchURL_Service extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WePet_OrganicAnimalSearchURL_Service() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	//Get이든 Post 이든 상관 없이 사용 되겠다
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		WePet_property_animalKey searchkey = WePet_property_animalKey.init();
		//처음 어떤 서비스를 선택 할 건지
		String RequsetURI = request.getRequestURI();
		String ContextPath = request.getContextPath();
		String search = RequsetURI.substring(ContextPath.length());
		
		System.out.println(search);
		
		 ActionForward  forward = null;
		 Action action = null;
		//이 두 파라미터는 어디서든 사용이 되어 진다.
		if(search.equals("/D15/ProtectOut/ProtectOut.keyurl")){
			forward = new ActionForward();
			forward.setPath("WePet_Search.jsp");
			forward.setRedirect(false);
		}else if(search.equals("/D15/ProtectOut/sido.keyurl")){
			action = new WePet_sidoURL_Service();
			try{
				forward = action.execute(request, response);
			}catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}else if(search.equals("/D15/ProtectOut/sigungu.keyurl")){
			//유기동물조회 조회조건의 '시군구'조건	동물보호관리시스템의 유기동물조회 조회조건의 '시군구'조건을 가져올 수 있다.
			action = new wetPet_sigunguURL_Servie();
			try{
				forward = action.execute(request, response);
			}catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}else if (search.equals("/D15/ProtectOut/shelter.keyurl")) {
			//유기동물조회 조회조건의 '보호소'조건	동물보호관리시스템의 유기동물조회 조회조건의 '보호소'조건을 가져올 수 있다.
			action = new WePet_ShelterURL_Service();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}else if(search.equals("/D15/ProtectOut/kind.keyurl")){
			//유기동물조회 조회조건의 '품종'조건	동물보호관리시스템의 유기동물조회 조회조건의 '품종'조건을 가져올 수 있다.
			action = new WePet_kindURL_Service();
			
		}else if(search.equals("/D15/ProtectOut/abandonmentPublic.keyurl")){
			//유기동물 정보를 조회	동물보호관리시스템의 유기동물 정보를 조회한다.
			action = new WePet_PublicURL_Service();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}else if(search.equals("/D15/ProtectOut/insertPublic.keyurl")){
			action = new WePet_PublicDB_Service();
			try{
				forward = action.execute(request, response);
			}catch (Exception e) {
				// TODO: handle exception
			}
		}else if(search.equals("/D15/ProtectOut/selectcount.keyurl")){
			action = new WePet_PublicSeqSelect_Service();
			try{
				forward = action.execute(request, response);
			}catch (Exception e) {
				// TODO: handle exception
			}
		}else if(search.equals("/D15/ProtectOut/insertParceform.keyurl")){
			
		}else if(search.equals("/D15/ProtectOut/insertProtect.keyurl")){
			System.out.println(request.getParameter("protectDSt"));
			System.out.println(request.getParameter("no"));
			
		}else{
			
		}
		
		if(forward != null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher = request
						.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}

}
