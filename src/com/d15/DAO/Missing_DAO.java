/*
 * @Class : Missing_DAO
 * @Date : 2016.10.6
 * @Author : 박문수
 * @Desc : 실종신고테이블에 대한 DAO(db연결,CRUD 작업)
 * 
 * */


package com.d15.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.d15.DTO.MissingJoin_DTO;
import com.d15.DTO.Missing_DTO;
 
public class Missing_DAO {
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
		
		
		public int insertMissingBoard(Missing_DTO dto){
			try{
				
				
				conn = ds.getConnection();
				
				String sql = "select max(p_no) from D15_pet";
				
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				rs.next();
				
				
				String sql2 = "insert into D15_missing(mis_no,m_no,p_no,mis_date,mis_loc,mis_count,mis_content,mis_pro) values"
						+ "(mis_no_seq.nextval,3,?,?,?,0,?,'N')";
				pstmt = conn.prepareStatement(sql2);
				
				pstmt.setInt(1, rs.getInt(1));
				pstmt.setDate(2, dto.getMis_date());
				pstmt.setString(3,dto.getMis_loc());
				pstmt.setString(4, dto.getMis_content());
				
				int row = pstmt.executeUpdate();
				if(row > 0){
					System.out.println("행 삽입 성공" + row);
					return row;
				}else{
					System.out.println("행 삽입 실패");
				}
				
			}catch(Exception e){
				System.out.println("Missing_DAO error" + e.getMessage());
				e.printStackTrace();
			}
			
			return 0;
		}
		
		public List<MissingJoin_DTO> selectMissingPet(){
			List<MissingJoin_DTO> list = null;
			try{
				list = new ArrayList<MissingJoin_DTO>();
				conn = ds.getConnection();
				String sql = "select mis_no , p_image , m_id , mis_date , mis_loc , mis_content , mis_pro "
						+ "from D15_pet p join D15_missing i on p.p_no = i.p_no join D15_member m on i.m_no = m.m_no "
						+ "order by mis_no desc"; 
				
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					MissingJoin_DTO dto = new MissingJoin_DTO();
					dto.setMis_no(rs.getInt("mis_no"));
					dto.setP_image(rs.getString("p_image"));
					dto.setM_id(rs.getString("m_id"));
					dto.setMis_date(rs.getDate("mis_date"));
					dto.setMis_loc(rs.getString("mis_loc"));
					dto.setMis_content(rs.getString("mis_content"));
					dto.setMis_pro(rs.getString("mis_pro"));
					
					list.add(dto);
				}
				
			}catch(Exception e){
				System.out.println("selectMissingPet error");
				e.printStackTrace();
			}
			return list;
		}
	
}
