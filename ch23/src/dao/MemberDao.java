package dao;

import java.io.Reader;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import service.MemberService;
import vo.MemberVO;
/**
 * ibatis 메소드
 * 입력 insert(쿼리id,파라미터);
 * 수정 update(쿼리id,파라미터);
 * 삭제 delete(쿼리id,파라미터);
 * 1건 추출 queryForObject(쿼리id,파라미터);
 * 여러건 추출 queryForList(쿼리id[,파라미터])
 * 
 * */
public class MemberDao implements MemberService {
	 private static MemberDao instance;
	 private static SqlMapClient sqlMapper;
	 
	 static {
		 try {
			 Reader reader = 
					Resources.getResourceAsReader("SqlMapConfig.xml");
			 sqlMapper 
			     = SqlMapClientBuilder.buildSqlMapClient(reader);
			 reader.close();
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
	 }
	private MemberDao() {}
	public static MemberDao getInstance() {
		if(instance==null) instance=new MemberDao();
		return instance;
	}

	// sqlMapper.insert()의 리턴타입은 Object
	//ibatis에서 insert()실행 성공시 리턴값은 null
	//ibatis에서 update()실행 성공시는 int
	@Override
	public int insert(MemberVO member) throws Exception {
		  /*sqlMapper.insert("insert",member);*/
		  return sqlMapper.update("insert", member);
	}

	//회원 정보 수정
	@Override
	public int update(MemberVO member) throws Exception {
		return sqlMapper.update("updateMemberInfo", member);
	}

	@Override
	public int delete(String id) throws Exception {
		 return sqlMapper.delete("delete", id);
	}

	//단건(1건)의 객체를 추출하는 메소드 queryForObject(id,id)
	@Override
	public MemberVO getMemberInfo(String id) throws Exception {
		return (MemberVO) sqlMapper.queryForObject("selectInfo", id);
	}

	//1건 이상의 리스트 형식의 결과 추출 메소드 queryForList(id)
	@Override
	public List<MemberVO> getMemberList() throws Exception {
		return sqlMapper.queryForList("selectAll");
	}
	//사용자의 id,패스워드 확인 메소드
	@Override
	public int userCheck(String id, String password) throws Exception {
	return password.equals((String)sqlMapper.queryForObject("selectPass", id))?1:0;
	}

}
