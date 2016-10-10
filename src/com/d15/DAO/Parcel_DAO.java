package com.d15.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.d15.DTO.Parcel_DTO;


////분양
public class Parcel_DAO {
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
	
	//분양 등록
	public boolean insertParcel(Parcel_DTO parcel){
		boolean ck = false;
		System.out.println("분양 하자 ");
		try {
			conn = ds.getConnection();
			String sql = "insert into D15_parcel(pc_no, m_no, org_no, pc_reqdate, pc_begdate) values(PC_NO_SEQ.nextval,? ,? ,sysdate,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, parcel.getM_no());
			pstmt.setInt(2, parcel.getOrg_no());
			pstmt.setDate(3, parcel.getFc_begdate());
			int re = pstmt.executeUpdate();
			if(re>0){
				ck= true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ck;
	}

	
	//승인일 업데이트 - 분양 번호 받음
	public boolean updateStart(boolean cks,int no) throws SQLException {
		boolean ck = false;
		try {
			if (cks) {
				conn = ds.getConnection();
				String sql = "update D15_parcel set pc_argdate = sysdate where pc_no =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, no);
				int re = pstmt.executeUpdate();
				if (re > 0) {
					ck = true;
				}
			} else {
				ck = deleteParcle(no);
			} 
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
	    	if(pstmt !=null)pstmt.close();
	    	if(rs !=null) rs.close();
	    	if(conn !=null)conn.close();
	    }
		return ck;
	}
	
	
	
	//찾기 구문 관리자가 승인을 할 목록들을 가져 오는 구문
	
	//마이페이지에서 회원 번호로 분양 정보 가져오기
	
	//삭제
	public boolean deleteParcle(int no){
		return false;
	}
}
