<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>리뷰 추가</title>
</head>
<body>
<h2>상품 목록</h2>
<form action="/addComments" method="post" enctype="multipart/form-data">
    제목 : <input type="text" name="title"><br>
    내용 : <input type="text" name="comment"><br>
    사진업로드 <input type="file" name="file"><br>
    <input type="hidden" name="memberId" value="${member}">
    <input type="hidden" name="itemId" value="${itemId}">
    <div class="input-group mb-5">
        <label class="input-group-text" for="inputGroupSelect01">별점</label>
        <select class="form-select" id="inputGroupSelect01" name="star" type="number">
            <option selected>-----선택하기-----</option>
            <option value=1>⭐</option>
            <option value=2>⭐⭐</option>
            <option value=3>⭐⭐⭐</option>
            <option value=4>⭐⭐⭐⭐</option>
            <option value=5>⭐⭐⭐⭐⭐</option>
        </select>
    </div>
    <button id="btnInsert" class="insert" type="submit">등록</button>
</form>
</body>
</html>