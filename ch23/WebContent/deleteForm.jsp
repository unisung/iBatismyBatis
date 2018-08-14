<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	String id = request.getParameter("id");
    if(id!=null && !"".equals(id)){
       out.print("<script>");
       out.print("var isDel= confirm('삭제하시겠습니까?');");
       out.print("if(isDel==true){location.href='deletePro.jsp?id="+id+"';");
       out.print("}else{");
       out.print("history.back();}");
       out.print("</script>");
    }
%>
</head>
<body>

</body>
</html>