<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- add css -->
 	<link rel="stylesheet" media="screen" href="${path }/resources/css/Catzilla_css/theme.min.css">
	<link rel="stylesheet" media="screen" href="${path }/resources/css/front_css/theme.min.css">
    <link type="text/css" href="${path }/resources/css/spaces.css/spaces.css" rel="stylesheet">
    <link rel="stylesheet" media="screen" href="${path }/resources/css/Createx_css/theme.min.css">
<!-- add css end -->
<!-- header css -->
    <link rel="stylesheet" href="${path}/resources/css/directory_css/style.default.css" id="theme-stylesheet">
<!-- header css end -->
 
<!-- custom css -->
	<style>
        .btn-mid {
            display: block;
            color: #ffffff;
            background-color: #0d1b48;
            border-color: #0d1b48;
            box-shadow: 0 0 24px rgba(27, 22, 66, 0.04), 0 44px 74px rgba(27, 22, 66, 0.06);
        }
    </style>
<!-- custom css end -->

 
    <!-- Dashboard header-->
    <div class="page-title-overlap bg-accent py-6 text-muted"></div>

    <!-- Content-->
    <div class="container mb-5 pb-3">
        <div class="bg-light shadow-lg rounded-3 overflow-hidden">
            <div class="row">
                <section class="col-lg-10 pt-lg-4 pb-4 mb-5" style="margin-left: 8%;">
                    <div class="pt-2 px-4 ps-lg-0 pe-xl-5">
                        <!-- Title-->
                        <div class="d-sm-flex flex-wrap justify-content-between align-items-center pb-2">
                            <h2 class="h3 py-2 me-2 text-center text-sm-start">게시글을 작성하세요</h2>
                            <div class="py-2">
                                <select class="form-select me-2" id="unp-category">
                                    <option>카테고리 선택</option>
                                    <option>질문 게시판</option>
                                    <option>후기 게시판</option>
                                </select>
                            </div>
                        </div>
                        <!-- content input form -->
                        <form action="${ path }/board/boardOneWrite" method="POST" enctype="multipart/form-data">
                        	<label class="form-label"> <c:out value="작성자 : "/> </label>
                            <label class="form-label"> <c:out value="${ loginMember.id }"/> </label>
                            <div class="mb-3 pb-2">
                                <label class="form-label" for="unp-product-name">게시글 제목</label>
                                <input type="hidden" name="writerId" value="${ loginMember.id }" readonly>
                                <input name="title" class="form-control" type="text" id="unp-product-name">
                                <div class="form-text">최대 100자 이내, html / 이모티콘 제외</div>
                            </div>
                            <div class="file-drop-area mb-3">
                                <span class="file-drop-message">사진을 올려주세요</span>
                                <input name="upfile" class="file-drop-input" type="file">
                                <button class="file-drop-btn btn btn-primary btn-sm mb-2" type="button">사진 선택하기</button>
                                <div class="form-text">이미지 최적화 사이즈 : 1000x800px</div>
                            </div>
                            <div class="mb-3 py-2">
                                <label class="form-label" for="unp-product-description">게시글 내용</label>
                                <textarea name="content" class="form-control" rows="20" id="unp-product-description"></textarea>
                            </div>
                       <!-- <div class="mb-3 py-2">
                                <label class="form-label" for="unp-product-tags">#태그</label>
                                <textarea class="form-control" rows="1" id="unp-product-tags"></textarea>
                                <div class="form-text">게시글에 대한 태그를 작성할 수 있습니다.</div>
                            </div> -->
                            <div style="display: flex; margin-left: 44%">
                            	<div>
                            		<button class="btn btn-primary d-block w-30" type="submit">
                            			<i class=""></i>작성 완료
                            		</button> 
								</div>
                            	<div style="margin-left: 53%">
									 <input class="btn btn-info d-block w-30" type="reset" value="다시 작성하기">
								</div>
                            </div>
                        </form>
                        <!-- content input form -->
                    </div>
                </section>
            </div>
        </div>
    </div>


 <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	