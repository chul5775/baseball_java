package pack.business;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.taglibs.standard.lang.jstl.test.Bean1;

import com.sun.org.apache.xml.internal.security.keys.content.RetrievalMethod;

import pack.board.BoardBean;
import pack.board.BoardDto;
import pack.business.AdminBean;
import pack.mybatis.SqlMapConfig;

public class ProcessDao {
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	private int tot; // 전체 레코드 수
	private int pList = 5; // 페이지 당 출력 자료 수
	private int pageSu; // 전체 페이지 수

	// <------- 게시판 만들기 ------->

	public void saveData(BoardBean bean) {
			SqlSession sqlSession = factory.openSession();
	      try {
	    	SqlMapperInter inter = (SqlMapperInter) sqlSession.getMapper(SqlMapperInter.class);
			inter.saveData(bean);
			sqlSession.commit();
	      } catch (Exception e) {
	         System.out.println("saveData err: " + e);
	      } finally {
	  		if (sqlSession != null)
				sqlSession.close();
	         } 
	         
	      }

	public int PagesuAll() {
		SqlSession sqlSession = factory.openSession();
		SqlMapperInter inter = (SqlMapperInter) sqlSession.getMapper(SqlMapperInter.class);
		try {
			tot = inter.PagesuAll();
			if (tot % pList == 0)
				pageSu = tot / pList;
			else
				pageSu = tot / pList + 1;
		} catch (Exception e) {
			System.out.println("PagesuAll Error");
		} finally {
			if (sqlSession != null)
				sqlSession.close();

		}
		return pageSu;
	}

	public int PagesuPart(String stype, String sword) {
		SqlSession sqlSession = factory.openSession();
		SqlMapperInter inter = (SqlMapperInter) sqlSession.getMapper(SqlMapperInter.class);
		try {
			if (stype.equals("title"))
				tot = inter.PageBoardPart1(sword);
			else
				tot = inter.PageBoardPart2(sword);

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

	public List<BoardDto> getDataAll(int page) {
		SqlSession sqlSession = factory.openSession();
		List<BoardDto> list = null;
		ArrayList<BoardDto> list2 = new ArrayList<BoardDto>();
		try {
			SqlMapperInter inter = (SqlMapperInter) sqlSession.getMapper(SqlMapperInter.class);
			list = inter.getDataAll();
			int k = 0;
			while (k < pList) {
				BoardDto dto = new BoardDto();
				dto.setNum(list.get(((page - 1) * pList) + k).getNum());
				dto.setName(list.get(((page - 1) * pList) + k).getName());
				dto.setTitle(list.get(((page - 1) * pList) + k).getTitle());
				dto.setBdate(list.get(((page - 1) * pList) + k).getBdate());
				dto.setReadcnt(list.get(((page - 1) * pList) + k).getReadcnt());
				dto.setNested(list.get(((page - 1) * pList) + k).getNested());
				list2.add(dto);
				k++;
			}
		} catch (Exception e) {
			System.out.println("getDataAll Error");
		} finally {
			if (sqlSession != null)
				sqlSession.close();

		}
		return list2;
	}

	
	public List<BoardDto> getDataPart(int page, String stype, String sword) {
		SqlSession sqlSession = factory.openSession();
		List<BoardDto> list = null;
		ArrayList<BoardDto> list2 = new ArrayList<BoardDto>();
		try {
			SqlMapperInter inter = (SqlMapperInter) sqlSession.getMapper(SqlMapperInter.class);
			if (stype.equals("title"))
				list = inter.BoardDataPart1(sword);
			else
				list = inter.BoardDataPart2(sword);
			int k = 0;
			while (k < pList) {
				BoardDto dto = new BoardDto();
				dto.setNum(list.get(((page - 1) * pList) + k).getNum());
				dto.setName(list.get(((page - 1) * pList) + k).getName());
				dto.setTitle(list.get(((page - 1) * pList) + k).getTitle());
				dto.setBdate(list.get(((page - 1) * pList) + k).getBdate());
				dto.setReadcnt(list.get(((page - 1) * pList) + k).getReadcnt());
				dto.setNested(list.get(((page - 1) * pList) + k).getNested());
				list2.add(dto);
				k++;
			}
		} catch (Exception e) {
			System.out.println("getBoardsuPart1 Error\n");
		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}
		return list2;
	}

	public int currentGetMaxNum() {
		int cnt = 0;
		SqlSession sqlSession = factory.openSession();
		try {
			SqlMapperInter inter = (SqlMapperInter) sqlSession.getMapper(SqlMapperInter.class);
			cnt = inter.currentGetMaxNum();
		} catch (Exception e) {
			System.out.println("currentGetMaxNum Error");
		} finally {
			if (sqlSession != null)
				sqlSession.close();

		}
		return cnt;
	}
	
	public void totalList() {
		SqlSession sqlSession = factory.openSession();
		try {
			SqlMapperInter inter = (SqlMapperInter) sqlSession.getMapper(SqlMapperInter.class);// 바뀐 부분
			tot = inter.totalList();
		} catch (Exception e) {
			System.out.println("selectDataAll err: " + e);
		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}
	}
	
	public int totalG() {
		int totG = 0;
		SqlSession sqlSession = factory.openSession();
		try {
			SqlMapperInter inter = (SqlMapperInter) sqlSession.getMapper(SqlMapperInter.class);// 바뀐 부분
			totG= inter.totalG();
			System.out.println(totG);
		} catch (Exception e) {
			System.out.println("totalG err: " + e);
		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}
		return totG;
	}
	
	public int totalD() {
		int totD = 0;
		SqlSession sqlSession = factory.openSession();
		try {
			SqlMapperInter inter = (SqlMapperInter) sqlSession.getMapper(SqlMapperInter.class);// 바뀐 부분
			totD = inter.totalD();
		} catch (Exception e) {
			System.out.println("selectDataAll err: " + e);
		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}
		return totD;
	}
	
	public int totalP() {
		int totP = 0;
		SqlSession sqlSession = factory.openSession();
		try {
			SqlMapperInter inter = (SqlMapperInter) sqlSession.getMapper(SqlMapperInter.class);// 바뀐 부분
			totP = inter.totalP();
		} catch (Exception e) {
			System.out.println("selectDataAll err: " + e);
		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}
		return totP;
	}

	public void saveReplyDate(BoardBean bean) {
		SqlSession sqlSession = factory.openSession();
		try {
			SqlMapperInter inter = (SqlMapperInter) sqlSession.getMapper(SqlMapperInter.class);
			inter.saveReplyDate(bean);
			sqlSession.commit();
		} catch (Exception e) {
			System.out.println("updateOnum Error");
		} finally {
			if (sqlSession != null)
				sqlSession.close();

		}
	}

	public int getPageSu() {
		pageSu = tot / pList;
		if (tot % pList > 0)
			pageSu++;
		return pageSu;
	}
	
	   public void updateReadcnt(String num) { //글 내용 보기 전에 조회수 증가
		   		SqlSession sqlSession = factory.openSession();
		      try {
		    	  SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);
					inter.updateReadcnt(num);
					sqlSession.commit();
		   } catch (Exception e) {
		      System.out.println("updateReadcnt err :" + e);
		   } finally {
		 			if (sqlSession != null)
						sqlSession.close();
		      }
		   }
	   
		public BoardDto getData(String num) {
			SqlSession sqlSession = factory.openSession();
			BoardDto dto = new BoardDto();
			try {
				SqlMapperInter inter = (SqlMapperInter) sqlSession.getMapper(SqlMapperInter.class);
				dto = inter.getData(num);
			} catch (Exception e) {
				System.out.println("getData Error");
			} finally {
				if (sqlSession != null)
					sqlSession.close();

			}
			return dto;
		}
	  
	
	// <-------- 여기까지 게시판 만들기 -------->
	
	
	public List<GuestDto> selectDataAll() { // Exception을 사용하지 말고, try-catch로 넘겨받은모습.
		SqlSession sqlSession = factory.openSession();
		List list = null;
		try {
			
			SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);//바뀐 부분
			list = sqlSession.selectList("selectDataAll");

		} catch (Exception e) {
			System.out.println("selectDataAll err: " + e);
		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}
		return list;
	}
	
	public boolean upData(GuestBean guestBean) {		
		boolean b = false;
		SqlSession sqlSession = factory.openSession();
		
		try {
			SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);	//바뀐 부분
			
			GuestDto dto = inter.selectDataPart(guestBean.g_id);	//바뀐 부분	
			if(dto.getG_pwd().equals(guestBean.getG_pwd())) {
				if(inter.upData(guestBean) > 0) b = true;	//바뀐 부분.
				sqlSession.commit();
			
			}
		} catch (Exception e) {
			System.out.println("updateData err: " + e);
			sqlSession.rollback();
		} finally {
			if (sqlSession != null)	sqlSession.close();
		}
		return b;
	}
	
	public boolean direcotorupData(DirectorRBean directorRBean) {      
	      boolean b = false;
	      SqlSession sqlSession = factory.openSession();
	      
	      try {
	         SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);   //바뀐 부분
	         
	            if(inter.direcotorupData(directorRBean) > 0) b = true;   //바뀐 부분.
	            sqlSession.commit();
	         
	      } catch (Exception e) {
	         System.out.println("direcotorupData err: " + e);
	         sqlSession.rollback();
	      } finally {
	         if (sqlSession != null)   sqlSession.close();
	      }
	      return b;
	   }
	
	
	public List<DirectorDto> DirectorDataAll() { // Exception을 사용하지 말고, try-catch로 넘겨받은모습.
		SqlSession sqlSession = factory.openSession();
		List list = null;
		try {
			
			SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);//바뀐 부분
			list = sqlSession.selectList("directorDataAll");

		} catch (Exception e) {
			System.out.println("selectDataAll err: " + e);
		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}
		return list;
	}
	
	public List<BoardDto> boardDataAll(int page, String stype, String sword) { // Exception을 사용하지 말고, try-catch로 넘겨받은모습.
		SqlSession sqlSession = factory.openSession();
		List list = null;
		try {
			
			SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);//바뀐 부분
			list = sqlSession.selectList("boardDataAll");		
			BoardDto dto = null;
			
		for (int i = 0; i < (page - 1) * pList; i++) {
			
		}
			
		
		} catch (Exception e) {
			System.out.println("selectDataAll err: " + e);
		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}
		return list;
	}
	
	public boolean adminloginCheck(AdminBean bean) {
		boolean b = false;
		SqlSession sqlSession = factory.openSession();
		try {
			SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);//바뀐 부분
			if(inter.adminloginCheck(bean)) b=true; //바뀐 부분
			sqlSession.commit();
		} catch (Exception e) {
			System.out.println("selectDataPartQuit err: " + e);
			
		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}
		
		return b;
		
	}
	
	public boolean ticketData(GuestBean guestBean){		
		boolean b = false;
		SqlSession sqlSession = factory.openSession();

		try {
			SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);	//바뀐 부분
			
			GuestDto dto = inter.selectDataPart(guestBean.g_id);	//바뀐 부분	
			
			if(inter.ticketData(guestBean) > 0) b = true;
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
	
	public boolean delData(GuestBean guestBean){		
		boolean b = false;
		SqlSession sqlSession = factory.openSession();

		try {
			SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);	//바뀐 부분
			
			GuestDto dto = inter.selectDataPart(guestBean.g_id);	//바뀐 부분	
			
			if(inter.delData(guestBean) > 0) b = true;
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
	
	public boolean directdelData(DirectorRBean directorRBean){		
		boolean b = false;
		SqlSession sqlSession = factory.openSession();

		try {
			SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);	//바뀐 부분
						
			if(inter.directdelData(directorRBean) > 0) b = true;
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
	

	// 4.
	public GuestDto selectDataPart(String id) {
		SqlSession sqlSession = factory.openSession();
		GuestDto dto = null;
		try {
			SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);//바뀐 부분
			dto = inter.selectDataPart(id); //바뀐 부분
		} catch (Exception e) {
			System.out.println("selectDataPartQuit err: " + e);

		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}

		return dto;

	}
	
	public DirectorRDto directorDataPart(String no) {
		SqlSession sqlSession = factory.openSession();
		DirectorRDto dto = null;
		try {
			SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);//바뀐 부분
			dto = inter.directorDataPart(no); //바뀐 부분
		} catch (Exception e) {
			System.out.println("selectDataPartQuit err: " + e);

		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}

		return dto;

	}


	
	/*
	public boolean insData(DataFormBean bean) {
		boolean b = false;
		SqlSession sqlSession = factory.openSession();
		
		try {
			SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);	//바뀐 부분
			
			if (inter.insData(bean) > 0) b = true; //바뀐 부분
			sqlSession.commit();
			
		} catch (Exception e) {
			System.out.println("insertData err: " + e);
			sqlSession.rollback();
			
		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}
		return b;
	}
	


	public boolean delData(String id) {
		boolean b = false;
		SqlSession sqlSession = factory.openSession();
		
		try {
			SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);	//바뀐 부분
			
			int count = inter.delData(id);	//바뀐 부분
			
			if (count > 0)
				b = true;
			sqlSession.commit();

		} catch (Exception e) {
			System.out.println("deleteData err : " + e);
			sqlSession.rollback();

		} finally {
			if (sqlSession != null)
				sqlSession.close();

		}
		return b;
	}
	*/
}
