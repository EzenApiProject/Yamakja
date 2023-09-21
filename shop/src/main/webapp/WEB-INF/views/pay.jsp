<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <link href="css/style1.css" rel="stylesheet" />
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
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
                    <li class="nav-item"><a class="nav-link" href="#!">문의</a></li>
                    <li class="nav-item"><a class="nav-link" href="/news">뉴스</a></li>
                    <li class="nav-item"><a class="nav-link" href="/itemList">상품</a></li>
                </ul>
            </div>
        </div>
    </div>
</section>
<header>
    <img src="../assets/img/banner.jpg" class="banner">
</header>


<div class="buytotal">
    <div class="container">
        <div class="buyinfo">
            <div class="input-form-backgroud row">
                <div class="input-form col-md-12 mx-auto">
                    <form class="validation-form" novalidate>
                        <section class="id-section">
                            <div class="buytext">
                                <h5>배송 정보</h5>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="name">이름</label>
                                <input type="text" class="form-control" id="name" placeholder="" value="" required>
                                <div class="invalid-feedback">
                                    이름을 입력해주세요.
                                </div>
                            </div>

                            <div class="col-md-3 mb-3">
                                <label for="phone">연락처</label>
                                <input type="text" class="form-control" id="phone" placeholder="" value="" required>
                                <div class="invalid-feedback">
                                    연락처를 입력해주세요.
                                </div>
                            </div>
                        </section>





                        <section class="info-section">
                            <div class="buytext">
                                <h5>배송 주소</h5>
                            </div>
                            <div class="col-md-8 mb-3">
                                <label for="address">주소</label>
                                <input type="text" class="form-control" id="address" placeholder="" required>
                                <div class="invalid-feedback">
                                    주소를 입력해주세요.
                                </div>
                            </div>

                            <div class="col-md-3 mb-3">
                                <label for="postal">우편번호</label>
                                <input type="text" class="form-control" id="postal" placeholder="" value="" required>
                                <div class="invalid-feedback">
                                    우편번호를 입력해주세요.
                                </div>
                            </div>
                        </section>
                        <section class="info-section">
                            <div class="buytext">
                                <h5>배송 메시지</h5>
                            </div>
                            <div class="col mb-3">
                                <label for="message">배송 메시지</label>
                                <input type="text" class="form-control" id="message" placeholder="">
                            </div>
                        </section>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- cart -->
    <section class="buyfinal">
        <table>
            <thead>
            <tr class="tabletop">
                <td></td>
                <td><p>제품명</p></td>
                <td><p>가격</p></td>
                <td><p>수량</p></td>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${carts}">
                <tr class="cart__list__detail">
                    <td><img class="cart-image" src="${item.FPath}" alt="이미지 준비중.."></td>
                    <td><p>${item.name}</p>
                    </td>
                    <td class="cart__list__option">
                        <p>${item.price}</p>
                    </td>
                    <td>
                        <p>${item.quantity}</p>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="totalamount"><h3>총 결제금액</h3></div>
        <div class="amount"><p>${total}</p></div>
        <div class="amountbtn">
            <div class="buy__mainbtns">
                <button class="order" onclick="requestPay()">결제하기</button>
            </div>
        </div>
    </section>
</div>
<!-- Footer-->
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
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<script>
    var IMP = window.IMP;
    IMP.init("imp41653616");

    function requestPay() {
        alert("토스 결제창만 띄우게 했습니다. 실결제는 구현이 안되있으니 확인하시고 닫아주시면 진행됩니다");
        IMP.request_pay({
            pg: "tosstest",
            pay_method: "tosspay",
            merchant_uid: "1234578",
            name: "야막자",
            amount: ${total},
            buyer_email: "${member.email}",
            buyer_name: "${member.name}",
            buyer_tel: "010-7762-3889",
            buyer_addr: "경기도 성남시",
            buyer_postcode: "01181"
        },function(){
            window.location.href="/addOrder";
        });
    }
</script>
</body>
</html>
