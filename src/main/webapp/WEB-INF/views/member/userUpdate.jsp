<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <c:set var="path" value="${pageContext.request.contextPath}"/>
    
 	<!-- Body -->
    <!-- ========== MAIN CONTENT ========== -->

    <!--userUpdate.html 사용 css-->
    <link rel="stylesheet" media="screen" href="${ path }/resources/css/front_css/theme.min.css">
    <link rel="stylesheet" href="${ path }/resources/css/directory_css/style.default.css" id="theme-stylesheet">
      <!--userUpdate.html 사용 css-->
    
    <!-- -->
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
                                <li class="breadcrumb-item S_core4">계정</li>
                                <li class="breadcrumb-item S_core4" aria-current="page">개인 정보</li>
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

                                        <h4 class="card-title mb-0 S_core6">${loginMember.name }</h4>
                                        <p class="card-text small S_core4">${loginMember.email }</p>
                                    </div>
                                    <!-- End Avatar -->

                                    <!-- Nav -->
                                    <span class="text-cap">계정</span>

                                    <!-- List -->
                                    <ul class="nav nav-sm nav-tabs nav-vertical mb-4">
                                        <li class="nav-item">
                                            <a class="nav-link active">
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
                                            <a class="nav-link " href="${path}/wish/wishRoad">
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

                <div class="col-lg-9">
                    <div class="d-grid gap-3 gap-lg-5">
                        <!-- Card -->
                        <div class="card">
                            <div class="card-header border-bottom">
                                <h4 class="card-header-title S_core6">기본 정보</h4>
                            </div>

                            <!-- Body -->
                            <div class="card-body S_core4">
                                <form method="post" action="${path }/member/update">
                                	
                                	<!-- Form -->
                                    <div class="row mb-4">
                                        <label for="id" class="col-sm-3 col-form-label form-label">이름</label>

                                        <div class="col-sm-9">
                                            <div class="input-group">
                                                <input type="text" class="form-control" name="id" id="id" placeholder="아이디" value="${loginMember.id }" readonly required>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Form -->
                                	
                                	
                                    <!-- Form -->
                                    <div class="row mb-4">
                                        <label for="name" class="col-sm-3 col-form-label form-label">이름</label>

                                        <div class="col-sm-9">
                                            <div class="input-group">
                                                <input type="text" class="form-control" name="name" id="name" placeholder="이름" value="${loginMember.name }" required>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Form -->

                                    <!-- Form -->
                                    <div class="row mb-4">
                                        <label for="email" class="col-sm-3 col-form-label form-label">이메일</label>

                                        <div class="col-sm-9">
                                            <input type="email" class="form-control" name="email" id="email" placeholder="clarice@example.com" value="${loginMember.email }" required>
                                        </div>
                                    </div>
                                    <!-- End Form -->

                                    <!-- Form -->
                                    <div class="js-add-field row mb-4">
                                        <label for="phone" class="col-sm-3 col-form-label form-label">전화번호</label>

                                        <div class="col-sm-9">
                                            <div class="input-group">
                                                <input type="number" class="js-input-mask form-control" name="phone" id="phone" value="${loginMember.phone }" required>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Form -->
                                    
                                    <!-- Form -->
                                    <div class="js-add-field row mb-4">
                                        <label for="address" class="col-sm-3 col-form-label form-label">주소</label>

                                        <div class="col-sm-9">
                                            <div class="input-group">
                                                <input type="text" class="js-input-mask form-control" name="address" id="address" value="${loginMember.address }" required>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Form -->
                                    
                                    <!-- Submit -->
                                    <div class="d-flex justify-content-end gap-3 mt-3">
                                    	<button type="submit" class="btn btn-primary btn-lg">변경 사항 저장</button>
                                	</div>
                                	<!-- Submit End -->
                                </form>
                            </div>
                            <!-- End Body -->
                        </div>
                        <!-- End Card -->


                        <!-- Card -->
                        <div class="card">
                            <div class="card-header border-bottom">
                                <h4 class="card-header-title S_core6">계정을 삭제합니다.</h4>
                            </div>

                            <!-- Body -->
                            <div class="card-body S_core4">
                                <p class="card-text">계정을 삭제하면 회원일 때 사용하던 서비스를 사용할 수 없습니다. 그리고 개인정보는 영구적으로 삭제됩니다.</p>
						
                                <div class="mb-4">
                                    <!-- Check -->
                                    <form action="${path }/member/delete" method="get" onsubmit="return deleteCheck()">
                                    	<div class="form-check">
                                        	<input type="checkbox" class="form-check-input" id="deleteAccountCheckbox">
                                        	<label class="form-check-label" for="deleteAccountCheckbox">확인했습니다. 계정을 삭제할게요.</label>
                                    	</div>
                                    <!-- End Check -->
                                		<div class="d-flex justify-content-end">
                                    		<button type="submit" class="btn btn-danger">탈퇴</button>
                                		</div>
                                    </form>
                                </div>
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
	
	<!-- UserDelete Script -->	
	<script>
		function deleteCheck() {
			var check = $(deleteAccountCheckbox).is(":checked");
			if(check == false){
				alert("회원탈퇴를 하시려면 동의가 필요합니다.")
			}
			return check; 
		}
		
	</script>
	<!-- UserDelete Script  End -->

	
	
	
	
	<!-- test -->
	<!-- JavaScript files-->

    <!-- jQuery-->
    <script src="${ path }/resources/js/jquery.min.js"></script>
    <!-- Bootstrap JS bundle - Bootstrap + PopperJS-->
    <script src="${ path }/resources/js/bootstrap.bundle.min.js"></script>
    <!-- Magnific Popup - Lightbox for the gallery-->
    <script src="${ path }/resources/js/jquery.magnific-popup.min.js"></script>
    <!-- Smooth scroll-->
    <script src="${path}/resources/js/smooth-scroll.polyfills.min.js"></script>
    <!-- Bootstrap Select-->
    <script src="${ path }/resources/js/bootstrap-select.min.js"></script>
    <!-- Object Fit Images - Fallback for browsers that don't support object-fit-->
    <script src="${ path }/resources/js/ofi.min.js"></script>
    <!-- Swiper Carousel -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
    <script>
        var basePath = ''
    </script>
    <!-- Main Theme JS file    -->
    <script src="${path }/resources/js/theme.js"></script>
    
    <script src="${path}/resources/js/theme.min.js"></script>
	<!-- test -->

    <!-- Body End-->
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>