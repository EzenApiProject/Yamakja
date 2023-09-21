<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tables - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3 mt-3" href="/"><img src="assets/img/yamakja.png" width="120"></a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="/admin">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>

                            <div class="sb-sidenav-menu-heading">Admin</div>
                            <!-- <a class="nav-link" href="charts.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Charts
                            </a> -->
                            <a class="nav-link" href="/orderAdmin">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                주문 관리
                            </a>
                            <a class="nav-link" href="/itemAdmin">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                상품 관리
                            </a>
                            <a class="nav-link" href="/memberAdmin">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                회원 관리
                            </a>
                            <a class="nav-link" href="/faqAdmin">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                고객 지원
                            </a>
                            <a class="nav-link" href="/newsAdmin">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                뉴스 관리
                            </a>
                        </div>
                    </div>

                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">주문 관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                            <li class="breadcrumb-item active">Tables</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                주문 관리 페이지입니다.
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div>
                                <div class="card-header">
                                    <i class="fas fa-table me-1"></i>
                                    주문 리스트 (전체)
                                </div>
<%--                                <div class="card-header" style="text-align: right;">--%>
<%--                                    <button type="button" class="btn btn-primary">선택 주문 배송 완료 처리</button>--%>
<%--                                </div>--%>
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>선택</th>
                                            <th>주문번호</th>
                                            <th>주문일시</th>
                                            <th>상품명</th>
                                            <th>수량</th>
                                            <th>상품 금액</th>
                                            <th>총금액</th>
                                            <th>주문자 ID</th>
                                            <th>주문상태</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>선택</th>
                                            <th>주문번호</th>
                                            <th>주문일시</th>
                                            <th>상품명</th>
                                            <th>수량</th>
                                            <th>상품 금액</th>
                                            <th>총금액</th>
                                            <th>주문자 ID</th>
                                            <th>주문상태</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach var="index" items="${orderlistAll}" varStatus="status">
                                        <tr>
                                            <td><input type="checkbox" name="selected[]" value="1"></td>
                                            <td>${index.orderId}</td>
                                            <td>${index.createdAt}</td>
                                            <td>${items[index.itemID].name}</td>
                                            <td>${items[index.itemID].price}</td>
                                            <td>${index.quantity}</td>
                                            <td>${items[index.itemID].price*index.quantity}</td>
                                            <td>${index.memberId}</td>
                                            <td>${index.status}</td>
                                        </tr>
                                        </c:forEach>


                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>

            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
