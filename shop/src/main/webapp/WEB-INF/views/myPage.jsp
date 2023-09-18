<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home</title>
</head>
<body>
<h2>${member.name}님의 회원 정보</h2>

<p>name: ${member.name}</p>
<p>email: ${member.email}</p>
<p>password: ${member.password}</p>
<p>address: ${member.address}</p>
<p>phone: ${member.phone}</p>

<button type="button" onclick="location.href='update'">수정하기</button>

<form action="/logout" method="post">
    <button type="submit">로그아웃</button>
</form>

<form action="/delete" method="post">
    <button type="submit">탈퇴하기</button>
</form>

<c:forEach var="index" items="${orderIndex}" varStatus="status">
    <h3><c:out value="${index.orderId}"></c:out> </h3>
    <h3><c:out value="${index.status}"></c:out> </h3>
    <h3><c:out value="${index.createdAt}"></c:out> </h3>
    <img src="${orderItem[status.index].FPath}" alt="..."/>
    <p><c:out value="${orderItem[status.index].name}"></c:out> </p>
    <p><c:out value="${orderItem[status.index].category}"></c:out> </p>
    <p><c:out value="${orderItem[status.index].price}"></c:out> </p>
    <p><c:out value="${index.quantity}"></c:out> </p>
    <a href="/addComments/?itemId=${orderItem[status.index].itemId}"><button> 리뷰달기</button></a>
</c:forEach>
</body>
</html>