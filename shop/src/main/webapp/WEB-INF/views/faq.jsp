<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="../css/style1.css" rel="stylesheet" />
</head>
<body>
<!--상단바-->
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
                    <li class="nav-item"><a class="nav-link" href="/itemList">상품</a></li>
                </ul>
            </div>
        </div>
    </div>
</section>

<!--                        상단바 끝-->
<!--                        배너-->
<header>
    <img src="../assets/img/banner.jpg" class="banner">
</header>

<!--banner 끝-->


<div class="container">
    <div class="signup">
        <div class="input-form-backgroud row">
            <div class="input-form col-md-12 mx-auto">
                <form class="validation-form" novalidate>


                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <div class="card mb-2">
                                    <div class="card-body">
                                        <table class="faqtable">
                                            <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>제목</th>
                                                <th>글쓴이</th>
                                                <th>작성시간</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td class="faqtitle">배송이 늦어지고 있어요</td>
                                                <td>kmj1022</td>
                                                <td>20230823</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td class="faqtitle">더 기다리게 하지 마세요.</td>
                                                <td>cms0208</td>
                                                <td>20230824</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td class="faqtitle">박스가 찢어진 상태로 왔습니다.</td>
                                                <td>cheolsu888</td>
                                                <td>20230825</td>
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td class="faqtitle">이미지와 너무 다른데요</td>
                                                <td>seoin2932</td>
                                                <td>20230827</td>
                                            </tr>
                                            <tr>
                                                <td>5</td>
                                                <td class="faqtitle">너클이 휘었습니다.</td>
                                                <td>nani948</td>
                                                <td>20230830</td>
                                            </tr>

                                            </tbody>
                                        </table>

                                    </div>
                                </div>
                            </div>
                        </main>
                    </div>


                    <section class="searchline px-4">
                        <div class="searchbar">
                            <input class="searchtext" type="text" placeholder="검색 내용">
                            <button class="searchbtn" type="button">검색</button>
                        </div>
                    </section>
                </form>
            </div>
        </div>
        <div class="input-form-backgroud row">
            <div class="input-form col-md-12 mx-auto">
                <div class="faqarea">
                    <h6>문의 남기기</h6>
                    <input class="faqareatitle" type="text" placeholder="제목">
                    <textarea class="faqareatext" placeholder="메세지를 남겨주세요.">
                        </textarea>
                    <button type="submit" class="faqareabtn">문의남기기</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!--footer-->

<footer class="bg-dark">
    <div class="container">
        <div class="footerinfo">
            <img class="footerlogo" src="../assets/img/logo.png">
            <p class="m-0 text-white">https://github.com/EzenApiProject</p>
            <p class="m-0 text-white">경기도 성남시 중원구 광명로 4 이젠아카데미</p>
        </div>
    </div>
    <div class="map">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3168.1851849351115!2d127.12707597677145!3d37.432729831788144!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca883df7418d1%3A0xfdd9d220bb6a8e91!2z6rK96riw64-EIOyEseuCqOyLnCDspJHsm5Dqtawg6rSR66qF66GcIDQ!5e0!3m2!1sko!2skr!4v1694566071535!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>
</footer>
</body>
</html>