<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
</head>
<body>
<form action="/auth" method="post">
    <h2>로그인</h2>
    <div>
        <input type="text" name="id" placeholder="ID"/>
    </div>
    <div>
        <input type="password" name="password" placeholder="Password"/>
    </div>

    <button type="submit">로그인</button>
    <button type="button" onclick="location.href='signup'">회원가입</button>
    <a href="/oauth2/authorization/google" type="button">구글로그인</a>
    <a href="/oauth2/authorization/naver" type="button">네이버로그인</a>
</form>
</body>
</html>
