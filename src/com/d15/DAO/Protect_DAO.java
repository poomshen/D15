package com.d15.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

//임시 보호
public class Protect_DAO {
	static DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	static {
		InitialContext ctx;
		try {
			ctx = new InitialContext();
			Context envCtx = (Context) ctx.lookup("java:comp/env");
			ds = (DataSource) envCtx.lookup("/jdbc/oracle");
			System.out.println("DataSource 객체 생성 성공 !");
		} catch (NamingException e) {
			System.out.println("lookup Fail : " + e.getMessage());
		}
	}
	
	
	///임시보호 등록
	public boolean insertProtect(){
		return false;
	}
	
	//임시보호 삭제 - 회원 임시보호 취소 -> ( 트리거 사용 구문???)
	
	
	//관리자 영역 승인안된list (관리자가 승인여부하기위해 찾기 위한 list 구문)
	
	
	//관리자가 승인한 날짜 업데이트 구문 (승인 허락)
	
	//보호 시작일,종료일 업데이트(보호 시작 요청 할때 사용)
	
	
	//보호 종료일 업대이트 (기간을 늘리거나 보호가아닌 분양을 받을 경우)


}
