package com.d15.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.d15.DTO.Protect_DTO;

import oracle.net.aso.b;

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
	public boolean insertProtect(Protect_DTO insert){
		boolean ck = false;
		try {
			conn = ds.getConnection();
			String sql = "insert into D15_PROTECT(pr_no,m_no,org_no,pr_reqdate,pr_begdate,pr_enddate) "
					+ "values(PR_NO_SEQ.nextval,?,?,sysdate,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, insert.getM_no());
			pstmt.setInt(2, insert.getOrg_no());
			pstmt.setDate(3, insert.getPr_begdate());
			pstmt.setDate(4, insert.getPr_enddate());
			int re =  pstmt.executeUpdate();
			if(re  >0 ){
				System.out.println("등록 성공");
				ck = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	//임시보호 삭제 - 회원 임시보호 취소 -> ( 트리거 사용 구문???)
	public boolean deleteProtect(int no){
		boolean ck = false;
		try {
			conn = ds.getConnection();
			String  sql = "DELETE FROM D15_Protect where pr_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			int re =  pstmt.executeUpdate();
			if(re > 0){
				ck = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ck;
	}
	
	//관리자 영역 승인안된list (관리자가 승인여부하기위해 찾기 위한 list 구문)
	//public 
	
	
	//관리자가 승인한 날짜 업데이트 구문 (승인 허락)
	public boolean updateProtect(boolean cks, int no){
		boolean ck = false;
		try {
			if(cks){
				conn = ds.getConnection();
				String sql = "Update D15_Protect set pr_argdate = sysdate where pr_no = ?"; 
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, no);
				int re =  pstmt.executeUpdate();
				if(re>0){
					ck = true;
				}
			}else{
				ck = deleteProtect(no);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return ck;
	}
	
	
	
	//보호 시작일,종료일 업데이트(보호 시작 요청 할때 사용)
	
	
	//보호 종료일 업대이트 (기간을 늘리거나 보호가아닌 분양을 받을 경우)


}
