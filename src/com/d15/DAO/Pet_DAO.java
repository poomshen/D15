/*
 * @Class : Pet_DAO
 * @Date : 2016.10.5
 * @Author : 박문수
 * @Desc : 펫 테이블에 대한 DAO(db연결,CRUD 작업)
 * 
 * */

package com.d15.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.d15.DTO.Pet_DTO;

public class Pet_DAO {
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
	
	public int insertPet(Pet_DTO pet , String kind){
		
		try{
			
			conn = ds.getConnection();
			
			// 견종 테이블의 견종코드 뽑기 
			/*String sql = "select k_code from D15_kind where k_kind like %?%";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, kind.getK_kind());
	
			rs = pstmt.executeQuery();
			System.out.println("?");
			rs.next();*/
					
			String sql_2 = "insert into D15_pet(p_no,p_image,k_code,p_gender,p_color,p_feature,p_age,p_weight) "
					+ "values(p_no_seq.nextval,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql_2);
			
			pstmt.setString(1, pet.getP_image());
			pstmt.setString(2, kind);
			pstmt.setString(3, pet.getP_gender());
			pstmt.setString(4, pet.getP_color());
			pstmt.setString(5, pet.getP_feature());
			pstmt.setInt(6, pet.getP_age());
			pstmt.setInt(7, pet.getP_weight());
			
			int row = pstmt.executeUpdate();
			if(row > 0){
				System.out.println("행 삽입  : " + row + "개");
				return row;
			}else{
				System.out.println("행 삽입 실패");
			}
		
		}catch(Exception e){
			System.out.println("insertPet error : " + e.getMessage());
		}finally{
			
			if(pstmt != null)try{pstmt.close();}catch(Exception e){}
			if(conn != null)try{conn.close();}catch(Exception e){}
			
		}
		
		return 0;
	}
}
