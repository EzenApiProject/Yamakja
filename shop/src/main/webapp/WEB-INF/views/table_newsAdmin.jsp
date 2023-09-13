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
            <a class="navbar-brand ps-3" href="/"><img src="assets/img/yamakja.png" width="120"></a>
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
                            <!-- <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Layouts
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="layout-static.html">Static Navigation</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">Light Sidenav</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                Pages
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        Authentication
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="login.html">Login</a>
                                            <a class="nav-link" href="register.html">Register</a>
                                            <a class="nav-link" href="password.html">Forgot Password</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        Error
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="401.html">401 Page</a>
                                            <a class="nav-link" href="404.html">404 Page</a>
                                            <a class="nav-link" href="500.html">500 Page</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div> -->
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
                    <!-- <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
                    </div> -->
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">뉴스 관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="dashboard.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">Tables</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                뉴스 관리 페이지입니다.
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div>
                                <div class="card-header">
                                    <i class="fas fa-table me-1"></i>
                                    뉴스 리스트
                                </div>
                                <div class="card-header" style="text-align: right;">
                                    <button type="button" class="btn btn-primary">뉴스 등록</button>
                                </div>
                            </div>
                            
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>뉴스ID</th>
                                            <th>제목</th>
                                            <th>본문 일부</th>
                                            <th>섬네일 이미지</th>
                                            <th>url</th>
                                            <th>등록날짜</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>뉴스ID</th>
                                            <th>제목</th>
                                            <th>본문 일부</th>
                                            <th>섬네일 이미지</th>
                                            <th>url</th>
                                            <th>등록날짜</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <th>1</th>
                                            <th>동네가 흉흉하다</th>
                                            <th>현재 살고 있는 이 곳이 과연 안전할까요?</th>
                                            <th>
                                                <div style="text-align : center;">
                                                    <img src="assets/img/otherimage2.jpg" width="50"></th>
                                                </div>
                                            <th>www.news.com/1.html</th>
                                            <th>20230723</th>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>자신의 몸은 자신이 지켜야 한다.</td>
                                            <td>경찰이 신고 이후 도착하는 시간은 평균 5분이며, 길면...</td>
                                            <td>
                                            <div style="text-align : center;">
                                                <img src="assets/img/otherimage3.jpg" width="50"></td>
                                            </div>
                                            </td>
                                            <td>www.news.com/2.html</td>
                                            <td>20230724</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>지하철역 근처에 있는 우범지역</td>
                                            <td>지하철역 입구에서 채 100미터도 떨어지지 않은 곳에...</td>
                                            <td>
                                            <div style="text-align : center;">
                                                <img src="assets/img/otherimage4.jpg" width="50"></td>
                                            </div>
                                            </td>
                                            <td>www.news.com/3.html</td>
                                            <td>20230726</td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td>도대체 행안부는 무엇을 하고 있는가?</td>
                                            <td>우리의 안전을 지키는 역할을 하는 정부부처의...</td>
                                            <td>
                                            <div style="text-align : center;">
                                                <img src="assets/img/otherimage5.jpg" width="50"></td>
                                            </div>
                                            </td>
                                            <td>www.news.com/4.html</td>
                                            <td>20230728</td>
                                        </tr>
                                        <tr>
                                            <td>5</td>
                                            <td>대항하지 말고 우선 도망쳐라.</td>
                                            <td>갑작스런 상황, 이런 경우 패닉 상태에 빠져...</td>
                                            <td>
                                            <div style="text-align : center;">
                                                <img src="assets/img/otherimage6.jpg" width="50"></td>
                                            </div>
                                            </td>
                                            <td>www.news.com/5.html</td>
                                            <td>20230730</td>
                                        </tr>
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <!-- <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; yamakja 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer> -->
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
