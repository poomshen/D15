/*
 * @Class : Parcel_DAO
 * @Date : 2016.10.5
 * @Author : 이성준
 * @Desc : 분양 테이블에 대한 DAO(db연결,CRUD 작업)
 * 
 * */

package com.d15.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.d15.DTO.MangerParcel_DTO;
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
	public boolean insertParcel(Parcel_DTO parcel) throws SQLException{
		boolean ck = false;
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
		}finally{
			if(rs !=null) rs.close();
	    	if(pstmt !=null)pstmt.close();
	    	if(conn !=null)conn.close();
	    }
		
		return ck;
	}

	//유기견 번호를 가져온다.
	public int selectOrgno(int no){
		int org_no =0;
		try {
			conn = ds.getConnection();
			String sql = "select org_no from D15_parcel where pc_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs =  pstmt.executeQuery();
			if(rs.next()){
				org_no = rs.getInt(1);
			}else{
				org_no = 0;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return org_no;
	}
	
	//승인일 업데이트 - 분양 번호 받음
	public boolean updateStart(boolean cks,int num) throws SQLException {
		boolean ck = false;
		try {
			if (cks) {
				conn = ds.getConnection();
				String sql = "update D15_parcel set pc_argdate = sysdate where pc_no =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				int re = pstmt.executeUpdate();
				if (re > 0) {
					int  org_no = selectOrgno(num);
					Protect_DAO protect_DAO = new Protect_DAO();
					protect_DAO.updateProtect(org_no);
					ck = true;
					return ck;
				}
			} else {
				ck = deleteParcle(num);
			} 
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			if(rs !=null) rs.close();
	    	if(pstmt !=null)pstmt.close();
	    	if(conn !=null)conn.close();
	    }
		return ck;
	}
	
	
	
	//찾기 구문 관리자가 승인을 할 목록들을 가져 오는 구문
	public ArrayList<MangerParcel_DTO> mangerlist() throws SQLException{
		ArrayList<MangerParcel_DTO> list = new ArrayList<MangerParcel_DTO>();
		try {
			System.out.println("????a");
			conn = ds.getConnection();
<<<<<<< HEAD
			String sql = "Select  M_Id , M_Name ,M_Phone, M_Email,	M_Addr,M_Petok,Pc_Reqdate,Pc_Begdate,Org_Img,Org_Code,Org_Gender,Org_Count,Org_Date ,Pc_No from (select * from (Select * From (select * from D15_Parcel where Pc_ARGDATE is null) pr join D15_MEMBER mb on pr.m_no = mb.m_no) s join D15_Detail e on m_no = e.m_no ) sw join D15_ORGANIC org on sw.ORG_NO = org.Org_no";
=======
			String sql = "Select  M_Id , M_Name , M_Phone, M_Email, M_Addr,M_Petok,Pc_Reqdate,Pc_Begdate,Org_Img,Org_Code,Org_Gender,Org_Count,Org_Date ,Pc_No From "
					+ "(Select ORG_NO, Pc_No,S.M_No,Pc_Reqdate,Pc_Begdate,M_Id ,M_Name ,   M_Phone, M_Email,   M_Addr,M_Petok From "
					+ "(Select ORG_NO,pc_no,Pc.M_No,Pc_Reqdate,Pc_Begdate,m_id From "
					+ "(Select * From D15_Parcel Where pc_Argdate Is Null) Pc Join D15_Member Mb On Pc.M_No = Mb.M_No) S "
					+ "Join D15_Detail  E On S.M_No = E.M_No ) Sw join D15_ORGANIC org on sw.ORG_NO = org.Org_no";
>>>>>>> bccf6296fb832d51c785abfc546fa2fc07f6edfc
			pstmt = conn.prepareStatement(sql);
			System.out.println("요요요요요");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MangerParcel_DTO mangerDTO = new MangerParcel_DTO();
				mangerDTO.setId(rs.getString(1));
				mangerDTO.setName(rs.getString(2));
				mangerDTO.setPhone(rs.getString(3));
				mangerDTO.setEmail(rs.getString(4));
				mangerDTO.setAddr(rs.getString(5));
<<<<<<< HEAD
				mangerDTO.setPetOk(rs.getInt(6));
=======
				mangerDTO.setPetOk(rs.getString(6));
>>>>>>> bccf6296fb832d51c785abfc546fa2fc07f6edfc
				mangerDTO.setReqdate(rs.getDate(7));
				mangerDTO.setBegdate(rs.getDate(8));
				mangerDTO.setImg(rs.getString(9));
				mangerDTO.setCode(rs.getString(10));
				mangerDTO.setGender(rs.getString(11));
				mangerDTO.setCount(rs.getInt(12));
				mangerDTO.setDate(rs.getInt(13));
				mangerDTO.setPc_no(rs.getInt(14));
				list.add(mangerDTO);
			}
			return list;
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			if(rs !=null) rs.close();
	    	if(pstmt !=null)pstmt.close();
	    	if(conn !=null)conn.close();
	    }
		return list;
	}
	
	//마이페이지에서 회원 번호로 분양 정보 가져오기
	
	//삭제
	public boolean deleteParcle(int no) throws SQLException{
		boolean ck = false;
		try {
			conn = ds.getConnection();
			String  sql = "DELETE FROM D15_Parcel where pc_no = ?";
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
}
