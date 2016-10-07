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
	
	public int insertMember(Member_DTO dto){
		
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
		
		}catch(Exception e){
			System.out.println("insertPet error : " + e.getMessage());
		}
		
		return 0;
	}
	
	public int checkMember(String m_id, String m_pwd){
		int n=0;
		try{
			
			conn = ds.getConnection();
					
			String sql = "select m_no, m_id from D15_Member "
					+ "where m_id=? and m_pwd=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m_id);
			pstmt.setString(2, m_pwd);
				
			rs = pstmt.executeQuery();
		
			if (rs.next()) {
				System.out.println("로그인 성공");
				n=1;
			}
		
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		
		return n;
	}
	
	
	
	
}
