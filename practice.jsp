<%@ page language="java" contentType = "text/html; charset=utf-8"
pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>본격! 게시판 - 게시글 리스트</title>
</head>
	<%
		request.setCharacterEncoding("euc-kr");
		
		int idx = 1;
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String regdate = request.getParameter("regdate");
		int count = 100000;
		String content = request.getParameter("content");
	%>
<body>
	<h1>게시글 리스트</h1>
		<table>
			<tr>
				<th style="color: red">번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
				<td><%= idx %></td>
				<td><%= title %></td>	
				<td><%= writer %></td>
				<td><%= regdate %></td>
				<td><%= count %></td>
		</table>
		<a href="write.jsp">글쓰기</a>
</body>
</html>