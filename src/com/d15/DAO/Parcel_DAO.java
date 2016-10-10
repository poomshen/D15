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
	public ArrayList<MangerParcel_DTO> mangerlist(){
		ArrayList<MangerParcel_DTO> list = new ArrayList<MangerParcel_DTO>();
		try {
			conn = ds.getConnection();
			String sql = "select  m_id , m_name ,	m_phone, m_email,	m_addr,"
					+ " m_petok,pr_reqdate,pr_begdate,pr_enddate,org_img,org_code,"
					+ "org_gender,org_count,org_date ,pc_no from "
					+ " (select * from (select * from D15_parcel pr join D15_DETAIL mb on pr.M_NO = mb.M_NO) c join D15_MEMBER e "
					+ " on m_no = e.m_no where PR_ARGDATE is null) c join D15_ORGANIC e on e.ORG_NO = c.Org_no;";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MangerParcel_DTO mangerDTO = new MangerParcel_DTO();
				mangerDTO.setId(rs.getString(1));
				mangerDTO.setName(rs.getString(2));
				mangerDTO.setPhone(rs.getString(3));
				mangerDTO.setEmail(rs.getString(4));
				mangerDTO.setPetOk(rs.getString(5));
				mangerDTO.setReqdate(rs.getDate("pr_reqdate"));
				mangerDTO.setBegdate(rs.getDate("pr_begdate"));
				mangerDTO.setImg(rs.getString(9));
				mangerDTO.setGender(rs.getString(10));
				mangerDTO.setCode(rs.getString(11));
				mangerDTO.setCount(rs.getInt(12));
				mangerDTO.setDate(rs.getInt(13));
				mangerDTO.setPc_no(rs.getInt(14));
				list.add(mangerDTO);
			}
			return list;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	
	//마이페이지에서 회원 번호로 분양 정보 가져오기
	
	//삭제
	public boolean deleteParcle(int no){
		return false;
	}
}
