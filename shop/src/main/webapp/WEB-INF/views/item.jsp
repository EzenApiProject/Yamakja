<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=1200px, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>호신용품은 야막자</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <link href="../css/style1.css" rel="stylesheet" />
    <link href="../css/item.css" rel="stylesheet" />
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="/admin">Admin</a></li>
                <li class="nav-item"><a class="nav-link" href="/login">Login</a></li>
                <li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
                <li class="nav-item"><a class="nav-link" href="/myPage">My page</a></li>
                <li class="nav-item"><a class="nav-link" href="/cart"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart3" viewBox="0 0 16 16">
                    <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l.84 4.479 9.144-.459L13.89 4H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                </svg></a></li>
            </ul>
        </div>
    </div>
</nav>

<section class="menu">
    <div class="container2">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0" id="nav2">
                    <img src="../assets/img/logo.png" class="logo" onclick="location.href='/'">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <li class="nav-item"><a class="nav-link" href="/faq">문의</a></li>
                    <li class="nav-item"><a class="nav-link" href="/news">뉴스</a></li>
                    <li class="nav-item"><a class="nav-link" href="/">상품</a></li>
                </ul>
            </div>
        </div>
    </div>
</section>
<header>
    <img class="banner" src="../assets/img/banner.jpg"/>
</header>

<section class="category">
    <div class="select">
    </div>
    <div class="dropdown">
        <ul class="dropdown-menu">
        </ul>
    </div>
</section>

<div class="container px-4 px-lg-5 my-4 outline-div">
    <div class="row gx-4 gx-lg-5">
        <div class="col-md-6">
            <div class="">
                <img class="card-img-top mb-5 mb-md-0" src="${item.FPath}" alt="이미지 준비중.." />
            </div>
            <div class="small-images">
                <div class="outline-div2 small-images">
                    <img class="" src="${item.FPath}" height="100" alt="이미지 준비중.." />
                </div>
                <div class="outline-div2 small-images">
                    <img class="" src="${item.FPath}" height="100" alt="이미지 준비중.." />
                </div>
            </div>

        </div>

        <div class="col-md-6">
            <div class="itemname">
                <h4 class="display-6 fw-bolder itempage-text">${item.name}</h4>
            </div>
            <div class="itemprice ">
                <p class="lead itempage-text"><span style="font-weight: bold;">가격</span> : ${item.price} 원</p>
            </div>
            <div>
                <p class="lead itempage-text"><span style="font-weight: bold;">카테고리</span> : ${item.category}</p>
                <p class="lead itempage-text"><span style="font-weight: bold;">설명</span> : ${item.description}</p> <!-- 상품설명이 아래로 가야합니다! -->
            </div>

            <form action="/addCart/?itemId=${item.itemId}" class="d-flex" method="post">
                <div class="input-group">
                    <input class="form-control" name="quantity" id="quantity" type="num" value="1">
                    <button class="btn btn-outline-secondary" name="direct" type="submit" value="true">주문하기</button>
                    <button class="btn btn-outline-secondary" name="direct" type="submit" value="false">장바구니</button>
                </div>
            </form>
        </div>

    </div>
</div>



<section class="py-5 bg-light relateditems">
    <div class="container px-4 px-lg-5 mt-5">
        <h4 class="fw-bolder mb-4">관련 상품</h4>

        <div class="row gx-4 gx-lg-5 row-cols-3 row-cols-md-4 row-cols-md-5">

        <c:forEach var="item" items="${items}" begin="1" end="10">
            <div class="col mb-5">
                <div class="card">
                    <a href="/item/?itemId=${item.itemId}" style="text-decoration: none">
                        <!-- Product image-->
                        <img class="card-img-top" src="${item.FPath}" alt="..." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <p class="fw-bolder text-break">${item.name}</p>


                                <!-- 이후 new나 hot의 조건이 설정되면 변경-->
                                <c:choose>
                                    <c:when test="${item.itemId % 3 == 0}">
                                        <img src="../imgs/icon/hot_tag_icon.jpg" width="25">
                                    </c:when>
                                    <c:when test="${item.itemId % 2 == 0}">
                                        <img src="../imgs/icon/new_tag_icon.png" width="25">
                                    </c:when>
                                    <c:otherwise>
                                        <!-- 그 외의 경우 (홀수인 경우) 아무것도 출력되지 않음 -->
                                    </c:otherwise>
                                </c:choose>

                                <!-- Product price-->
                                    ${item.price}
                            </div>

                        </div>
                    </a>
                </div>
            </div>

            </c:forEach>
        </div>
            <div>
                <c:forEach var="comment" items="${itemComment}" begin="0" end="3">
                    <div class="row gx-4 gx-lg-5 outline-div2">
                        <div>
                            <p><span style="font-weight: bold">작성자</span> :
                            <c:out value="${comment.memberId}"></c:out> - <c:out value="${comment.createdAt}"></c:out></p>
                            <h2><c:out value="${comment.title}"></c:out>   </h2>
                            <hr>
                            <p><c:out value="${comment.comment}"></c:out></p>
                            <img src="${comment.FPath}" alt="..." width="200">
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
</section>
<!-- Footer-->
<footer class="py-5 bg-dark">
    <div class="container">
        <img class="footerlogo" src="../assets/img/logo.png">
        <p class="m-0 text-white">https://github.com/EzenApiProject</p>
        <p class="m-0 text-white">경기도 성남시 중원구 광명로 4 이젠아카데미</p>
    </div>
    <div class="map">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3168.1851849351115!2d127.12707597677145!3d37.432729831788144!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca883df7418d1%3A0xfdd9d220bb6a8e91!2z6rK96riw64-EIOyEseuCqOyLnCDspJHsm5Dqtawg6rSR66qF66GcIDQ!5e0!3m2!1sko!2skr!4v1694566071535!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<!-- Core theme JS-->
<script src="../js/scripts.js"></script>

<script>
    // JavaScript를 사용하여 quantity 값을 설정
    var itemQuantity = 10; // 원하는 수량으로 변경

    // quantity 값을 폼의 action 속성에 추가
    document.getElementById("cartForm").action = "/addCart/?itemId=${item.itemId};
        <%--document.getElementById("cartForm").action = "/addCart/?itemId=${item.itemId}&quantity=" + itemQuantity;--%>
</script>

</body>
</html>
