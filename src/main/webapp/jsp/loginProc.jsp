<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="vada.util.ConnectionManager"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String userid = "test1";
	String userpw = "pw";
	
	Connection conn = ConnectionManager.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from user where userid = ? and userpw = ?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		pstmt.setString(2, userpw);
	
		rs = pstmt.executeQuery();
	
		if (rs.next()) {
	
			String dbuserid = rs.getString("userid");
			String dbuserpw = rs.getString("userpw");
			String dbnickname = rs.getString("nickname");
	
			session.setAttribute("userid", userid);
			session.setAttribute("nickname", dbnickname);
	
			if (userid.equals(dbuserid) && userpw.equals(dbuserpw)) {
		out.print("로그인 성공");
		response.sendRedirect("mainForm.jsp");
			}
	
			else {
		out.print("로그인 실패");
			}
	
		} else {
			out.print("db에 데이터 없음 ");
		}
	
	} catch (Exception ex) {
		ex.printStackTrace();
		out.print("Exception 발생");
	} finally {
		try {
			if (conn != null)
		conn.close();
			if (pstmt != null)
		pstmt.close();
			if (rs != null)
		rs.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
%>