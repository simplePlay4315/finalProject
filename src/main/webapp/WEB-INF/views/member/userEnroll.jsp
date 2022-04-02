<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${path}/resources/css/directory_css/style.default.css" id="theme-stylesheet">
<link rel="stylesheet" media="screen" href="${path}/resources/css/Createx_css/theme.min.css">


  <!-- Main -->
     <!-- UserEnroll.html css 추가부분 -->
     <style>
        .pb-3 {
            color: #7772f1;
        }
    </style>
    <!-- UserEnroll.html css 추가부분 끝-->
    
      <link rel="stylesheet" media="screen" href="css/front_css/theme.min.css">
    <main class="page-wrapper position-relative">
        <!-- Contact -->
        <section class="container py-lg-6 py-5">
            <h2 class="h1 pb-3">Sign up</h2>
            <div class="row justify-content-center pb-md-5">

                <!-- Contact form -->
                <form action ="${path}/member/enroll" method="post"class="col-lg-6 col-md-7 order-md-1 order-2 needs-validation" novalidate action="${path}/">
                    <div class="row">
                        <div style="margin-bottom: 1.5rem !important">
                            <label for="contact-first-name" class="form-label-lg">이름</label>
                            <input id="name" name="name" class="form-control form-control-lg" type="text" placeholder="ex) 홍길동" required>
                            <div class="invalid-tooltip">필수항목입니다.</div>
                        </div>
                        <div style="margin-bottom: 1.5rem !important">
                            <label for="contact-email" class="form-label-lg">아이디</label>
                            <input id="newId" name="id" class="form-control form-control-lg" type="text" placeholder="ex) test12" required>
                            <div style="float: right;">
                           <input type="button" id="checkDuplicate" class= "btn btn-primary btn-lg ms-lg-5"value="중복검사" 
                           style="margin-top: 5px;"/>
                           </div>
                            <div class="invalid-tooltip">필수항목입니다.</div>
                           
                        </div>
                        <div class="col-sm-6 mb-4">
                            <label for="contact-email" class="form-label-lg">비밀번호</label>
                            <input id="pass1" name="password" class="form-control form-control-lg bg-image-0" type="password" placeholder="비밀번호 입력" required minlength="8">
                            <div class="invalid-tooltip">8자 이상 입력바랍니다.</div>
                        </div>
                        <div class="col-sm-6 mb-4">
                            <label for="contact-email" class="form-label-lg">비밀번호 확인</label>
                            <input id="pass2" class="form-control form-control-lg bg-image-0" type="password" placeholder="비밀번호 확인" required>
                            <div class="invalid-tooltip">필수항목입니다.</div>
                        </div>
                        <div style="margin-bottom: 1.5rem !important">
                            <label for="e_mail" class="form-label-lg">이메일</label>
                            <input id="email" name="email" class="form-control form-control-lg bg-image-0" type="text" placeholder="ex) test12@naver.com">
                        </div>
                        <div style="margin-bottom: 1.5rem !important">
                            <label for="phone_number" class="form-label-lg">핸드폰</label>
                            <input id="phone" name="phone" class="form-control form-control-lg bg-image-0" type="number" placeholder="ex) 01012341234">
                        </div>
                        <div style="margin-bottom: 1.5rem !important">
                            <label for="address" class="form-label-lg">주소</label>
                            <input id="address" name="address" class="form-control form-control-lg bg-image-0" type="text" placeholder="ex) 서울시 금천구">
                        </div>
                        <div class="col-12">
                            <div class="d-flex flex-lg-row flex-column align-items-sm-start align-items-stretch justify-content-sm-between pt-md-4 pt-2">
                                <div class="mb-4 form-check">
                                    <input id="contact-subscribe" class="form-check-input" type="checkbox">
                                    <label for="contact-subscribe" class="form-check-label fs-base">개인정보 수집에 동의합니다.</label>
                                </div>
                                <button type="submit" id="enrollSubmit" class="btn btn-primary btn-lg ms-lg-5">가입하기</button>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="col-md-5 offset-lg-1 col-sm-9 order-md-2 order-1 mb-md-0 mb-4" style="margin-top: 20px;">
                    <img src="${path}/resources/img/loginlogo.png" alt="Layer-1" style="margin-left: 90px; height: 700px; width:700px;">
                </div>
            </div>
        </section>
    </main>
    <!-- Main end -->
    
    	<script>
		$(document).ready(() => {
			$("#pass2").blur((event) => {
				let pass1 = $("#pass1").val();			
				let pass2 = $(event.target).val();
				
				if(pass1.trim() != pass2.trim()) {
					alert("비밀번호가 일치하지 않습니다.");
					
					$("#pass1").val("");
					$(event.target).val("");
					$("#pass1").focus();
				}
			});
	    	
		    $("#enrollSubmit").on("click", () => {
		    	// TODO 전송하기 전에 각 영역에 유효성 검사로직을 추가하는 부분!
		    	//return false;
		    });
		    
		 	// 아이디 중복을 확인 처리 콜백함수
			$("#checkDuplicate").on("click", () => {
				let id = $("#newId").val().trim();
				
				if (id.length < 4) {
					alert("아이디는 최소 4글자 이상 입력해야 합니다.")
					
					return;
				}
				
				$.ajax({
					type: "get",
					url: "${path}/member/idCheck",
					dataType: "json",
					data: {
						id // 속성의 키값과 변수명이 동일할 경우
					},
					success: 
					function(data) {
						console.log(data);
						
						if(data.validate === true) {
							alert("이미 사용중인 아이디 입니다.");
						} else {
							alert("사용 가능한 아이디 입니다.");							
						}
					},
					error: function(e) {
						console.log(e);
					}
				});
			});
		});
	
	</script>	
    
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>