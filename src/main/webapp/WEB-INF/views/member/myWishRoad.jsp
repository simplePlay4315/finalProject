<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    
    <link rel="stylesheet" media="screen" href="${path}/resources/css/front_css/theme.min.css">    
    <link rel="stylesheet" href="${path}/resources/css/directory_css/style.default.css" id="theme-stylesheet">

 <!-- ========== MAIN CONTENT ========== -->
    <main id="content" role="main" class="bg-light">
        <!-- Breadcrumb -->
        <div class="navbar-dark" style="background-color: rgb(211, 209, 251);">
            <div class="container content-space-1 content-space-b-lg-3">
                <div class="row align-items-center">
                    <div class="col">
                        <div class="d-none d-lg-block">
                            <h1 class="text-white S_core6">마이페이지</h1>
                        </div>

                        <!-- Breadcrumb -->
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb breadcrumb-light mb-0 S_core4">
                                <li class="breadcrumb-item">위시리스트</li>
                                <li class="breadcrumb-item" aria-current="page">나의 길</li>
                            </ol>
                        </nav>
                        <!-- End Breadcrumb -->
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
                            <div class="card flex-grow-1 mb-5 S_core4">
                                <div class="card-body">
                                    <!-- Avatar -->
                                    <div class="d-none d-lg-block text-center mb-5">
                                        <div class="avatar avatar-xxl avatar-circle mb-3">
                                            <img class="avatar-img" src="${path}/resources/img/photo/img9.jpg" alt="Image Description">
                                        </div>

                                        <h4 class="card-title mb-0 S_core6">${loginMember.name}</h4>
                                        <p class="card-text small">${loginMember.email}</p>
                                    </div>
                                    <!-- End Avatar -->

                                    <!-- Nav -->
                                    <span class="text-cap">계정</span>

                                    <!-- List -->
                                    <ul class="nav nav-sm nav-tabs nav-vertical mb-4">
                                        <li class="nav-item">
                                            <a class="nav-link" href="UserUpdate.html">
                                                <i class="bi-person-badge nav-icon"></i> 개인 정보
                                            </a>
                                        </li>
                                    </ul>
                                    <!-- End List -->

                                    <!-- Nav -->
                                    <span class="text-cap">블로그/커뮤니티</span>

                                    <!-- List -->
                                    <ul class="nav nav-sm nav-tabs nav-vertical mb-4">
                                        <li class="nav-item">
                                            <a class="nav-link " href="${path}/member/myWrite">
                                                <i class="bi-bell nav-icon"></i> 내가 작성한 글
                                                <span class="badge bg-soft-dark text-dark rounded-pill nav-link-badge">1</span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="${path}/member/myComments">
                                                <i class="bi-sliders nav-icon"></i> 내가 댓글단 글
                                            </a>
                                        </li>
                                    </ul>
                                    <!-- End List -->

                                    <span class="text-cap">위시리스트</span>

                                    <!-- List -->
                                    <ul class="nav nav-sm nav-tabs nav-vertical mb-4">
                                        <li class="nav-item">
                                            <a class="nav-link active" href="${path}/road/wishRoad">
                                                <i class="bi-heart nav-icon"></i> 나의 길
                                                <span class="badge bg-soft-dark text-dark rounded-pill nav-link-badge">${count}</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <!-- End List -->

                                    <div class="d-lg-none">
                                        <div class="dropdown-divider"></div>

                                        <!-- List -->
                                        <ul class="nav nav-sm nav-tabs nav-vertical">
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="bi-box-arrow-right nav-icon"></i> Log out
                                                </a>
                                            </li>
                                        </ul>
                                        <!-- End List -->
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
                        <!-- Card -->
                        <div class="card">
                            <div class="card-header border-bottom S_core4">
                                <h1 class="card-header-title S_core6">Road that you want to go</h1>
                                <p>홍길동 님이 가고 싶은 길을 모아두었어요. <br> 한 곳 두 곳씩 가고 싶은 길이아니라 이미 다녀온 길이 되어 추억으로 남기를 바랄게요 !</p>
                                <ul class="nav nav-pills-custom">
                                    <li class="nav-item"><a class="nav-link active" href="#">전체</a></li>
                                    
                                </ul>
                            </div>

                            <!-- Body -->
                           
                            <div class="card-body">
                                <div class="row">
           
                                	<!-- 반복문 시작 -->
                                    <!-- place item-->
                              <c:if test="${myWishList !=null}">
                                     <c:forEach var="wish" items="${myWishList}">
                                    <div class="col-sm-6 mb-5 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
                     
                                        <div class="card h-100 border-0 shadow">
                                            
                                            <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="${path}/resources/img/roadimg/${wish.crsPic}" />
                                                <a class="tile-link" href="detail-rooms.html"></a>
                                                <div class="card-img-overlay-top text-end"></div>
                                            </div>

                                            <div class="card-body d-flex align-items-center">
                                                <div class="w-100">
                                                    <h6 class="card-title S_core5"><a class="text-decoration-none text-dark" href="detail-rooms.html">${wish.roadNm}</a></h6>
                                                    <div class="d-flex card-subtitle mb-3">
                                                        <p class="flex-grow-1 mb-0 text-muted text-sm S_core4">${wish.s_location}</p>
                                                        <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i>
                                                        </p>
                                                    </div>
                                                    <p>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </c:forEach>
                                    </c:if>
                                   
                                  

                                </div>
                                <!-- Pagination -->
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination pagination-template d-flex justify-content-center">
                                        <li class="page-item">
                                            <a class="page-link" href="${path}/?page=${pageInfo.prvePage}"> <i class="fa fa-angle-left"></i></a>
                                        </li>
                                        <!-- 4개 목록 -->
                                        <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1" varStatus="status">
                                        <c:if test="${ pageInfo.currentPage == status.current}">
                                         <li class="page-item active"><a class="page-link" href="#">${status.current}</a></li>
                                         </c:if>
                                         <c:if test="${ pageInfo.currentPage != status.current}">
                                        <li class="page-item"><a class="page-link" href="${path}/?page=${status.current}">${status.current}</a></li>
                                        </c:if>
                                        </c:forEach>
                                        <li class="page-item">
                                            <a class="page-link" href="${path}/?page=${pageInfo.nextPage}"> <i class="fa fa-angle-right"></i></a>
                                        </li>
                                    </ul>
                                </nav>



                            </div>
                            <!-- End Body -->


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
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>