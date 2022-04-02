<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>
	
    <link rel="stylesheet" href="${path}/resources/css/directory_css/style.default.css" id="theme-stylesheet">
    <!-- header css end -->
    
    <!-- Body -->
    <div class="container py-5 px-lg-5">
        <div class="row">
            <div class="col-lg-12" style="margin-left: 1%;">
                <div class="d-flex justify-content-between align-items-center flex-column flex-md-row mb-4">
                    <div class="mr-3">
                        <p class="mb-3 mb-md-0"><strong>${countList }</strong> 개의 결과가 있습니다</p>
                    </div>
                    <div>
                        <label class="form-label mr-2" for="form_sort">정렬 기준 :</label>
                        <select class="selectpicker" name="sort" id="form_sort" data-style="btn-selectpicker" title="정렬기준" onchange="change()">
	                        <option value="sortBy_0">추천순   </option>
	                        <option value="sortBy_1">거리순(낮은)   </option>
	                        <option value="sortBy_2">난이도 낮은순   </option>
	                        <option value="sortBy_3">난이도 높은순   </option>
	                    </select>
                    </div>
                </div>
                
                <div class="row S_core4" id="divSort">
	               	<c:if test="${list != null }">
	               		<c:forEach var="road" items="${list }">
		                    <div class="col-sm-6 col-xl-4 mb-5 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
		                        <div class="card h-100 border-0 shadow">
		                            <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="${path}/resources/img/roadimg/${road.crsPic}" alt="Modern, Well-Appointed Room" />
		                                <a class="tile-link" href="${path}/road/roadInfo.do?rdNo=${road.rdNo}"></a>
		                            </div>
		                            <div class="card-body d-flex align-items-center">
		                                <div class="w-100">
		                                    <div class="d-flex">
		                                        <h6 class="card-title" style="width: 85%;"><a class="text-decoration-none text-dark S_core6" href="${path}/road/roadInfo.do?rdNo=${road.rdNo}">${road.roadNm}</a></h6>
		                                        <div style="float: right;">
		                                            <a class="card-fav-icon" href="javascript: void();">
		                                                <svg class="svg-icon text-white">
		                                                    <use xlink:href="#heart-1"> </use>
		                                                </svg>
		                                            </a>
		                                        </div>
		                                    </div>
		                                    <div class="card-subtitle">
		                                        <p class="flex-grow-1 mb-0 text-muted text-sm">거리 : ${road.crsLength}km</p>
		                                        <c:if test="${road.level eq '3'}">
			                                        <p class="flex-grow-1 mb-0 text-muted text-sm">난이도 : 상</p>
		                                        </c:if>
		                                        <c:if test="${road.level eq '2'}">
			                                        <p class="flex-grow-1 mb-0 text-muted text-sm">난이도 : 중</p>
		                                        </c:if>
		                                        <c:if test="${road.level eq '1'}">
			                                        <p class="flex-grow-1 mb-0 text-muted text-sm">난이도 : 하</p>
		                                        </c:if>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
	               		</c:forEach>
	               	</c:if>
                </div>
                
                <c:if test="${countList >= 700}">
                	<nav aria-label="Page navigation example">
	                    <ul class="pagination pagination-template d-flex justify-content-center">
	                        <li class="page-item">
	                            <a class="page-link" href="${path}/road/allList?page=1"> <i class="fa fa-angle-left"></i></a>
	                        </li>
	                        
	                        <c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
	                        	<c:if test="${pageInfo.currentPage == status.current}">
			                        <li class="page-item active"><button class="page-link" disabled="disabled"><c:out value="${status.current}"/></button>
			                        </li>
	                        	</c:if>
	                        	<c:if test="${pageInfo.currentPage != status.current}">
			                        <li class="page-item"><button class="page-link" onclick="location.href='${path}/road/allList?page=${status.current}'"><c:out value="${status.current}"/></button>
			                        </li>
	                        	</c:if>
	                        </c:forEach>
	                        
	                        <li class="page-item">
	                            <a class="page-link" href="${path}/road/allList?page=${pageInfo.maxPage}"> <i class="fa fa-angle-right"></i></a>
	                        </li>
	                    </ul>
                    </nav>
                </c:if>
		<c:if test="${countList < 700}">
	                <nav aria-label="Page navigation example">
	                    <ul class="pagination pagination-template d-flex justify-content-center">
	                        <li class="page-item">
	                            <a class="page-link" href="${path}/road/list?page=1"> <i class="fa fa-angle-left"></i></a>
	                        </li>
	                        
	                        <c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
	                        	<c:if test="${pageInfo.currentPage == status.current}">
			                        <li class="page-item active"><button class="page-link" disabled="disabled"><c:out value="${status.current}"/></button>
			                        </li>
	                        	</c:if>
	                        	<c:if test="${pageInfo.currentPage != status.current}">
			                        <li class="page-item"><button class="page-link" onclick="location.href='${path}/road/list?page=${status.current}'"><c:out value="${status.current}"/></button>
			                        </li>
	                        	</c:if>
	                        </c:forEach>
	                        
	                        <li class="page-item">
	                            <a class="page-link" href="${path}/road/list?page=${pageInfo.maxPage}"> <i class="fa fa-angle-right"></i></a>
	                        </li>
	                    </ul>
                    </nav>
		</c:if>
            </div>
        </div>
    </div>
    
    <script>
        var snapSlider = document.getElementById('slider-snap');

        noUiSlider.create(snapSlider, {
            start: [40, 110],
            snap: false,
            connect: true,
            step: 1,
            range: {
                'min': 40,
                'max': 110
            }
        });
        var snapValues = [
            document.getElementById('slider-snap-value-from'),
            document.getElementById('slider-snap-value-to')
        ];
        var inputValues = [
            document.getElementById('slider-snap-input-from'),
            document.getElementById('slider-snap-input-to')
        ];
        snapSlider.noUiSlider.on('update', function(values, handle) {
            snapValues[handle].innerHTML = values[handle];
            inputValues[handle].value = values[handle];
        })
    </script>

    <!-- Body End-->
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
    

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
