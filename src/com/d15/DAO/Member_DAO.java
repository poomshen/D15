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
import com.d15.DTO.MemberJoin_DTO;
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
	
	//회원가입 처리 함수
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
			}else{
				System.out.println("행 삽입 실패");
			}
			
			String sql2="insert into D15_Detail(m_no, m_name, m_phone, m_birth, m_email, m_addr,m_daddr, m_petok, m_update, m_regdate) "
					+ "values(m_no_seq.currval,?,?,?,?,?,?,?,sysdate,sysdate)";
			
			pstmt = conn.prepareStatement(sql2);
			
			pstmt.setString(1, dto2.getM_name());
			pstmt.setString(2, dto2.getM_phone());
			pstmt.setInt(3, dto2.getM_birth());
			pstmt.setString(4, dto2.getM_email());
			pstmt.setString(5, dto2.getM_addr());
			pstmt.setString(6, dto2.getM_daddr());
			pstmt.setString(7, dto2.getM_petok());
			

			System.out.println(dto2);	
			row = pstmt.executeUpdate();

		}catch(Exception e){
			System.out.println("insertPet error : " + e.getMessage());
		}
		
		return 0;
	}
	
	//로그인 처리 함수
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
				System.out.println("로그인 실패");
			}
		
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return null;		
	}
	
	//상세정보 보기 처리 함수
	public MemberJoin_DTO selectMember(int m_no){
		MemberJoin_DTO memberjoindto=new MemberJoin_DTO();
		System.out.println(m_no);
		try{
			
			conn = ds.getConnection();
					
			String sql = "select M.m_no, M.m_id, M.m_pwd, M.m_lastdate, M.c_code, D.m_name, D.m_phone, D.m_birth, D.m_email, D.m_addr,D.m_daddr, D.m_petok,D. m_update, D.m_regdate "
					+"from D15_Member M join D15_Detail D on M.M_NO=D.M_NO where M.m_no=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, m_no);
		
			rs = pstmt.executeQuery();
			System.out.println(rs);
			
			
			if (rs.next()) {
				
				memberjoindto.setM_no(rs.getInt(1));
				memberjoindto.setM_id(rs.getString(2));
				memberjoindto.setM_pwd(rs.getString(3));
				memberjoindto.setM_lastdate(rs.getDate(4));
				memberjoindto.setC_code(rs.getString(5));
				memberjoindto.setM_name(rs.getString(6));
				memberjoindto.setM_phone(rs.getString(7));
				memberjoindto.setM_birth(rs.getInt(8));
				memberjoindto.setM_email(rs.getString(9));
				memberjoindto.setM_addr(rs.getString(10));
				memberjoindto.setM_daddr(rs.getString(11));
				memberjoindto.setM_petok(rs.getString(12));
				memberjoindto.setM_update(rs.getDate(13));
				memberjoindto.setM_regdate(rs.getDate(14));
				
				
			} else {
			}

		}catch(Exception e){
			System.out.println("insertPet error : " + e.getMessage());
		}

		return memberjoindto;
	}	
}
