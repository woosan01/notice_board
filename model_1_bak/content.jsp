<%@ page language="java" contentType = "text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%> 
<!DOCTYPE jsp	public "-//W3C// DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4.dtd">
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
	<title>본격! 게시판 - 게시글 리스트</title>
</head>
	<%
	String idx = request.getParameter("idx");

	try {
	String driverName="com.mysql.jdbc.Driver";	
	String url="jdbc:mysql://localhost:3306/board?useUnicode=true&characterEncoding=UTF-8";
	//String id = "board";
	//String pwd = "board_4U";
	ResultSet rs = null;

	Class.forName(driverName);
	Connection conn = DriverManager.getConnection(url,"board","board_4U");

	Statement stmt = conn.createStatement();
	String sql = "select * from board where idx = " + idx;
	rs = stmt.executeQuery(sql);
	while(rs.next()){
	%>

<body>
	<h1>게시글 조회</h1>
 	  <table>
  	    <tr>
		<th>번호</th>
		<td><%=rs.getString("idx")%></td>
		
		<th>작성자</th>
		<td><%=rs.getString("writer")%></td>
		<th>날짜</th>
		<td><%=rs.getString("regdate")%></td>
		<th>조회수</th>
		<td><%=rs.getString("count")%></td>
	    </tr>
	    <tr>
		<th colspan="2">제목</th>
		<td colspan="6"><%=rs.getString("title")%></td>
	    </tr>
	    <tr>
		<th colspan="2">내용</th>
		<td colspan="6"><%=rs.getString("content")%></td>
	    </tr>
	
 	  </table>
	<a href="delete.jsp?idx=<%=rs.getString("idx")%>">게시글 삭제</a>
	<a href="index.jsp">목록</a>
<%
	}
	conn.close();
	
	}catch (Exception e) {
	   out.println("mysql Database Something Wrong. <hr>");
	   out.println(e.getMessage());
	   e.printStackTrace();
	}
%>
</body>
</html>
