/*
 * @Class : Protect_DAO
 * @Date : 2016.10.5
 * @Author : 이성준
 * @Desc : 임시보호 테이블에 대한 DAO(db연결,CRUD 작업)
 * 
 * */

package com.d15.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.d15.DTO.MangerProtect_DTO;
import com.d15.DTO.Protect_DTO;
import com.sun.org.apache.regexp.internal.recompile;

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
	public boolean insertProtect(Protect_DTO insert) throws SQLException{
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
		}finally{
			if(rs !=null) rs.close();
	    	if(pstmt !=null)pstmt.close();
	    	if(conn !=null)conn.close();
	    }
		
		return ck;
	}
	
	//임시보호 삭제 - 회원 임시보호 취소 -> ( 트리거 사용 구문???)
	public boolean deleteProtect(int no) throws SQLException{
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
		}finally{
			if(rs !=null) rs.close();
	    	if(pstmt !=null)pstmt.close();
	    	if(conn !=null)conn.close();
	    }
		
		return ck;
	}
	
	//관리자 영역 승인안된list (관리자가 승인여부하기위해 찾기 위한 list 구문)
	public  ArrayList<MangerProtect_DTO> mangerlist() throws SQLException{
		ArrayList<MangerProtect_DTO> list = new  ArrayList<MangerProtect_DTO>();
		try {
			conn = ds.getConnection();
			String sql ="Select  M_Id , M_Name ,M_Phone, M_Email,M_Addr,M_Petok,Pr_Reqdate,Pr_Begdate,Pr_Enddate,"
					+ "Org_Img,Org_Code,Org_Gender,Org_Count,Org_Date ,Pr_No From "
					+ "(Select ORG_NO, Pr_No,S.M_No,Pr_Reqdate,Pr_Begdate,Pr_Enddate,M_Id ,M_Name , M_Phone, M_Email,M_Addr,M_Petok From "
					+ "(Select ORG_NO,pr_no,Pr.M_No,Pr_Reqdate,Pr_Begdate,Pr_Enddate,m_id From "
					+ "(Select * From D15_Protect Where Pr_Argdate Is Null) Pr Join D15_Member Mb On Pr.M_No = Mb.M_No)  S Join D15_Detail  E On s.M_No = e.M_No ) Sw "
					+ "join D15_ORGANIC org on sw.ORG_NO = org.Org_no";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()){
				MangerProtect_DTO  mangerDTO  = new MangerProtect_DTO();
				mangerDTO.setId(rs.getString(1));
				mangerDTO.setName(rs.getString(2));
				mangerDTO.setPhone(rs.getString(3));
				mangerDTO.setEmail(rs.getString(4));
				mangerDTO.setAddr(rs.getString(5));
				mangerDTO.setPetOk(rs.getString(6));
				mangerDTO.setReqdate(rs.getDate(7));
				mangerDTO.setBegdate(rs.getDate(8));
				mangerDTO.setEnddate(rs.getDate(9));
				mangerDTO.setImg(rs.getString(10));
				mangerDTO.setCode(rs.getString(11));
				mangerDTO.setGender(rs.getString(12));
				mangerDTO.setCount(rs.getInt(13));
				mangerDTO.setDate(rs.getInt(14));
				mangerDTO.setPr_no(rs.getInt(15));
				list.add(mangerDTO);
			}
			return list;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(rs !=null) rs.close();
	    	if(pstmt !=null)pstmt.close();
	    	if(conn !=null)conn.close();
	    }
		
			
		return list;
		
	}
	
	
	//관리자가 승인한 날짜 업데이트 구문 (승인 허락)
	public boolean updateProtect(boolean cks, int no) throws SQLException{
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
		}finally{
			if(rs !=null) rs.close();
	    	if(pstmt !=null)pstmt.close();
	    	if(conn !=null)conn.close();
	    }
		
		return ck;
	}
	
	
	
	//보호 시작일,종료일 업데이트(보호 시작 요청 할때 사용)
	
	
	//보호 종료일 업대이트 (기간을 늘리거나 보호가아닌 분양을 받을 경우)


}
