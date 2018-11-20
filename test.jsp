<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.jsp.db.DBConn"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
          pageEncoding="UTF-8"%>

<%
          Connection conn = DBConn.getMysqlConnection();
          out.print("db connect info" + conn);

          //2. sql
          Statement stmt = conn.createStatement();

          String sql = "select * from board";
          stmt.excuteQuery(sql);

          //3. result var
          ResultSet rs = null;

          if (rs.next()){
          do{
          out.print("<br>");
          out.print(rs.getInt("idx")+ "<br>");
          out.print(rs.getString("title")+ "<br>");
          out.print(rs.getString("writer")+ "<br>");
          out.print(rs.getString("regdate")+ "<br>");
          out.print(rs.getInt("count")+ "<br>");
          out.print(rs.getString("content")+ "<br>");
        }while(rs.next());
        } else {
        out.print(" No Result ");
      }


%>