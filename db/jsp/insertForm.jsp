<!-- insertForm.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>City Location</title>
</head>
<body>
<h1>도시 입력</h1>
<form action="insertPro.jsp" method="post">
도시 이름: <input type="text" name="cityName" ><br /><br />
위도: <input type="text" name="latitude" ><br />
경도: <input type="text" name="longitude" ><br /><br />
<button type="submit">저장</button>
</form>
</body>
</html>
