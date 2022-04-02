<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- 추가 css -->
	<link rel="stylesheet" media="screen" href="${path }/resources/css/front_css/theme.min.css">
<!-- 추가 css 끝 -->
 <!-- header css -->
    <link rel="stylesheet" href="${path}/resources/css/directory_css/style.default.css" id="theme-stylesheet">
 <!-- header css end -->
 
 
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
                            <ol class="breadcrumb breadcrumb-light mb-0">
                                <li class="breadcrumb-item S_core4">게시판</li>
                                <li class="breadcrumb-item S_core4" aria-current="page">내가 작성한 글</li>
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
                <div class="col-lg-3 S_core4">
                    <!-- Navbar -->
                    <div class="navbar-expand-lg navbar-light">
                        <div id="sidebarNav" class="collapse navbar-collapse navbar-vertical">
                            <!-- Card -->
                            <div class="card flex-grow-1 mb-5">
                                <div class="card-body">
                                    <!-- Avatar -->
                                    <div class="d-none d-lg-block text-center mb-5">
                                        <div class="avatar avatar-xxl avatar-circle mb-3">
                                            <img class="avatar-img" src="${path}/resources/img/photo/img9.jpg" alt="Image Description">
                                        </div>

                                        <h4 class="card-title mb-0 S_core6">${loginMember.name}</h4>
                                        <p class="card-text small ">${loginMember.email}</p>
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
                                    <span class="text-cap">블로그 / 커뮤니티</span>

                                    <!-- List -->
                                    <ul class="nav nav-sm nav-tabs nav-vertical mb-4">
                                        <li class="nav-item">
                                            <a class="nav-link active" href="${path}/member/myWrite">
                                                <i class="bi-bell nav-icon"></i> 내가 작성한 글
                                                <span class="badge bg-soft-dark text-dark rounded-pill nav-link-badge">${myBoardCount}</span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link " href="${path}/member/myComments">
                                                <i class="bi-sliders nav-icon"></i> 내가 댓글단 글
                                            </a>
                                        </li>
                                    </ul>
                                    <!-- End List -->

                                    <span class="text-cap">위시리스트</span>

                                    <!-- List -->
                                    <ul class="nav nav-sm nav-tabs nav-vertical mb-4">
                                        <li class="nav-item">
                                            <a class="nav-link " href="${path}/road/wishRoad">
                                                <i class="bi-heart nav-icon"></i> 나의 길
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

                <div class="col-lg-9 S_core4">
                    <div class="d-grid gap-3 gap-lg-5">
                        <!-- Card -->
                        <div class="card">
                            <div class="card-header border-bottom">
                                <h4 class="card-header-title S_core6">내가 작성한 글</h4>
                                <div class="d-flex justify-content-between align-items-center flex-column flex-md-row mb-4">
                                    <div class="mr-3">
                                        <p class="mb-3 mb-md-0"><strong>${myBoardCount}</strong> 개의 결과가 있습니다</p>
                                    </div>
                                </div>
                            </div>

                            <!-- Body -->
                            <div class="card-body">
                                <!-- Table -->
                                <table class="table table-lg" style="margin-top: -21px;">
                                    <thead>
                                        <tr>
                                            <th scope="col">게시글 번호</th>
                                            <th scope="col">제목</th>
                                            <th scope="col">조회수</th>
                                            <th scope="col">게시글 타입</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:if test="${myBoardList == null }">
                                     <tr>
                                            <td colspan="6">
											작성한 게시글이 없습니다.
											</td>
                                        </tr>
                                    </c:if>
                                    <c:if test="${myBoardList !=null}">
                                    <c:forEach var="board" items="${myBoardList}">
                                        <tr>
                                            <th scope="row">${board.no}</th>
                                            <td>${board.title}</td>
                                            <td>${board.readCount}</td>
                                            <td>커뮤니티</td>
                                        </tr>
                                        </c:forEach>
                                        </c:if>
                                    </tbody>
                                </table>
                                <!-- End Table -->
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
