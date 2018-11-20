<%@ page language="java" contentType = "text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE jsp  public "-//W3C// DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4.dtd">
<html>
<head>
	<title>insert title here</title>
</head>
	<%

	 String title = request.getParameter("title");
	 String writer = request.getParameter("writer");
	 String regdate= request.getParameter("regdate");
	 String content = request.getParameter("content");

	 String driverName="com.mysql.jdbc.Driver";
	 String url = "jdbc:mysql://localhost:3306/board";
	 String id = "board";
	 String pwd ="board_4U";
	
	 try{
		//[1] JDBC 드라이버 로드
	 Class.forName(driverName);     
	 }catch(ClassNotFoundException e){
	        out.println("Where is your mysql jdbc driver?");
		e.printStackTrace();
		return;
	    }
	    out.println("mysql jdbc Driver registered!!");
	   
	    //[2]데이타베이스 연결 
	    Connection conn = DriverManager.getConnection(url,id,pwd);
	    Statement stmt = conn.createStatement();
	    String sql = "INSERT INTO board(title,writer,regdate,count,content) values('"+title+"','"+writer+"','"+regdate+"',1,'"+content+"')";
	    int r = stmt.executeUpdate(sql);
	     
	    if(r == 1){
		out.println("1개의 데이터가 추가되었습니다.");
	    }
	    //[3]데이타베이스 연결 해제
	stmt.close();
	conn.close();
	%>
<body>
</body>
</html>
