<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="dao.EmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
    String password = request.getParameter("password");
    String sDate = request.getParameter("hiredate");
    
    System.out.println("sDate="+sDate);
    
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date date = sdf.parse(sDate);
    
    java.sql.Date newDate = new java.sql.Date(date.getTime());
   
    System.out.println("newDate="+newDate.toString());
%>
<jsp:useBean id="emp" class="dto.EmpDTO">
<jsp:setProperty name="emp" property="eno" param="eno"/>
<jsp:setProperty name="emp" property="ename" param="ename"/>
<jsp:setProperty name="emp" property="manager" param="manager"/>
<jsp:setProperty name="emp" property="salary" param="salary"/>
<jsp:setProperty name="emp" property="commission" param="commission"/>
<jsp:setProperty name="emp" property="dno" param="dno"/>
<jsp:setProperty name="emp" property="job" param="job"/>
</jsp:useBean>
<%
	emp.setHiredate(newDate);	

    System.out.println("eno="+emp.getEno());
    System.out.println("ename="+emp.getEname());
    System.out.println("dno="+emp.getDno());
    System.out.println("jbo="+emp.getJob());

    EmpDao dao = EmpDao.getInstance();
    int result = dao.userCheck(password);
    
    if(result>0){
      	if(dao.insertEmp(emp)>0){
      		out.print("<script>");
      		out.print("alert('등록 성공');");
      		out.print("location.href='empList.jsp';");
      		out.print("</script>");
      	}else{
      		out.print("<script>");
        	out.print("alert('등록 중 문제가 발생하였습니다.');");
        	out.print("history.back();");
        	out.print("</script>");
      	}
    }else{
    	out.print("<script>");
    	out.print("alert('권한이 없습니다.');");
    	out.print("history.back();");
    	out.print("</script>");
    }
    

%>
