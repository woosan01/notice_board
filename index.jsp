<%@ page language="java" contentType = "text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE jsp	public "-//W3C// DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4.dtd">
<% request.setCharacterEncoding("utf-8"); %>
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
	out.println("Database Connection success.");

	Statement stmt = conn.createStatement();
	String sql = "select * from board order by idx desc");
	rs = stmt.executeQuery(sql);
	
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
			<tr>
				<td><%=idx %></td>
				<td><%=title %></td>
				<td><%=writer %></td>
				<td><%=regdate %></td>
				<td><%=count %></td>
			</tr>
<%
	while(rs.next()){
	   out.print("<tr>");
	   out.print("<td>" + rs.getString(1) + "</td>");
	   out.print("<td>" + rs.getString(2) +"</td>");
	   out.print("<td>" + rs.getString(3) + "</td>");
	   out.print("<td>" + rs.getString(4) + "</td>");
	   out.print("<td>" + rs.getString(5) + "</td>");
	   out.print("</tr>"); 
	}
%>
		</table>
		<a href="write.jsp">글쓰기</a>
<%
	conn.close();
	
	}catch (Exception e) {
	   out.println("mysql Database Something Wrong. <hr>");
	   out.println(e.getMessage());
	   e.printStackTrace();
	}
%>
</body>
</html>
