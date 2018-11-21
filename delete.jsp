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

	Class.forName(driverName);
	Connection conn = DriverManager.getConnection(url,"board","board_4U");

	Statement stmt = conn.createStatement();
	String sql = "delete from board where idx = " + idx;
	stmt.executeUpdate(sql);
	out.println("삭제되었다.");
		
	conn.close();
	
	}catch (Exception e) {
	   out.println("mysql Database Something Wrong. <hr>");
	   out.println(e.getMessage());
	   e.printStackTrace();
	}
%>
  <script>
	alert("게시글이 삭제 되었습니다.");
	location.href = "index.jsp";
  </script>
</body>
</html>
