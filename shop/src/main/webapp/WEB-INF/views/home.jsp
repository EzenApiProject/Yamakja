<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home</title>
</head>
<body>
    <h2>상품 목록</h2><a href="/login">로그인</a>
    <form id="f" method="post" enctype="multipart/form-data">
        상품 이름 : <input type="text" name="name" id="name"><br>
        상품 수량 : <input type="number" name="stock" id="stock"><br>
        상품 가격 : <input type="number" name="price" id="price"><br>
        <input type="hidden" name="fname" class="fname"><br>
        상품 사진 : <input type="file" id="uploadFile" name="uploadFile"><br>
    </form>
    <button id="btnInsert" class="insert">등록</button>
</body>
</html>