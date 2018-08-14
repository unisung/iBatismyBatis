package service;

import java.util.List;
import dto.DeptDTO;
import dto.EmpDTO;

public interface Empservice {
	List<EmpDTO> selectEmpAll() throws Exception;
	EmpDTO selectEmp(int empno) throws Exception;
	EmpDTO selectEmpInfo(int empno) throws Exception;
	int insertEmp(EmpDTO emp) throws Exception;
	int updateEmp(EmpDTO emp) throws Exception;
	int deleteEmp(int empno) throws Exception;
	List<EmpDTO> selectManagerList() throws Exception;
	List<DeptDTO> selectDeptList() throws Exception;
	int userCheck(String password) throws Exception;
	

}