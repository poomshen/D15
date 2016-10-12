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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.sql.DataSource;

import com.d15.DTO.MissingDetail_DTO;
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
		
		// 최근에 삽입된 펫 테이블의 상위 컬럼 뽑기
		public int insertMissingBoard(Missing_DTO dto , int m_no){
			try{
				
				conn = ds.getConnection();
				
				String sql = "select max(p_no) from D15_pet";
				
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				rs.next();
				
				
				String sql2 = "insert into D15_missing(mis_no,m_no,p_no,mis_date,mis_loc,mis_count,mis_content,mis_pro) values"
						+ "(mis_no_seq.nextval,?,?,?,?,0,?,'N')";
				pstmt = conn.prepareStatement(sql2);
				
				pstmt.setInt(1, m_no );
				pstmt.setInt(2, rs.getInt(1));
				pstmt.setDate(3, dto.getMis_date());
				pstmt.setString(4,dto.getMis_loc());
				pstmt.setString(5, dto.getMis_content());
				
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
			}finally{
				if(rs != null)try{rs.close();}catch(Exception e){}
				if(pstmt != null)try{pstmt.close();}catch(Exception e){}
				if(conn != null)try{conn.close();}catch(Exception e){}
				
			}
			
			return 0;
		}
		
		// 실종 게시판 목록 가져오기(페이징 처리)
		public List<MissingJoin_DTO> selectMissingPet(int cpage , int pagesize){
			List<MissingJoin_DTO> list = null;
			try{
				
				list = new ArrayList<MissingJoin_DTO>();
				
				conn = ds.getConnection();
				String sql = "select * " 
						+ "from("
						+    "select ROWNUM rn , mis_no , p_image , m_id , mis_date , mis_loc , mis_content , mis_pro "
						+		  "from("
						+		    "select   mis_no , p_image , m_id , mis_date , mis_loc , mis_content , mis_pro " 
						+		    "from D15_pet p join D15_missing i on p.p_no = i.p_no join D15_member m on i.m_no = m.m_no "
						+		    "order by mis_no desc"
						+		  ")"  
						+		")"
						+	"where rn between ? and ?";
				
				int start = cpage * pagesize - (pagesize - 1);
				int end = cpage * pagesize;
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				
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
			
			}finally{
				if(rs != null)try{rs.close();}catch(Exception e){}
				if(pstmt != null)try{pstmt.close();}catch(Exception e){}
				if(conn != null)try{conn.close();}catch(Exception e){}
				
			}
			return list;
		}
		
		
		// 게시물의 총 개수 구하기
		public int totalListCount(){
			
			try{
				
				conn = ds.getConnection();
				String sql = "select count(*) cnt from D15_pet p join D15_missing i on p.p_no = "
						+ "i.p_no join D15_member m on i.m_no = m.m_no";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				int totalcount = 0;
				if(rs.next()){
					totalcount = rs.getInt("cnt");
				}
				return totalcount;
			}catch(Exception e){
				
				System.out.println("totallistCount error");
				e.printStackTrace();
			}finally{
				if(rs != null)try{rs.close();}catch(Exception e){}
				if(pstmt != null)try{pstmt.close();}catch(Exception e){}
				if(conn != null)try{conn.close();}catch(Exception e){}
				
			}
			return 0;
		}
		
		public MissingDetail_DTO detailMissingPet(int mis_no){
			MissingDetail_DTO mdto = null;
			try{
				
				conn = ds.getConnection();
				String sql = "select mis_no , p_image , m_id , k_kind , p_gender , p_color , p_feature , "
					+ "p_age , p_weight , mis_date , mis_loc , mis_content "
					+ "from D15_kind k join D15_pet p on k.k_code = p.k_code "
					+ "join D15_missing i on p.p_no = i.p_no join D15_member m on i.m_no = m.m_no "
					+ "where mis_no = ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,mis_no);
				
				rs = pstmt.executeQuery();
				if(rs.next()){
					mdto = new MissingDetail_DTO();
					
					mdto.setMis_no(rs.getInt(1));
					mdto.setP_image(rs.getString(2));
					mdto.setM_id(rs.getString(3));
					mdto.setK_kind(rs.getString(4));
					mdto.setP_gender(rs.getString(5));
					mdto.setP_color(rs.getString(6));
					mdto.setP_feature(rs.getString(7));
					mdto.setP_age(rs.getInt(8));
					mdto.setP_weight(rs.getInt(9));
					mdto.setMis_date(rs.getDate(10));
					mdto.setMis_loc(rs.getString(11));
					mdto.setMis_content(rs.getString(12));
					
				}else{
					System.out.println("없는 게시물-_-");
				}
				
			}catch(Exception e){
				System.out.println("detailMissingPet error");
				e.printStackTrace();
			}finally{
				if(rs != null)try{rs.close();}catch(Exception e){}
				if(pstmt != null)try{pstmt.close();}catch(Exception e){}
				if(conn != null)try{conn.close();}catch(Exception e){}
				
			}
			
			return mdto;
		}
		
		//회원이 실종견을 찾았을시 버튼 처리
		public int updateMissData(int mis_no){
			try{
				conn = ds.getConnection();
				String sql = "update D15_missing set mis_pro = 'Y' "
						+ "where mis_no = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1 , mis_no);
				
				int row = pstmt.executeUpdate();
				if(row > 0){
					System.out.println("업데이트  완료");
					return row;
				}else{
					System.out.println("업데이트 실패");
				}
			}catch(Exception e){
				System.out.println("updateMissdata error");
				e.printStackTrace();
			}finally{
				if(pstmt != null)try{pstmt.close();}catch(Exception e){}
				if(conn != null)try{conn.close();}catch(Exception e){}
				
			}
			return 0;
		}
		
}
