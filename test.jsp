<%@ page import = "java.sql.*"%>
<!DOCTYPE jsp  public "-//W3C// DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4.dtd">
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Document</title>
</head>
<body>
<%
	Connection conn = null;

	PreparedStatement pstmt = null;

	ResultSet rs = null;

	try{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/board","board","board_4U");
	pstmt = conn.PreparedStatement("select * from board");

	rs= pstmt.executeQuery();
	while(rs.next()){

	}
	} catch (Exception e ) {
		e.printStackTrace();
	} finally {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if (conn != null) conn.close();
	}
%>
</body>
</html>

