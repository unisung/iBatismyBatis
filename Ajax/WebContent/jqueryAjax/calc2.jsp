<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int v1 = Integer.parseInt(request.getParameter("v1"));
    int v2 = Integer.parseInt(request.getParameter("v2"));
    String op = request.getParameter("op");
    switch(op){
    case "sum":
    	 out.print("{\"v1\":"+v1+",\"v2\":"+v2+",\"op\":"+"\"+\""+",\"result\":"+(v1+v2)+"}");
    		break;
    case "minus": 
    	out.print("{\"v1\":"+v1+",\"v2\":"+v2+",\"op\":"+"\"-\""+",\"result\":"+(v1-v2)+"}");
    	break;
    case "mul": 
    	out.print("{\"v1\":"+v1+",\"v2\":"+v2+",\"op\":"+"\"x\""+",\"result\":"+(v1*v2)+"}");
    	break;
    case "div": 
    	out.print("{\"v1\":"+v1+",\"v2\":"+v2+",\"op\":"+"\"/\""+",\"result\":"+((double)v1/v2)+"}");
    	break;
    }
%>