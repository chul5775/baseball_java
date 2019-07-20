package pack.business;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import pack.board.BoardBean;
import pack.board.BoardDto;

public interface SqlMapperInter {
	@Select("select a_id,a_pwd from admin_b where a_id=#{a_id} and a_pwd=#{a_pwd}")
	public boolean adminloginCheck(AdminBean bean);

	@Select("select * from guest_b order by g_point desc")		//MaBatis는 annotation을 가지고 있다.
	public List<GuestDto> selectDataAll();
	
	@Select("select * from shopboard")		//MaBatis는 annotation을 가지고 있다.
	public List<BoardDto> boardDataAll(int page, String stype, String sword);
	
	@Select("select * from guest_b where g_id=#{g_id}")
	public GuestDto selectDataPart(String id);
	
	@Select("select * from director where d_no=#{d_no}")
	public DirectorRDto directorDataPart(String no);

	@Update("update guest_b set g_point=g_point-100,g_ticket=g_ticket+1 where g_id=#{g_id}")
	public int ticketData(GuestBean guestBean);

	
	@Delete("delete from guest_b where g_id=#{g_id}")
	public int delData(GuestBean guestBean);
	
	@Delete("delete from director where d_no=#{d_no}")
	public int directdelData(DirectorRBean directorRBean);
	
	@Update("update guest_b set g_name=#{g_name}, g_pwd=#{g_pwd},g_birth=#{g_birth},g_address=#{g_address} where g_id=#{g_id}")
	public int upData(GuestBean guestBean);
	
	
	@Insert("insert into membertab values(#{id}, #{name}, #{passwd}, now())")
	public int insData(DataFormBean bean);

	@Select("select * from player where p_no=#{p_no}")
	public PlayerDto selectplayerDataPart(String no);
	   
	@Select("select * from player where p_no=#{p_no}")
	public PlayerDto playDataPart(String no);
	
	@Delete("delete from player where p_no=#{p_no}")
	public int playerdelData(PlayerFormBean playerFormBean);
	
	@Update("update director set d_name=#{d_name},d_pwd=#{d_pwd} where d_no=#{d_no}")
	public int direcotorupData(DirectorRBean directorRBean);
	
	@Update("update player set t_no=#{t_no},p_name=#{p_name},p_birth=#{p_birth},pos=#{pos},b_num=#{b_num} where p_no=#{p_no}")
	public int playerupData(PlayerFormBean playerFormBean);
	
	@Select("select count(*) from guest_b")
	public int totalG();
	@Select("select count(*) from director")
	public int totalD();
	@Select("select count(*) from player")
	public int totalP();
	
	//<------- 게시판 -------->
	
	
	@Select("select count(num) from shopboard")
	public int PagesuAll();
	
	@Select("select count(*) from shopboard")
	public int totalList();
		
	@Select("select * from shopboard order by gnum desc, onum asc")
	public List<BoardDto> getDataAll();
	
	@Select("select count(num) from shopboard WHERE title LIKE CONCAT('%',#{sword},'%')")
	public int PageBoardPart1(String sword);

	@Select("select count(num) from shopboard WHERE name LIKE CONCAT('%',#{sword},'%')")
	public int PageBoardPart2(String sword);
	
	@Select("select * from shopboard WHERE title LIKE CONCAT('%', #{sword}, '%')")
	public List<BoardDto> BoardDataPart1(String sword);

	@Select("select * from shopboard WHERE name LIKE CONCAT('%', #{sword}, '%')")
	public List<BoardDto> BoardDataPart2(String sword);
	
	@Select("select * from shopboard where num=#{num}")
	public BoardDto getData(String num);
	
	@Select("select max(num) from shopboard")
	public int currentGetMaxNum();
	
	@Select("select * from shopboard where num=?")
	public int getReplyData();
		
	@Insert("insert into shopboard values(#{num},#{name},#{pass},#{mail},#{title},#{cont},#{bip},#{bdate},#{readcnt},#{gnum},#{onum},#{nested})")
	public void saveData(BoardBean bean);
	
	@Insert("insert into shopboard values(#{num},#{name},#{pass},#{mail},#{title},#{cont},#{bip},#{bdate},#{readcnt},#{gnum},#{onum},#{nested})")
	public void saveReplyDate(BoardBean bean);
	
	@Update("update shopboard set readcnt=readcnt+1 where num=#{num}")
	public void updateReadcnt(String num);
	
	//<------- 여기까지 게시판 ------->
	
	
	//<----- 선수 정보 ----->
	
	// 한개만 검색 되었을때.
	@Select("select * from player WHERE pos =#{pos}")
	public List<PlayerDto> getDataPart1(String pos);
	
	@Select("select * from player WHERE p_name LIKE CONCAT('%',#{p_name},'%')")
	public List<PlayerDto> getDataPart2(String p_name);
	
	@Select("select * from player WHERE t_no=#{t_no}")
	public List<PlayerDto> getDataPart3(int t_no);
	
	//<----- 검색  처리 ----->
	
	// 두개 이상 검색 되었을때.
	@Select("select * from player WHERE t_no=#{t_no} and pos= #{pos}")
	public List<PlayerDto> getDataPart4(HashMap<String, Object> param);
	
	@Select("select * from player WHERE pos=#{pos} and p_name LIKE CONCAT('%',#{p_name},'%')")
	public List<PlayerDto> getDataPart5(HashMap<String, Object> param);
	
	@Select("select * from player WHERE t_no=#{t_no} and p_name LIKE CONCAT('%',#{p_name},'%')")
	public List<PlayerDto> getDataPart6(HashMap<String, Object> param);
	
	// 모두 입력되어 검색 되었을때
	@Select("select * from player WHERE t_no=#{t_no} and pos= #{pos} and p_name LIKE CONCAT('%',#{p_name},'%')")
	public List<PlayerDto> getDataPart7(HashMap<String, Object> param);
	
	// <----- 페이지 처리 ----->
	
	// 페이지 처리 - 1개만 입력 되었을때.
	@Select("select count(p_no) from player WHERE pos=#{pos}")
	public int PagesuPart1(String pos);

	@Select("select count(p_no) from player WHERE p_name LIKE CONCAT('%',#{p_name},'%')")
	public int PagesuPart2(String p_name);
	
	@Select("select count(t_no) from player WHERE t_no=#{t_no}")
	public int PagesuPart3(int t_no);
	
	//페이지 처리 - 2개 입력되었을때
	@Select("select count(t_no) form player WHERE t_no=#{t_no} and pos= #{pos}")
	public int PagesuPart4(HashMap<String, Object> param);
	
	@Select("select count(t_no) from player WHERE pos=#{pos} and p_name LIKE CONCAT('%',#{p_name},'%')")
	public int PagesuPart5(HashMap<String, Object> param);

	@Select("select count(t_no) from player WHERE t_no=#{t_no} and p_name LIKE CONCAT('%',#{p_name},'%')")
	public int PagesuPart6(HashMap<String, Object> param);
	
	//페이지 처리 - 모두 입력 되었을때.
	@Select("select * from player WHERE t_no=#{t_no} and pos= #{pos} and p_name LIKE CONCAT('%',#{p_name},'%')")
	public int PagesuPart7(HashMap<String, Object> param);
	
	//<------ 여기까지 선수 정보 ----->
	//<------- 감독정보 --------->
	@Select("select * from director inner join team on director.d_no = team.d_no;")		//MaBatis는 annotation을 가지고 있다.
	public List<DirectorDto> directorDataAll();
}


/*
 * 1. 먼저 Configuration.xml에서 Aliases로 지정해준 경로와 mappers
 * 2. annotation을 불러와서 Select, Insert, Update, Delete를 sql문으로 써준다. 
 */
