<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Shop Homepage - Start Bootstrap Template</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />

    <style>
        img{
            width:500px;
            height:300px;
        }
    </style>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="#!">Start Bootstrap</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">All Products</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                        <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                    </ul>
                </li>
            </ul>
            <form class="d-flex">
                <button class="btn btn-outline-dark" type="submit">
                    <i class="bi-cart-fill me-1"></i>
                    Cart
                    <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                </button>
            </form>
        </div>
    </div>
</nav>
<!-- Header-->
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">Shop in style</h1>
            <p class="lead fw-normal text-white-50 mb-0">With this shop hompeage template</p>
        </div>
    </div>
</header>
<!-- Section-->
<%--<section class="py-5">--%>
<%--    <div class="container px-4 px-lg-5 mt-5">--%>
<%--        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">--%>
<%--            <c:forEach var="item" items="${carts}">--%>
<%--                <div class="col mb-5" onclick="location.href='/item/?itemId=${item.itemId}'">--%>
<%--                    <div class="card h-100">--%>
<%--                        <!-- Product image-->--%>
<%--                        <img class="card-img-top" src="${item.FPath}" alt="죄송합니다 이미지 준비중입니다." />--%>
<%--                        <!-- Product details-->--%>
<%--                        <div class="card-body p-4">--%>
<%--                            <div class="text-center">--%>
<%--                                <!-- Product name-->--%>
<%--                                <h5 class="fw-bolder">${item.name}</h5>--%>
<%--                                <!-- Product price-->--%>
<%--                                ${item.price}원--%>
<%--                                ${item.quantity}개--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <!-- Product actions-->--%>
<%--                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">--%>
<%--                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </c:forEach>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>

<div class="card mb-4">
    <div>
        <div class="card-header">
            <i class="fas fa-table me-1"></i>
            장바구니
        </div>
    </div>

    <table class="table">
        <thead>
        <tr>
            <th>선택</th>
            <th>이미지</th>
            <th>상품명</th>
            <th>가격</th>
            <th>수량</th>
            <th>결제금액</th>
            <th>카트에서 제거</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${carts}">
            <tr>
                <td><input type="checkbox" name="check" id="check" class="checkbox"></td>
                <td>
                    <div style="text-align: left;">
                        <a href="item/?itemId=${item.itemId}">
                            <img src="${item.FPath}" style="width: 100px; height: auto">
                        </a>
                    </div>
                </td>

                <td>
                    <a href="item/?itemId=${item.itemId}">
                            ${item.name}
                    </a>
                </td>
                <td>${item.price}</td>
                <td>${item.quantity}</td>
                <td>${item.price*item.quantity}</td>
                <td><button class="mb-3 btn-danger">제거</button></td>
            </tr>

        </c:forEach>

        </tbody>
    </table>

    <div>
        <div style="text-align: center;">
            <button type="button">
            장바구니 비우기
            </button>
        </div>
        <div class="card-header" style="text-align: right;">
            선택 물품 합계 가격: <span id="total">0</span>
        </div>
        <div class="card-header" style="text-align: right;">
            <button type="button" class="btn btn-primary">
            선택 물품 주문하기
            </button>
        </div>
    </div>

</div>


<!-- Footer-->
<footer class="py-5 bg-dark">
    <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="../js/scripts.js"></script>
<script>
    // 체크된 행의 세 번째 컬럼값 더하기
    function calculateTotal() {
        var checkboxes = document.querySelectorAll('.checkbox');
        var total = 0;

        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
                var row = checkboxes[i].parentNode.parentNode;
                var cell = row.cells[5]; // 세 번째 컬럼 (0부터 시작)
                total += parseInt(cell.innerText);
            }
        }

        // 결과를 화면에 표시
        document.getElementById('total').textContent = total;
    }

    // 체크박스가 변경될 때마다 합계를 다시 계산
    var checkboxes = document.querySelectorAll('.checkbox');
    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].addEventListener('change', calculateTotal);
    }
</script>
</body>
</html>

