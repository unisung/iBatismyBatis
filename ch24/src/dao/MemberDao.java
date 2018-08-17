package dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import dto.MemberVO;
import service.MemberService;

/**
 * mybatis 메소드
 * 입력: session.insert() return int
 * 수정: session.update() return int
 * 삭제: session.delete() return int
 * 단건 조회 session.selectOne(id) return Object
 * 여러건 조회 session.selectList() return List
 * 
 * */
public class MemberDao implements MemberService{
	//초기화
	//SQLMapper생성
	private static SqlSession session;
	private static MemberDao instance;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("config/configuration.xml");
			SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(reader);
			//openSession(true)로 설정하면 자동 커밋 (setAutocommit(true))
			session=sf.openSession(true);/// 
			reader.close();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	 private MemberDao() {}
	public static MemberDao getInstance() {
		if(instance==null) instance=new MemberDao();
		return instance;
	}


	@Override
	public int insertMember(MemberVO member) throws Exception {
		return session.insert("insertMember", member);
	}

	@Override
	public int update(MemberVO member) throws Exception {
		return session.update("updateMemberInfo", member);
	}

	@Override
	public int delete(String id) throws Exception {
		return session.delete("deleteMember", id);
	}

	@Override
	public MemberVO getMemberInfo(String id) throws Exception {
		return session.selectOne("selectMemberInfo", id);
	}

	@Override
	public List<MemberVO> getMemberList() throws Exception {
	    return session.selectList("Member.selectAll");
	}

	@Override
	public int userCheck(String id, String password) throws Exception {
		 return password.equals(session.selectOne("selectPasswd", id)) ? 1:0;
	}
	@Override
	public int idCheck(String id) throws Exception {
		return session.selectOne("selectId", id);//auto-unboxing
	}

}
