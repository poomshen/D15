/*
	댓글
*/
package com.d15.Service;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;

import com.d15.DAO.Board_DAO;
import com.d15.DAO.Reply_DAO;
import com.d15.DTO.Board_DTO;
import com.d15.DTO.Reply_DTO;


public class ReplyService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response){		

		Reply_DAO replydao = new Reply_DAO();
		Reply_DTO replydto = new Reply_DTO();
		
		Date sqldate=null;
        try {
           SimpleDateFormat transFormat = new SimpleDateFormat("yy-MM-dd");
           java.util.Date date = transFormat.parse(request.getParameter("re_date"));
           sqldate=new Date(date.getTime());
           
           System.out.println("to값은 뭐다? "+sqldate);
        } catch (Exception e) {
           System.out.println(e.getMessage());
        }
		
		//RE_NO,M_NO,RE_CONTENT,RE_DATE,B_NO
		
		int re_no =  Integer.parseInt(request.getParameter("re_no"));
		int m_no = Integer.parseInt(request.getParameter("m_no"));
		String re_content = request.getParameter("re_content");
		Date re_date = sqldate;
		int b_no = Integer.parseInt(request.getParameter("b_no"));

			
		int	result = replydao.replywrite(replydto);
		
		if(result==0) {
			request.setAttribute("result", "success");
			replydto.setRe_no(re_no);
			replydto.setB_no(b_no);
			replydto.setRe_content(re_content);
			replydto.setM_no(m_no);
			replydto.setRe_date(re_date);
		}
		else {
			request.setAttribute("result", "fail");
		}
		
		/*if(result==false) {
			System.out.println("insert fail");
			return null;
		}
		System.out.println("insert success");*/
		
		request.setAttribute("B_NO", b_no);
		
		ActionForward forward = new ActionForward();
	    
	    forward.setRedirect(false);
		forward.setPath("Reply_Replyok.jsp");
		
		return forward;
		}
}
