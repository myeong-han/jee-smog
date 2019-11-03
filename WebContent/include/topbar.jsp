<%@page import="com.exam.Tools"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String whatS = request.getParameter("what_s");
	String search = request.getParameter("search");
	
	if (search == null || search.equals("")) {
		search = "";
		whatS = "";
	}
%>
<div style="background-color: #222222; width: 300px; position: fixed; right: 30px; top: 50px; border-radius: 30px; text-align: center; border: solid 2px #AAAAAA;">
	<form name="sfrm" id="search-form" action="../content/searchAll.jsp" method="get" onsubmit="return checkSearch()" style="padding-left: 0px; margin-top: 12px; margin-bottom: 20px;">
		<select name="what_s" id="input-what">
<%
		if (whatS == null || whatS.equals("")) {
%>
			<option value="un" disabled selected>Search to</option>
			<option value="subject">Title</option>
			<option value="username">Writer</option>
<%
		} else {
%>
			<option value="un" disabled>Search to</option>
			<option value="subject" <%=whatS.equals("subject")?"selected":"" %>>Title</option>
			<option value="username" <%=whatS.equals("username")?"selected":"" %>>Writer</option>
<%
		}
%>
		</select>&nbsp;&nbsp;&nbsp;&nbsp;Search All <br />
		<input type="text" name="search" value="<%=search==null?"":search %>" class="input_box" />
		<button type="submit">Search</button>
	</form>
</div>