<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
String[] keywords={"AJAX","AJAX 실전 프로그래밍","자바",
		         "자바 프로그래밍","자바서버 페이지","자바스터디","자바서비스","자바캔"};
public List<String> search(String keyword){
	List<String> result = new ArrayList<String>();
	keyword=keyword.toUpperCase();
	if(keyword==null||keyword.equals(""))
		return Collections.EMPTY_LIST;
	for(int i=0;i<keywords.length;i++){
		if(keywords[i].startsWith(keyword)){
			result.add(keywords[i]);
		}
	}
	return result;
}//search(String keyword) 메소드 끝.
%>
<%
	 request.setCharacterEncoding("utf-8");
	String keyword =  URLDecoder.decode(request.getParameter("keyword"),"utf-8");
	
	List<String> keywordList = search(keyword);
	out.print(keywordList.size());
	out.print("|");
	for(int i=0;i<keywordList.size();i++){
		String key = keywordList.get(i);
		out.print(key);
		if(i<keywordList.size()-1)
			out.print(",");
	}

%>