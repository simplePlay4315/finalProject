<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <jsp:include page="/WEB-INF/views/common/header.jsp"/>
 
 
 <!-- 추가 css -->
    <link rel="stylesheet" media="screen" href="${path}/resources/css/front_css/theme.min.css">
    <link rel="stylesheet" media="screen" href="${path}/resources/css/Createx_css/theme.min.css">
    <!-- 추가 css 끝 -->
    <!-- header css -->
    <link rel="stylesheet" href="${path}/resources/css/directory_css/style.default.css" id="theme-stylesheet">
    <!-- header css end -->
    <!--===========MAIN CONTENT=================-->

    <!-- css, script 추가부분 -->
    <!-- Vendor Styles-->
    <link rel="stylesheet" media="screen" href="${path}/resources/css/simplebar.min.css" />
    <link rel="stylesheet" media="screen" href="${path}/resources/css/lightgallery.min.css" />
    <link rel="stylesheet" media="screen" href="${path}/resources/css/tiny-slider.css" />
    <!-- Page loading scripts-->
    <!-- css, script 추가부분 -->

    <!-- -------------------- -->
    <!-- Body -->
    <!-- Asked questions -->
    <section class="py-lg-6 py-5 bg-repeat-0 bg-position-top-start bg-size-contain" style="background-image: url(assets/img/seo-agency/asked-questions/bg-shape.svg)">
        <div class="container mt-md-4">
            <div class="row justify-content-center">
                <div class="col-lg-6 col-md-7">
                    <h2 class="h1 pb-md-3">Freequently Ask Questions</h2>

                    <!-- Accordion -->
                    <div class="accordion S_core4" id="accordionFaq">

                        <!-- Item -->
                        <div class="accordion-item">
                            <h5 class="accordion-header" id="accordionFaqHeading-1">
                                <button class="accordion-button border-0" type="button" data-bs-toggle="collapse" data-bs-target="#accordionFaqCollapse-1" aria-expanded="true" aria-controls="accordionFaqCollapse-1">왜 만들게 되었나요?</button>
                            </h5>
                            <div class="accordion-collapse border-0 collapse show" id="accordionFaqCollapse-1" aria-labelledby="accordionFaqHeading-1" data-bs-parent="#accordionFaq" style="width: 550px;">
                                <div class="accordion-body">놀러가고, 즐긴다는 의미를 충분히 보여주는 여행 사이트들은 많습니다.
                                    <br>그런 여행들은 특별하다는 느낌을 주죠. 소박함을 여행에 담고 싶었습니다.
                                    <br>
                                    <br>내 걸음이 닿는 곳들이 이미 여행이라는 철학 그리고 평범하게 느껴지는
                                    <br>날들에 조금은 소박한 걷기 여행 하나로 행복함을 느낄 수 있으면 좋겠다는 생각에 만들었습니다.</div>
                            </div>
                        </div>

                        <!-- Item -->
                        <div class="accordion-item">
                            <h5 class="accordion-header" id="accordionFaqHeading-2">
                                <button class="accordion-button border-0 collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#accordionFaqCollapse-2" aria-expanded="false" aria-controls="accordionFaqCollapse-2">어떤 기능들이 있나요?</button>
                            </h5>
                            <div class="accordion-collapse border-0 collapse" id="accordionFaqCollapse-2" aria-labelledby="accordionFaqHeading-2" data-bs-parent="#accordionFaq">
                                <div class="accordion-body">
                                1. 회원 서비스 <br>
                                2. 검색 서비스<br>
                                3. 일정관리 서비스<br>
                                4. 블로그 서비스 <br>
                                5. 커뮤니티 서비스 <br>
                                </div>
                            </div>
                        </div>

                        <!-- Item -->
                        <div class="accordion-item">
                            <h5 class="accordion-header" id="accordionFaqHeading-3">
                                <button class="accordion-button border-0 collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#accordionFaqCollapse-3" aria-expanded="false" aria-controls="accordionFaqCollapse-3">이 프로젝트에서 느낀 점은?</button>
                            </h5>
                            <div class="accordion-collapse border-0 collapse" id="accordionFaqCollapse-3" aria-labelledby="accordionFaqHeading-3" data-bs-parent="#accordionFaq">
                                <div class="accordion-body"> 
                                태성: 취업 하기 싫네요...<br>
                                지연:	 ㄴ2222입니다. 프로젝트는 재미 없고 팀원들이랑 떠드는 건 재밌었네요..ㅎ..ㅋ<br>
                                이거 확인한 분들 빨리 소감 적으세여ㅕ!ㅋㅋㅋㅋㅋㅋㅋㅋㅋ
                                 </div>
                            </div>
                        </div>

                        <!-- Item -->
                        <div class="accordion-item">
                            <h5 class="accordion-header" id="accordionFaqHeading-4">
                                <button class="accordion-button border-0 collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#accordionFaqCollapse-4" aria-expanded="false" aria-controls="accordionFaqCollapse-4">치킨 VS 피자 당신의 선택은?</button>
                            </h5>
                            <div class="accordion-collapse border-0 collapse" id="accordionFaqCollapse-4" aria-labelledby="accordionFaqHeading-4" data-bs-parent="#accordionFaq">
                                <div class="accordion-body"> 
                                태성: 둘다요.<br>
                                지연: 저는 치킨파입니다. tmi 젤 좋아하는 치킨 1. 지코바 2. 처갓집 3. 비비큐<br> </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-lg-5 offset-lg-1 col-md-5 col-sm-10 mt-md-0 mt-5">
                    <div class="parallax mx-auto">
                        <div class="parallax-layer" data-depth="0.05"><img src="${path}/resources/img/illustration/01.svg" alt="Layer-1"></div>
                        <div class="parallax-layer" data-depth="0.1"><img src="${path}/resources/img/illustration/02.svg" alt="Layer-2"></div>
                        <div class="parallax-layer" data-depth="0.13"><img src="${path}/resources/img/illustration/03.svg" alt="Layer-3"></div>
                        <div class="parallax-layer" data-depth="0.16"><img src="${path}/resources/img/illustration/04.svg" alt="Layer-4"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Team -->
    <section class="container">
        <h2 class="h1 mb-lg-3 pb-md-1 text-center" style="margin-top: -50px;">Meet our team</h2>
        <div class="row S_core4">
            <div class="col-lg-3 col-md-4 col-sm-6 mb-lg-5 mb-sm-grid-gutter mb-4 pb-md-3" style="margin-left: 13%;">
                <div class="card team">
                    <div class="card-img">
                        <img src="${path}/resources/img/team/01.jpg" alt="Courtney Alexander" />
                        <div class="card-floating-links text-end">
                            <a class="btn-social bs-light me-2" target="_blank" href="https://www.instagram.com/">
                                <i class="fab fa-instagram"></i>
                            </a>
                        </div>
                    </div>
                    <div class="card-body py-3 text-center">
                        <h5 class="card-title mb-1 S_core6">김주현</h5>
                        <p class="card-text text-muted">Founder and CEO</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mb-lg-5 mb-sm-grid-gutter mb-4 pb-md-3">
                <div class="card team">
                    <div class="card-img">
                        <img src="${path}/resources/img/team/02.jpg" alt="Johnny Lane" />
                        <div class="card-floating-links text-end">
                            <a class="btn-social bs-light me-2" target="_blank" href="https://www.instagram.com/">
                                <i class="fab fa-instagram"></i>
                            </a>
                        </div>
                    </div>
                    <div class="card-body py-3 text-center">
                        <h5 class="card-title mb-1 S_core6">서정현</h5>
                        <p class="card-text text-muted">Director of Client Services</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mb-lg-5 mb-sm-grid-gutter mb-4 pb-md-3">
                <div class="card team">
                    <div class="card-img">
                        <img src="${path}/resources/img/team/03.jpg" alt="Diane Mccoy" />
                        <div class="card-floating-links text-end">
                            <a class="btn-social bs-light me-2" target="_blank" href="https://www.instagram.com/tae.s__/">
                                <i class="fab fa-instagram"></i>
                            </a>
                        </div>
                    </div>
                    <div class="card-body py-3 text-center">
                        <h5 class="card-title mb-1 S_core6">장태성</h5>
                        <p class="card-text text-muted">Lead Digital PR Strategist</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mb-lg-5 mb-sm-grid-gutter mb-4 pb-md-3" style="margin-left: 13%; margin-top: -30px;">
                <div class="card team">
                    <div class="card-img">
                        <img src="${path}/resources/img/team/04.jpg" alt="Judith Warren" />
                        <div class="card-floating-links text-end">
                            <a class="btn-social bs-light me-2" target="_blank" href="https://www.instagram.com/">
                                <i class="fab fa-instagram"></i>
                            </a>
                        </div>
                    </div>
                    <div class="card-body py-3 text-center">
                        <h5 class="card-title mb-1 S_core6">전승배</h5>
                        <p class="card-text text-muted">Cheaf Marketing Officer</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mb-lg-5 mb-sm-grid-gutter mb-4 pb-md-3" style="margin-top: -30px;">
                <div class="card team">
                    <div class="card-img">
                        <img src="${path}/resources/img/team/05.jpg" alt="Floyd Simmmons" />
                        <div class="card-floating-links text-end">
                            <a class="btn-social bs-light me-2" target="_blank" href="https://www.instagram.com/">
                                <i class="fab fa-instagram"></i>
                            </a>
                        </div>
                    </div>
                    <div class="card-body py-3 text-center">
                        <h5 class="card-title mb-1 S_core6">한지연</h5>
                        <p class="card-text text-muted">Account Director</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mb-lg-5 mb-sm-grid-gutter mb-4 pb-md-3" style="margin-top: -30px;">
                <div class="card team">
                    <div class="card-img">
                        <img src="${path}/resources/img/team/06.jpg" alt="Shawn Edwards" />
                        <div class="card-floating-links text-end">
                            <a class="btn-social bs-light me-2" target="_blank" href="https://www.instagram.com/">
                                <i class="fab fa-instagram"></i>
                            </a>
                        </div>
                    </div>
                    <div class="card-body py-3 text-center">
                        <h5 class="card-title mb-1 S_core6">홍석규</h5>
                        <p class="card-text text-muted">Director of PPC</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- / Shaped bg -->


    <!-- Vendor scripts: js libraries and plugins-->
    <script src="${path}/resources/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${path}/resources/assets/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
    <script src="${path}/resources/assets/vendor/lightgallery.js/dist/js/lightgallery.min.js"></script>
    <script src="${path}/resources/assets/vendor/lg-video.js/dist/lg-video.min.js"></script>
    <script src="${path}/resources/assets/vendor/jarallax/dist/jarallax.min.js"></script>
    <script src="${path}/resources/assets/vendor/jarallax/dist/jarallax-element.min.js"></script>
    <script src="${path}/resources/assets/vendor/parallax-js/dist/parallax.min.js"></script>
    <script src="${path}/resources/assets/vendor/simplebar/dist/simplebar.min.js"></script>
    <script src="${path}/resources/assets/vendor/tiny-slider/dist/min/tiny-slider.js"></script>
    <script src="${path}/resources/assets/vendor/progressbar.js/dist/progressbar.min.js"></script>

    <!-- Main theme script-->
    <script src="${path}/resources/assets/js/theme.min.js"></script>

    <!--===================MAIN CONTENT======================-->
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>