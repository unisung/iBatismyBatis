<%@page import="dao.EmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String eno = request.getParameter("eno");
    String password = request.getParameter("password");
    
    EmpDao dao = EmpDao.getInstance();
    //삭제 권한 여부 확인 메소드
    int result = dao.userCheck(password);
    //삭제 권한이 있을때
    if (result>0){
        out.print("<script>");
        out.print("var isDel=confirm('정말 삭제하시겠습니까?');");
        out.print("if(!isDel){");
        out.print("history.back();}");
        out.print("</script>");
        
        System.out.println("삭제");
    	result = dao.deleteEmp(Integer.parseInt(eno));
    	//사원정보 삭제 처리 결과 
    	if(result>0){//정상 삭제
    		out.print("<script>");
            out.print("alert('삭제 성공!');");
            out.print("location.href='empList.jsp';");
            out.print("</script>");	
    	}else{//실패인 경우
    		out.print("<script>");
            out.print("alert('삭제 실패 !');");
            out.print("location.href='empList.jsp';");
            out.print("</script>");
    	}
    }else{//권한이 없는 경우
    	out.print("<script>");
    	out.print("alert('권한이 없습니다.');");
    	out.print("location.href='empList.jsp';");
    	out.print("</script>");
    }
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>