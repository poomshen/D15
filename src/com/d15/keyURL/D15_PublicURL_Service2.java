/*
 * @Class : D15_PublicURL_Service2
 * @Date : 2016.10.6
 * @Author : 이성준
 * @Desc : 주소가 겹쳐서 메인쪽으로 돌리기 위한 서비스
 */


package com.d15.keyURL;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;


public class D15_PublicURL_Service2 implements Action{

	
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		D15_Property_animalKey searchkey = D15_Property_animalKey.init();
		HashMap<String,String> list = new HashMap<>();
		D15_key key = new D15_key();
		

		String bgnde=request.getParameter("bgnde");//유기날짜_시작";
		String endde=request.getParameter("endde");//유기날짜_종료
		String upr_cd = request.getParameter("upr_cd");
		String numOfRows = request.getParameter("numOfRows");
		String pageNo = request.getParameter("pageNo");
		String org_cd = request.getParameter("org_cd");
		String upkind= request.getParameter("upkind");//축종코드;
		String kind= request.getParameter("kind");//품종코드
		String care_reg_no= request.getParameter("care_reg_no");//보호소번호
		String state=request.getParameter("state"); //상태
		 list.put("bgnde", bgnde);
		 list.put("endde", endde);
		 list.put("upr_cd", upr_cd);
//		 list.put("numOfRows", numOfRows);
//		 list.put("pageNo", pageNo);
		 list.put("org_cd", org_cd);
		 list.put("upkind", upkind);
		 list.put("kind", kind);
		 list.put("care_reg_no", care_reg_no);
		 list.put("state", state);
		String keyurl = key.urlKey(searchkey.ptAnimalKey.getProperty("abandonmentPublic"), list);
		request.setAttribute("keyurl", keyurl);
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("numOfRows", numOfRows);
			
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/Main.jsp");
		return forward;
	}

}
