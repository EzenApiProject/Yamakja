<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>결제</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
    <!-- for payments -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-2.2.4.min.js"
            integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
            crossorigin="anonymous">
    </script>
    <style>
        img{
            width:200px;
            height:200px;
        }
    </style>
</head>
<body>
<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:forEach var="item" items="${carts}">
                <div class="col mb-5" onclick="location.href='/item/?itemId=${item.itemId}'">
                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="${item.FPath}" alt="죄송합니다 이미지 준비중입니다." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">${item.name}</h5>
                                <!-- Product price-->
                                    ${item.price}원
                                    ${item.quantity}개
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="col mb-5">
            <h1>총 가격 : ${total}</h1>
            <button class="btn-primary" onclick="requestPay()">결제하기</button>
        </div>
    </div>
</section>

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
