package pack.business;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import pack.mybatis.SqlMapConfig;


public class PlayerDao {
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	private int tot; // 전체 레코드 수
	private int pList = 5; // 페이지 당 출력 자료 수
	private int pageSu; // 전체 페이지 수
	
	public int PagesuPart(String t_no, String pos, String p_name) {
		SqlSession sqlSession = factory.openSession();
		SqlMapperInter inter = (SqlMapperInter) sqlSession.getMapper(SqlMapperInter.class);
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("pos", pos);
		param.put("t_no", t_no);
		param.put("p_name", p_name);
		try {
			// <----- 1개만 입력 되었을 때. ----->
			if (p_name.equals("") && t_no.equals("0"))
				tot = inter.PagesuPart1(pos);
			else if (pos.equals("0") && t_no.equals("0"))
				tot = inter.PagesuPart2(p_name);
			else if (pos.equals("0") && p_name.equals(""))
				tot = inter.PagesuPart3(Integer.parseInt(t_no));
			
			// <----- 2개 입력 되었을 때. ----->
			else if (p_name.equals("")) {	
				tot = inter.PagesuPart4(param);
			}else if (t_no.equals("0")) {	
				tot = inter.PagesuPart5(param);
			}else if(pos.equals("0")) {
				tot = inter.PagesuPart6(param);
			}
			
			//<----- 모두 입력되었을때 ----->
			else
				tot = inter.PagesuPart7(param);
				
			//<----- ------ ------> 
			if (tot % pList == 0)
				pageSu = tot / pList;
			else
				pageSu = tot / pList + 1;
			
		} catch (Exception e) {
			System.out.println("PagesuPart point 3");
		} finally {
			if (sqlSession != null)
				sqlSession.close();

		}
		return pageSu; 
	}
	public List<PlayerDto> playerDataAll() { // Exception을 사용하지 말고, try-catch로 넘겨받은모습.
		SqlSession sqlSession = factory.openSession();
		List list = null;
		try {
			
			SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);//바뀐 부분
			list = sqlSession.selectList("playerDataAll");

		} catch (Exception e) {
			System.out.println("playerDataAll err: " + e);
		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}
		return list;
	}
	
	public PlayerDto selectplayerDataPart(String no) { // Exception을 사용하지 말고, try-catch로 넘겨받은모습.
		SqlSession sqlSession = factory.openSession();
		PlayerDto dto = null;
		try {
			SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);//바뀐 부분
			dto = inter.selectplayerDataPart(no); //바뀐 부분
		} catch (Exception e) {
			System.out.println("selectplayerDataPart err: " + e);

		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}

		return dto;

	}
/*
	public PlayerDto playDataPart(String no) {
		SqlSession sqlSession = factory.openSession();
		PlayerDto dto = null;
		try {
			SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);//바뀐 부분
			dto = inter.playDataPart(no); //바뀐 부분
		} catch (Exception e) {
			System.out.println("selectDataPartQuit err: " + e);

		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}
		return dto;
	}
	*/
	public boolean playerdelData(PlayerFormBean playerFormBean){		
		boolean b = false;
		SqlSession sqlSession = factory.openSession();

		try {
			SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);	//바뀐 부분
						
			if(inter.playerdelData(playerFormBean) > 0) b = true;
					//바뀐 부분.
				sqlSession.commit();
			
		} catch (Exception e) {
			System.out.println("ticketData err: " + e);
			sqlSession.rollback();
		} finally {
			if (sqlSession != null)	sqlSession.close();
		}
		return b;
	}

	

	public List<PlayerDto> getDataPart(int page, String t_no, String pos, String p_name) {
		SqlSession sqlSession = factory.openSession();
		List<PlayerDto> list = null;
		ArrayList<PlayerDto> list2 = new ArrayList<PlayerDto>();
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("pos", pos);
		param.put("t_no", t_no);
		param.put("p_name", p_name);
		try {
			SqlMapperInter inter = (SqlMapperInter) sqlSession.getMapper(SqlMapperInter.class);
			// <----- 1개씩만 입력되었을때 ----->
			if (p_name.equals("") && t_no.equals("0")) 
				list = inter.getDataPart1(pos);
			else if (pos.equals("0") && t_no.equals("0")) 
				list = inter.getDataPart2(p_name);
			else if (pos.equals("0") && p_name.equals(""))
				list = inter.getDataPart3(Integer.parseInt(t_no));
			
			// <----- 2개씩 입력되었을때 ----->
			else if (p_name.equals("")) 	
				list = inter.getDataPart4(param);
			else if (t_no.equals("0")) 	
				list = inter.getDataPart5(param);
			else if(pos.equals("0")) 
				list = inter.getDataPart6(param);
			
			//<----- 모두 입력되었을때 ----->
			else
				list = inter.getDataPart7(param);
			
			int k = 0;
			while (k < pList) {
				PlayerDto dto = new PlayerDto();
				dto.setP_image(list.get(((page - 1) * pList) + k).getP_image());
				dto.setB_num(list.get(((page - 1) * pList) + k).getB_num());
				dto.setP_name(list.get(((page - 1) * pList) + k).getP_name());
				dto.setT_no(list.get(((page - 1) * pList) + k).getT_no());
				dto.setPos(list.get(((page - 1) * pList) + k).getPos());
				dto.setP_birth(list.get(((page - 1) * pList) + k).getP_birth());
				dto.setP_no(list.get(((page - 1) * pList) + k).getP_no());
				list2.add(dto);
				k++;
			}
			sqlSession.commit();
		} catch (Exception e) {
			System.out.println("getDataPart Error:" + e);
		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}
		return list2;
	}
	
	public boolean playerupData(PlayerFormBean playerFormBean) {      
	      boolean b = false;
	      SqlSession sqlSession = factory.openSession();
	      
	      try {
	         SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);   //바뀐 부분

	         PlayerDto dto = inter.playDataPart(Integer.toString(playerFormBean.getP_no()));	//바뀐 부분	

	         
	            if(inter.playerupData(playerFormBean) > 0) b = true;   //바뀐 부분.
	            sqlSession.commit();
	         
	      } catch (Exception e) {
	         System.out.println("playerupData err: " + e);
	         sqlSession.rollback();
	      } finally {
	         if (sqlSession != null)   sqlSession.close();
	      }
	      return b;
	   }

}