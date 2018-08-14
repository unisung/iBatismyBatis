<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="vo.MemberVO">
<jsp:setProperty name="member" property="*"/>
</jsp:useBean>
<%
   /*  System.out.println("id="+member.getId());
    System.out.println("password="+member.getPassword()); */
    
	MemberDao dao = MemberDao.getInstance();
    int result = dao.userCheck(member.getId(),member.getPassword());

     if(result>0){
        result = dao.update(member);
	    if(result>0){
	    	response.sendRedirect("list.jsp");
	    }else{
	    	out.print("<script>");
	    	out.print("alert('입력 실패');");
	    	out.print("history.back();");
	    	out.print("</script>");
	    }
    }else{
    	out.print("<script>");
    	out.print("alert('입력한 비밀번호가 다릅니다.');");
    	out.print("history.back();");
    	out.print("</script>");
    } 
%>
</body>
</html>