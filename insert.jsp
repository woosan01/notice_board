<%@ page language="java" contentType = "text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE jsp  public "-//W3C// DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4.dtd">
<html>
<head>
	<title>본격! 게시판 - 게시글 리스트</title>
</head>
	<%

	 String title = request.getParameter("title");
	 String writer = request.getParameter("writer");
	 String regdate= request.getParameter("regdate");
	 String content = request.getParameter("content");

	 Connection conn=null;
	 try{
		String jdbcUrl= "jdbc:mysql://localhost:3306/board" ;
		String dbId="board";
		String dbPass= "board_4U";
	 
		Class.forName( "com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
		out.println( "connect success");
		out.println(conn);
	  }catch(Exception e){
		   e.printStackTrace();
	  }

	 Statement stmt = conn.createStatement();
	 String sql = "select * from board";
	 stmt.excuteQuery(sql);
	 out.print(sql);
	%>
<body>
</body>
</html>
