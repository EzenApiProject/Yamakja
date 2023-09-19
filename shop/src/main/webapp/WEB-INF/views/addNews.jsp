<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>addNews</title>
</head>
<body>
<h2>뉴스 추가</h2>
<form action="/addNews" method="post" enctype="multipart/form-data">
    뉴스 이름 : <input type="text" name="title"><br>
    뉴스 내용 : <textarea name="content"></textarea><br>
    뉴스 URL : <input type="text" name="url"><br>
    상품 사진 : <input type="file" id="file" name="file"><br>
    <button id="btnInsert" class="insert" type="submit">등록</button>
</form>
</body>
</html>