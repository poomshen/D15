/*
 * @Class : Member_DAO
 * @Date : 2016.10.7
 * @Author : 길한종
 * @Desc : 로그인, 회원가입 처리할 DAO
 */

package com.d15.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.d15.DTO.Detail_DTO;
import com.d15.DTO.Member_DTO;
import com.d15.DTO.Pet_DTO;

public class Member_DAO {
	//db연결 초기작업
	static DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	static {
		InitialContext ctx;
		try {
			
			/*
			 * Context context = new InitialContext(); DataSource datasource =
			 * (DataSource)context.lookup("java:comp/env/jdbc/oracle"); conn =
			 * datasource.getConnection();
			 */
			ctx = new InitialContext();
			Context envCtx = (Context) ctx.lookup("java:comp/env");
			ds = (DataSource) envCtx.lookup("/jdbc/oracle");
			System.out.println("DataSource 객체 생성 성공 !");
			
		} catch (NamingException e) {				
			System.out.println("lookup Fail : " + e.getMessage());
		}
	}
	
	public int insertMember(Member_DTO dto, Detail_DTO dto2){
		
		try{
			
			conn = ds.getConnection();
					
			String sql = "insert into D15_Member(m_no, m_id, m_pwd, m_lastdate, c_code) "
					+ "values(m_no_seq.nextval,?,?,sysdate,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getM_id());
			pstmt.setString(2, dto.getM_pwd());
			pstmt.setString(3, dto.getC_code());
				
			int row = pstmt.executeUpdate();
			if(row > 0){
				System.out.println("행 삽입  : " + row + "개");
				return row;
			}else{
				System.out.println("행 삽입 실패");
			}
			
			String sql2="insert into D15_Detail(m_no, m_name, m_phone, m_birth, m_email, m_addr, m_petok, m_update, m_regdate, m_file) "
					+ "values(m_no_seq.currval,?,?,?,?,?,?,sysdate,sysdate,?)";
			
			pstmt = conn.prepareStatement(sql2);
			
			pstmt.setString(1, dto2.getM_name());
			pstmt.setString(2, dto2.getM_phone());
			pstmt.setInt(3, dto2.getM_birth());
			pstmt.setString(4, dto2.getM_email());
			pstmt.setString(5, dto2.getM_addr());
			pstmt.setString(6, dto2.getM_addr());
			pstmt.setString(7, dto2.getM_file());
				
			row = pstmt.executeUpdate();
			System.out.println(row);
		}catch(Exception e){
			System.out.println("insertPet error : " + e.getMessage());
		}
		
		return 0;
	}
	
	public Member_DTO checkMember(String m_id, String m_pwd){

		
		try{
			
			conn = ds.getConnection();
					
			String sql = "select m_no, m_id, m_pwd, m_lastdate, c_code from D15_Member "
					+ "where m_id=? and m_pwd=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m_id);
			pstmt.setString(2, m_pwd);
				
			rs = pstmt.executeQuery();
		
			if (rs.next()) {
				System.out.println("로그인 성공");

				Member_DTO memberdto=new Member_DTO();
				memberdto.setM_no(rs.getInt(1));
				memberdto.setM_id(rs.getString(2));
				memberdto.setM_pwd(rs.getString(3));
				memberdto.setM_lastdate(rs.getDate(4));
				memberdto.setC_code(rs.getString(5));
				return memberdto;
			} else {
			}
		
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return null;
		
	}
	
}
