package com.d15.Contoroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.Service.PublicDB_Service;
import com.d15.Service.PublicSeqSelect_Service;
import com.d15.Service.pageManager_Service;
import com.d15.keyURL.D15_SidoURL_Service;

@WebServlet("*.ProtectOut")
public class ProtectOut_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProtectOut_Controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//처음 어떤 서비스를 선택 할 건지
				String RequsetURI = request.getRequestURI();
				String ContextPath = request.getContextPath();
				String search = RequsetURI.substring(ContextPath.length());
				
				System.out.println(search);
				
				 ActionForward  forward = null;
				 Action action = null;
	
		if(search.equals("/D15/ProtectOut/ProtectOut.ProtectOut")){
			forward = new ActionForward();
			forward.setPath("D15_basicsProtectOut.jsp");
			forward.setRedirect(false);
		}else if(search.equals("/D15/ProtectOut/sido.ProtectOut")){
			action = new D15_SidoURL_Service();
			try{
				forward = action.execute(request, response);
			}catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}else if(search.equals("/D15/ProtectOut/insertPublic.ProtectOut")){
			action = new PublicDB_Service();
			try{
				forward = action.execute(request, response);
			}catch (Exception e) {
				// TODO: handle exception
			}
		}else if(search.equals("/D15/ProtectOut/selectcount.ProtectOut")){
			action = new PublicSeqSelect_Service();
			try{
				forward = action.execute(request, response);
			}catch (Exception e) {
				// TODO: handle exception
			}
		}else if(search.equals("/D15/ProtectOut/insertParceform.ProtectOut")){
			
		}else if(search.equals("/D15/ProtectOut/insertProtect.ProtectOut")){
			System.out.println(request.getParameter("protectDSt"));
			System.out.println(request.getParameter("no"));
			
		}else if(search.equals("/D15/ProtectOut/page.ProtectOut")){
			action = new pageManager_Service();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
			}
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