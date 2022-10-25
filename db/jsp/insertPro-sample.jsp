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
<!-- // POST 방식의 한글처리 -->
request.setCharacterEncoding("UTF-8");

<!-- // 파라미터 정보 가져오기 -->
String cityName = request.getParameter("cityName");
String stLatitude = request.getParameter("latitude");
String stLongitude = request.getParameter("longitude");

double latitude = Double.parseDouble(stLatitude);
double longitude = Double.parseDouble(stLongitude);


<!-- // JDBC 참조 변수 준비 -->
Connection con = null; 
PreparedStatement pstmt = null; 
<!-- String url = "jdbc:oracle:thin:@localhost:1521:xe"; -->
<!-- String user = "scott", pw = "tiger"; -->
String DB_URL = System.getenv("db_url");
String DB_USER = System.getenv("db_user");
String DB_PASSWORD= System.getenv("db_password");

<!-- // 1) JDBC 드라이버 로딩 -->
Class.forName("oracle.jdbc.OracleDriver");

<!-- // 2) DB연결(DB url, DB id, DB pw) -->
<!-- con = DriverManager.getConnection(url, user, pw); -->
con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

<!-- // 3) SQL문 준비 -->
<!-- String sql = "INSERT INTO sample (city_name, latitude, longitude) VALUES (?, ?, ?)"; -->
String sql = "INSERT INTO city (city_name, latitude, longitude) VALUES (?, ?, ?)";

pstmt = con.prepareStatement(sql);
pstmt.setString(1, cityName);
pstmt.setDouble(2, latitude);
pstmt.setDouble(3, longitude);

<!-- // 4) 실행 -->
pstmt.executeUpdate();

<!-- // JDBC 자원 닫기 -->
pstmt.close();
con.close();
%>
<script>
alert("저장 성공!");
location.href = 'insertForm.jsp';
</script>
</body>
</html>
