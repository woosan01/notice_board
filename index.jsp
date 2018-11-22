<%@ page language="java" contentType = "text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%> 
<!DOCTYPE jsp	public "-//W3C// DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4.dtd">
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="com.board.bean.Board" %>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
	<title>본격! 게시판 - 게시글 리스트</title>
</head>

<%
	try {
	String driverName="com.mysql.jdbc.Driver";	
	String url="jdbc:mysql://localhost:3306/board?useUnicode=true&characterEncoding=UTF-8";
	//String id = "board";
	//String pwd = "board_4U";
	ResultSet rs = null;

	Class.forName(driverName);
	Connection conn = DriverManager.getConnection(url,"board","board_4U");

	Statement stmt = conn.createStatement();
	String sql = "select * from board order by idx desc";
	rs = stmt.executeQuery(sql);
	
	ArrayList<Board> articleList = new ArrayList<Board>();
	//이 코드는 Board형 배열형식으로 선언한 것.
		
	while (rs.next()){
		Board article = new Board();
		article.setIdx(rs.getInt("idx"));
		article.setTitle(rs.getString("title"));
		article.setWriter(rs.getString("writer"));
		article.setRegdate(rs.getString("regdate"));
		article.setCount(rs.getInt("count"));
		articleList.add(article);
	}
		request.setAttribute("articleList", articleList);
		conn.close();
	
		}catch (Exception e) {
		   out.println("mysql Database Something Wrong. <hr>");
		   out.println(e.getMessage());
		   e.printStackTrace();
		}
%>

<body>
	<h1>게시글 리스트</h1>
		<table>
			<tr>	
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>

		<c:forEach items="${articleList}" var = "article">
		 <tr style=text-align:center;>
		   <td>${article.idx}</td>
		   <td><a href='content.jsp?idx=${article.idx}'>${article.title}</a></td>
		   <td>${article.writer}</td>
		   <td>${article.regdate}</td>
		   <td>${article.count}</td>
		 </tr>
		</c:forEach>
       </table> 
	
	<a href="write.jsp">글쓰기</a>
	
</body>
</html>
