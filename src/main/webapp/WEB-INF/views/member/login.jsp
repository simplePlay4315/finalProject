<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" media="screen" href="${path}/resources/css/front_css/theme.min.css">
<link rel="stylesheet" href="${path}/resources/css/directory_css/style.default.css" id="theme-stylesheet">
  <!-- ========== MAIN CONTENT ========== -->


      <!-- login.html css 추가부분 -->
      <style>
        .pb-3 {
            color: #7772f1;
        }
    </style>
    <main id="content" role="main" class="flex-grow-1">
        <!-- Form -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-5 col-xl-4 d-none d-lg-flex justify-content-center align-items-center min-vh-lg-100 position-relative" style="background-color: #C89FC8;">
                    <div class="flex-grow-1 p-5">

                        <!-- Clients -->
                        <div class="position-absolute start-0 end-0 bottom-0 text-center p-5">
                            <div class="row justify-content-center">
                            </div>
                            <!-- End Row -->
                        </div>
                        <!-- End Clients -->
                    </div>
                </div>
                <!-- End Col -->

                <div class="col-lg-7 col-xl-8 d-flex justify-content-center align-items-center min-vh-lg-100">
                    <div class="flex-grow-1 mx-auto" style="max-width: 28rem;">
                        <!-- Heading -->
                        <div class="text-center mb-5 mb-md-7">
                            <h2 class="h1 pb-3">로그인</h2>
                        </div>
                        <!-- End Heading -->

                        <!-- Form -->
                        <form action="${path}/login"class="js-validate needs-validation" novalidate action="${path}/" method="post">
                            <div class="mb-4">
                                <label class="form-label" for="signupModalFormLoginEmail">아이디</label>
                                <input type="id" class="form-control form-control-lg" name="userId" id="userId" placeholder="아이디를 입력하세요" aria-label="id" required>
                                <span class="invalid-feedback">아이디를 입력해주세요.</span>
                            </div>
                            <div class="mb-4">
                                <label class="form-label" for="signupModalFormLoginPassword">비밀번호</label>
                                <input type="password" class="js-toggle-password form-control form-control-lg" name="userPwd" id="userPwd" placeholder="비밀번호를 입력하세요" aria-label="비밀번호 입력" required>
                                <span class="invalid-feedback">8자 이상 비밀번호를 입력해주세요.</span>
                            </div>


                            <div class="d-grid mb-3">
                                <button type="submit" class="btn btn-primary btn-lg">LOGIN</button>
                            </div>

                            <div class="text-center">
                                <p>아직 계정이 없으신가요? <a class="link" href="${path}/member/userEnroll">회원가입</a></p>
                            </div>
                        </form>
                        <!-- End Form -->
                    </div>
                </div>
                <!-- End Col -->
            </div>
            <!-- End Row -->
        </div>
        <!-- End Form -->
    </main>
    <!-- ========== END MAIN CONTENT ========== -->
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>