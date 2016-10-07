/*
 * @Class : MissingList_Service
 * @Date : 2016.10.6
 * @Author : 길한종
 * @Desc : 실종신고 게시판의 리스트를 조회하는  Service 클래스
 */

package com.d15.Service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Missing_DAO;
import com.d15.DTO.MissingJoin_DTO;

public class MissingList_Service implements Action {
		
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
			ActionForward forward = new ActionForward();
		    Missing_DAO missdao = new Missing_DAO();
		    
		    int totalcount = missdao.totalListCount();
		    
		    String psStr = request.getParameter("ps");    //pagesize
	        String cpStr = request.getParameter("cp");    //currentpage
	        
	        if(psStr == null || psStr.trim().equals("")){
	            //default 값
	            psStr = "3"; // default 5건씩 
	        }
	        
	        if(cpStr == null || cpStr.trim().equals("")){
	            cpStr= "1";        //default 1 page
	        }
	        
	        int pagesize = Integer.parseInt(psStr);  //5
	        int cpage = Integer.parseInt(cpStr);     //1
	        int pagecount = 0;                       
	        
	        if(totalcount % pagesize==0){        //전체 건수 , pagesize > 
	            pagecount = totalcount/pagesize;
	        }else{
	            pagecount = (totalcount/pagesize) + 1;
	        }
	        //페이지 갯수 : 102 건 , pagesize :5   pagecount: 21
	        

		    
		    List<MissingJoin_DTO> list=missdao.selectMissingPet(cpage , pagesize);
		    
		    request.setAttribute("cpage", cpage);
	        request.setAttribute("pagesize", pagesize);
	        request.setAttribute("pagecount", pagecount);
		    request.setAttribute("list", list);
			request.setAttribute("totalcount", totalcount);	
		    
		    
			forward.setRedirect(false);
			forward.setPath("petlist.jsp"); //view단 jsp파일 지정
			
			return forward;
	}
}
