<!-- insertPro.jsp -->

<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>City List</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

String cityName = request.getParameter("cityName");
String stLatitude = request.getParameter("latitude");
String stLongitude = request.getParameter("longitude");

double latitude = Double.parseDouble(stLatitude);
double longitude = Double.parseDouble(stLongitude);


Connection con = null; 
PreparedStatement pstmt = null; 
String DB_URL = System.getenv("db_url");
String DB_USER = System.getenv("db_user");
String DB_PASSWORD= System.getenv("db_password");

Class.forName("com.mysql.cj.jdbc.Driver");
con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

String sql = "INSERT INTO city (city_name, latitude, longitude) VALUES (?, ?, ?)";

pstmt = con.prepareStatement(sql);
pstmt.setString(1, cityName);
pstmt.setDouble(2, latitude);
pstmt.setDouble(3, longitude);

pstmt.executeUpdate();

pstmt.close();
con.close();
%>
<script>
alert("저장 성공!");
location.href = 'insertForm.jsp';
</script>
</body>
</html>
