   <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
   
    <!------------------------------------------------------------>
    <!-- around.html 필요한 css -->
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="${path }/css/directory_css/style.default.css" id="theme-stylesheet2">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <!-- Favicon-->
    <link rel="shortcut icon" href="${path }/img/favicon.png">
    <!-- around.html 필요한 css -->
    
    <!-- css 추가 -->
    

    <!-- main content-->
    <div style="padding-top: 72px;">
        <div class="container-fluid pt-5 pb-3 border-bottom px-lg-5">
            <div class="row">
                <div class="col-xl-8" style="margin-left: 16%;">
                    <h1 style="text-align: center;">Search information near your trip road</h1>
                    <p class="lead text-muted" style="text-align: center;">여행지에서 어떤 음식을 먹고 어떤 곳에서 머무를지 고민중이신가요? 내가 가는 여행지들 중 한 곳을 선택하세요.<br> 여행지 주변에서 갈 수 있는 맛집이나 카페와 관광지 그리고 편안히 쉴 수 있는 숙소를 소개해드릴게요.</p>
                </div>
            </div>
                            <div class="col-lg-3 pt-3" style="margin-left: 37%;">
                    <form class="pr-xl-3" name ="select" action="${path}/around/aroundSearch.do" method="POST">
                        <div class="mb-4">
                            <label class="form-label" for="form_guests" style="float: right;">내가 가는 여행지</label>
                            <select class="selectpicker form-control" name="s_Location" id="s_Location" data-style="btn-selectpicker">
                            	<c:if test="${list==null}">
                            	<option value="no">담아 놓은 여행지가 없습니다.</option>
                            	</c:if>
                            	
                            	<c:if test="${list!=null}">
                            	<c:forEach var="road" items="${list}">
                            	<option value="${road.s_Location},${road.sno}">${road.roadNm}
                            	</option>
                            	</c:forEach>
                            	</c:if>
                            </select>
                 
                        </div>

                        <!-- 검색버튼-->
                        <div class="pb-4" style="margin-left: 37%;">
                            <div class="mb-4">
                                <button class="btn btn-primary" type="submit"> <i class="fas fa-filter mr-1"></i>검색하기                </button>
                            </div>
                        </div>
                        <!-- 검색버튼 끝-->
                    </form>
                </div>
        </div>
        <div class="container-fluid py-5 px-lg-5" style="margin-left: 12%;"> 
            <div class="row">
                <div class="col-lg-9">
                    <div class="d-flex justify-content-between align-items-center flex-column flex-md-row mb-4">
                        <div class="mr-3">
                            <p class="mb-3 mb-md-0">results found</p>
                        </div>
                    </div>
                    
                    <div class="row">
                        <!-- 반복문 시작-->
                        <!-- place item-->
                        <c:if test="${a_list==null}">
                        <div class="col-sm-6 col-xl-4 mb-5 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="${path }/resources/img/prepareing.gif" alt="Modern, Well-Appointed Room" />
                                    <a class="tile-link" href="detail-rooms.html"></a>
                                </div>
                                <div class="card-body d-flex align-items-center">
                                    <div class="w-100">
                                        <h6 class="card-title">검색결과가 없습니다.
                                        </h6>
                                        <div class="d-flex card-subtitle mb-3">
                                            <p class="flex-grow-1 mb-0 text-muted text-sm"></p>
                                        </div>
                                        <button class="btn btn-primary" style="float: right;">없음</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:if>
                        
                        
                         <c:if test="${a_list!=null}">
                         <c:forEach var="around" items="${a_list}">
                        <div class="col-sm-6 col-xl-4 mb-5 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
                             
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="${path }/resources/img/around/around_img.png" alt="Modern, Well-Appointed Room" />
                                    <a class="tile-link" href="detail-rooms.html"></a>
                                </div>
                                
                                <div class="card-body d-flex align-items-center">
                                  
                                    <div class="w-100">
                                        <form action="${path}/plusschedule.do" method="post">
                                        <h6 class="card-title">${around.shopNm}
                                        </h6>
                                        <input type="hidden" id= "shopNm" name="shopNm" value="${around.shopNm}">
                                        <div class="d-flex card-subtitle mb-3">
                                            <p class="flex-grow-1 mb-0 text-muted text-sm">${around.shopaddr}</p>
                                            <input type="hidden" value="${sno}" name="sno">
                                        	<input type="hidden" value="${s_loaction}" name="s_location">
                                        </div>
                                        <button type="submit" class="btn btn-primary" style="float: right;">일정에 추가</button>
                                    </form>
                                    </div>
                                    
                                    
                            
                                </div>
                                
                            </div>
                            
                        </div>
                        </c:forEach>
                        </c:if>
                       
                        <!-- 반복문 끝-->
                    </div>
                
                    <!-- Pagination -->
                    <nav aria-label="Page navigation example">
                        <ul class="pagination pagination-template d-flex justify-content-center">
                            <li class="page-item">
                                <a class="page-link" href="${path}/around/aroundSearch.do?page=1"> <i class="fa fa-angle-left"></i></a>
                            </li>
                            
                            <c:forEach begin="${pageInfo.startPage}" end = "${pageInfo.endPage}" step ="1" varStatus="status">
                            <c:if test = "${pageInfo.currentPage == status.current }">
                            <li class="page-item active"><a class="page-link">${pageInfo.currentPage}</a></li>
                          	</c:if>
                          	<c:if test = "${pageInfo.currentPage != status.current }">
                          	<li class="page-item"><a class="page-link" href="${path}/around/aroundSearch.do?page=${status.current}&?s_Location=${road.s_Location},${road.sno}">${status.current}</a></li>
                          	</c:if>
                          	</c:forEach>
                            <li class="page-item">
                                <a class="page-link" href="${path}/around/aroundSearch.do?page=${pageInfo.nextPage}"> <i class="fa fa-angle-right"></i></a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    
     <script type="text/javascript">
    function plus(){
    	var url = "${path}/around/plusschedule.do?shopNm=";
    	var requestURL = url + ${around.shopNm} + "&?sno=" + ${sno} ;
    	location.replace(requestURL);
    }
    
	</script>
    
    <!-- around.html 필요 js-->
    <!-- Object Fit Images - Fallback for browsers that don't support object-fit-->
    <script src="${path }/js/ofi.min.js"></script>
    <script src="${path }/js/theme.js"></script>
    <!-- around.html 필요 js 끝-->

    <!-- main content 끝-->

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