<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String[] str={"월요일","덥다","오후","졸려","그냥"};
    for(int i=0;i<str.length;i++){
    	if(i==0)out.print("<b>");
    	out.print(str[i]+"<br>");
    	if(i==0)out.print("</b>");
    }
%>
</body>
</html>