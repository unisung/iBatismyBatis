package service;

import java.util.List;

import vo.MemberVO;

public interface MemberService {
	//회원가입
	public int insert(MemberVO member) throws Exception;
	//회원정보 수정
	public int update(MemberVO member) throws Exception;
	//회원탈퇴 
	public int delete(String id) throws Exception;
	//회원정보
	public MemberVO getMemberInfo(String id) throws Exception;
	//회원리스트
	public List<MemberVO> getMemberList() throws Exception;
	//회원 체크
	public int userCheck(String id,String password) throws Exception;

}
