<%@page import="java.io.File"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String filePath = request.getParameter("filePath");
	File file = new File(filePath);
%>
<%=file.length()*1024%>