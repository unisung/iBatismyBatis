package dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import dto.DeptDTO;
import dto.EmpDTO;
import service.Empservice;

public class EmpDao implements Empservice{
	private static EmpDao instance;
	private static SqlSession session;
	//static 초기화
	static {
		try {
			  //db연결 설정파일 읽기(dbconnect.properties)
			  Reader reader = Resources.getResourceAsReader("config/configuration.xml");
			  //SqlSessionFactory만들기
			  SqlSessionFactory sessionFactory
			    = new SqlSessionFactoryBuilder().build(reader);
			  //session얻기
			  session = sessionFactory.openSession(true);//자동commit처리 openSession(true)
			  //자원해제
			  reader.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	private EmpDao() {}
	public static EmpDao getInstance() {
		if(instance==null) instance=new EmpDao();
		return instance;
	}



	///여러건 추출 메소드 selectList()
	@Override
	public List<EmpDTO> selectEmpAll() throws Exception {
		return session.selectList("Emp.selectAll");
	}

	@Override
	public EmpDTO selectEmp(int empno) throws Exception {
		return session.selectOne("selectEmpInfo", empno);
		
	}

	@Override
	public int insertEmp(EmpDTO emp) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateEmp(EmpDTO emp) throws Exception {
		return session.update("updateEmp", emp);
	}

	@Override
	public int deleteEmp(int empno) throws Exception {
		 return session.delete("deleteEmp", empno);
	}
	@Override
	public EmpDTO selectEmpInfo(int empno) throws Exception {
		return session.selectOne("selectEmpInfo", empno);
	}
	@Override
	public List<EmpDTO> selectManagerList() throws Exception {
		return session.selectList("selectManageList");
	}
	@Override
	public List<DeptDTO> selectDeptList() throws Exception {
		return session.selectList("selectDeptList");
	}
	@Override
	public int userCheck(String password) throws Exception {
		return session.selectOne("selectPrivs",password);
	}

}
