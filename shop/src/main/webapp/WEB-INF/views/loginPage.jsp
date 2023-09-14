<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>호신용품은 야막자</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <link href="../css/style1.css" rel="stylesheet" />
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="#!">Login</a></li>
                <li class="nav-item"><a class="nav-link" href="/signup">Sign Up</a></li>
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
                    <a href="/"><img src="../assets/img/logo.png" class="logo"></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <li class="nav-item"><a class="nav-link" href="#!">문의</a></li>
                    <li class="nav-item"><a class="nav-link" href="#!">뉴스</a></li>
                    <li class="nav-item"><a class="nav-link" href="/">상품</a></li>
                </ul>
            </div>
        </div>
    </div>
</section>
<header>
    <img src="../assets/img/banner.png" class="banner">
</header>
<!-- Login -->
<section class="py-5">
    <section class="py-4">
    </section>
    <div class="login">
        <h3>로그인</h3><br>
        <form action="/auth" method="post">
            <div class="textline">
                <input type="text" name="id" placeholder="ID" required="required" />
                <input type="password" name="password" placeholder="비밀번호" required="required" />
            </div><br>
            <div class="sociallogin">
                <button class="btn btn-block btn-large"><a href="/oauth2/authorization/google" type="button">구글로그인</a></button>
                <button class="btn btn-block btn-large"><a href="/oauth2/authorization/naver" type="button">네이버로그인</a></button>
                <button type="submit" class="btn btn-block btn-large">게스트 로그인</button>
            </div>
            <button type="submit" class="btn btn-primary btn-block btn-large">로그인</button>
            <hr>
            <button type="button" class="btn btn-block btn-large" onclick="location.href='signup'">회원가입</button>


        </form>
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
</body>
</html>
