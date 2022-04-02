<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- Body -->
    <!-- 메인 넣는곳! 아래 지우고 작성하시면 됩니다!-->
    <link rel="stylesheet" href="css/front_css/theme.min.css">

    <!-- Body -->
    <!-- ========== MAIN CONTENT ========== -->
    <main id="content" role="main" class="bg-light">
        <!-- Breadcrumb -->
        <div class="navbar-dark bg-dark" style="background-image: url(./assets/svg/components/wave-pattern-light.svg);">
            <div class="container content-space-1 content-space-b-lg-3">
                <div class="row align-items-center">
                    <div class="col">
                        <div class="d-none d-lg-block">
                            <h1 class="h2 text-white">Personal info</h1>
                        </div>

                        <!-- Breadcrumb -->
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb breadcrumb-light mb-0">
                                <li class="breadcrumb-item">Account</li>
                                <li class="breadcrumb-item active" aria-current="page">Personal Info</li>
                            </ol>
                        </nav>
                        <!-- End Breadcrumb -->
                    </div>
                    <!-- End Col -->

                    <div class="col-auto">
                        <div class="d-none d-lg-block">
                            <a class="btn btn-soft-light btn-sm" href="#">Log out</a>
                        </div>

                        <!-- Responsive Toggle Button -->
                        <button class="navbar-toggler d-lg-none" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarNav" aria-controls="sidebarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-default">
                  <i class="bi-list"></i>
                </span>
                <span class="navbar-toggler-toggled">
                  <i class="bi-x"></i>
                </span>
              </button>
                        <!-- End Responsive Toggle Button -->
                    </div>
                    <!-- End Col -->
                </div>
                <!-- End Row -->
            </div>
        </div>
        <!-- End Breadcrumb -->

        <!-- Content -->
        <div class="container content-space-1 content-space-t-lg-0 content-space-b-lg-2 mt-lg-n10">
            <div class="row">
                <div class="col-lg-3">
                    <!-- Navbar -->
                    <div class="navbar-expand-lg navbar-light">
                        <div id="sidebarNav" class="collapse navbar-collapse navbar-vertical">
                            <!-- Card -->
                            <div class="card flex-grow-1 mb-5">
                                <div class="card-body">
                                    <!-- Avatar -->
                                    <div class="d-none d-lg-block text-center mb-5">
                                        <div class="avatar avatar-xxl avatar-circle mb-3">
                                            <img class="avatar-img" src="img/photo/photo-1426122402199-be02db90eb90.jpg" alt="Image Description">
                                            <!-- <img class="avatar-status avatar-lg-status" src="./assets/svg/illustrations/top-vendor.svg" alt="Image Description" data-bs-toggle="tooltip" data-bs-placement="top" title="Verified user"> -->
                                        </div>

                                        <h4 class="card-title mb-0">Natalie Curtis</h4>
                                        <p class="card-text small">natalie@example.com</p>
                                    </div>
                                    <!-- End Avatar -->

                                    <!-- Nav -->
                                    <span class="text-cap">Account</span>

                                    <!-- List -->
                                    <ul class="nav nav-sm nav-tabs nav-vertical mb-4">
                                        <li class="nav-item">
                                            <a class="nav-link active" href="./account-overview.html">
                                                <i class="bi-person-badge nav-icon"></i> Personal info
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link " href="./account-security.html">
                                                <i class="bi-shield-shaded nav-icon"></i> Security
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link " href="./account-notifications.html">
                                                <i class="bi-bell nav-icon"></i> Notifications
                                                <span class="badge bg-soft-dark text-dark rounded-pill nav-link-badge">1</span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link " href="./account-preferences.html">
                                                <i class="bi-sliders nav-icon"></i> Preferences
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link " href="./account-preferences.html">
                                                <i class="bi-sliders nav-icon"></i> 회원 탈퇴
                                            </a>
                                        </li>
                                    </ul>
                                    <!-- End List -->

                                    <span class="text-cap">MY ROAD</span>

                                    <!-- List -->
                                    <ul class="nav nav-sm nav-tabs nav-vertical mb-4">
                                        <li class="nav-item">
                                            <a class="nav-link " href="./account-orders.html">
                                                <i class="bi-basket nav-icon"></i> Your orders
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link " href="./account-wishlist.html">
                                                <i class="bi-heart nav-icon"></i> Wishlist
                                                <span class="badge bg-soft-dark text-dark rounded-pill nav-link-badge">2</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <!-- End List -->


                                    <div class="d-lg-none">
                                        <div class="dropdown-divider"></div>


                                    </div>
                                    <!-- End Nav -->

                                </div>
                            </div>
                            <!-- End Card -->
                        </div>
                    </div>
                    <!-- End Navbar -->
                </div>
                <!-- End Col -->

                <div class="col-lg-9">
                    <div class="d-grid gap-3 gap-lg-5">

                        <div class="card">
                            <div class="card-header border-bottom">
                                <h4 class="card-header-title">계정을 삭제합니다</h4>
                            </div>
                            <!-- Body -->
                            <div class="card-body">
                                <p class="card-text">계정을 삭제하면 회원일 때 사용하던 서비스를 사용할 수 없습니다. 그리고 개인정보는 영구적으로 삭제됩니다. 14일 이내에 회원탈퇴를 취소할 수 있습니다.</p>
                                <form action="index.html" method="post" onsubmit="return checked();">
                                    <div class="mb-4">
                                        <!-- Check -->
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="deleteAccountCheckbox">
                                            <label class="form-check-label" for="deleteAccountCheckbox">확인하였습니다. 계정을 삭제할게요</label>
                                        </div>
                                        <!-- End Check -->
                                    </div>
                                    <div class="d-flex justify-content-end">
                                        <button type="submit" class="btn btn-danger">탈퇴</button>
                                    </div>
                                </form>
                            </div>
                            <!-- End  Body -->
                        </div>
                        <!-- End Card -->
                    </div>
                </div>
                <!-- End Col -->
            </div>
            <!-- End Row -->
        </div>
        <!-- End Content -->
    </main>
    <!-- ========== END MAIN CONTENT ========== -->



    <!-- Body End-->