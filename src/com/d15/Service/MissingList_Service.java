/*
 * @Class : MissingList_Service
 * @Date : 2016.10.6
 * @Author : 길한종
 * @Desc : 실종신고 게시판의 리스트를 조회하는  Service 클래스
 */

package com.d15.Service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Missing_DAO;
import com.d15.DTO.MissingJoin_DTO;
import com.d15.DTO.Missing_DTO;

public class MissingList_Service implements Action {
	//서블릿에 list 요청 추가해야 함
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();

		    Missing_DAO missdao = new Missing_DAO();
		      
		    List<MissingJoin_DTO> list=missdao.selectMissingPet();
		    request.setAttribute("list", list);
				
			forward.setRedirect(false);
			forward.setPath("petlist.jsp"); //view단 jsp파일 지정
			return forward;
	}
}
