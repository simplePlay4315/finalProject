  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>


 <style>
        .btn_click {
            background-color: #e9e9e9;
            border-radius: 30px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, .1);
            display: inline-block;
            width: 45px;
            height: 45px;
            text-align: center;
            line-height: 45px;
            margin-right: 10px;
            margin-top: 3px;
            border: none;
        }
        
        #heart {
            margin-top: 8px;
            font-size: 30px;
            color: rgb(247, 247, 247);
        }
        
        #heart:hover {
            color: #7275E8;
        }
        
        .control-btn, .control-btn control-on {
        	float: right;
        	background-color: #7275E8;
        	color: white;
        	border-radius: 10px;
            display: inline-block;
            text-align: center;
            line-height: 40px;
            margin-top: 3px;
            margin-left: 3px;
            border: none;
        }
        
        
    </style>

    <!-- ========== MAIN CONTENT ========== -->
    <!-- roadinfo.html css -->
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=83bfuniegk&amp;submodules=panorama,geocoder,drawing,visualization"></script>
    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="${ path }/resources/assets/vendor/bootstrap-icons/font/bootstrap-icons.css">
    <!-- CSS Front Template -->
    <link rel="stylesheet" href="${ path }/resources/css/front_css/theme.min.css">
    <link rel="stylesheet" href="${ path }/resources/css/directory_css/style.default.css" id="theme-stylesheet">
    <title>Network</title>
    <script src="https://kit.fontawesome.com/3929e16ef5.js" crossorigin="anonymous"></script>
    <script src="{% static 'network/functions.js' %}"></script>
    <!-- roadinfo.html css 끝 -->

    <main id="content" role="main">
        <!-- Contact Form -->
        <div class="container content-space-t-3 content-space-b-2">
            <div class="row">
                <div class="col-lg-6 ">
                    <!-- Heading -->
                    <div class="mb-5">
                        <h1>${road.roadNm}</h1>
                        <p>${road.s_location}</p>
                    </div>
                    <!-- End Heading -->

                    <!-- api 맵 가져오는 자리 -->
                    <div class="overflow-hidden" style="margin-top: -5%;">
                        <!-- 이 부분부터 div로 맵 사용하면 됩니다-->
                         <div id="pano" style="width:540px;height:540px; "></div>
                         <div id="button-wrap" class="buttons">
        						<input id="zoom" type="button" value="ZoomControl 끄기" class="control-btn control-on" />
        						<input id="zoomOption" type="button" value="크게 보기" class="control-btn" />
    					</div>
    					<code id="snippet" class="snippet"></code>
                    </div>
                    <!-- api 맵 가져오는 자리 끝-->
                    
                    <div class="row" style="margin-top: 5%;">
                        <div class="col-sm-6">
                            <h5 class="mb-1">코스 길이</h5>
                            <p>${road.crsLength} km</p>
                        </div>
                        <!-- End Col -->

                        <div class="col-sm-6">
                            <h5 class="mb-1">예상 소요 시간</h5>
                            <p>${road.runTime}분</p>
                        </div>
                        <!-- End Col -->

                        <div class="col-sm-6">
                            <h5 class="mb-1">난이도</h5>
                            <p>${road.level}</p>
                        </div>

                        <div class="col-sm-6">
                            <h5 class="mb-1">코스형태</h5>
                            <p>${road.circle}</p>
                        </div>
                        <br>
                        <div class="crs-intro">
                            <h5>코스 소개</h5>
                            <p>${road.intro}
                            </p>
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                </div>
                <!-- End Col -->

                <div class="col-lg-6" style="margin-bottom: 20px;">
                    <div class="ps-lg-5">
                        <!-- Card -->
                        <div class="card">
                            <div class="card-header border-bottom text-center">
                                <h3 class="card-header-title">경로를 확인하세요</h3>
                            </div>

                            <!-- 길 경로 나타내주는 곳-->
                            
                           
                            <div class="card-body">
                                <div class="crs-route">
                                    <!-- Step Timeline -->
                                    <ul class="step">
                                    <c:if test = "${route==null}">
                                        <!-- Timeline Item -->
                                        <li class="step-item">
                                            <div class="step-content-wrapper">
                                                <span class="step-icon step-icon-soft-dark">
                                                    <i class="bi-calendar3"></i>
                                                </span>

                                                <div class="step-content">
                                                    <span class="step-title">아직 경로가 등록되지 않았습니다.</span>
                                                    <h5 class="text-danger">
                                                    <p>
                                                    <br>
                                                     <br>
                                                      <br>
                                                       <br>
                                                     	<br>
                                                      	<br>
                                                      	<br>
                                                      	<br>
                                                    조금만 기다려주세요<br>
                                                    빠른 시일 내에 경로를 추가할게요!<br>
                                                    <br>
                                                      <br>
                                                       <br>
                                                     	<br>
                                                      	<br>
                                                      	<br>
                                                      	<br>
                                                    </p>
                                                    </h5>
                                                </div>
                                            </div>
                                        </li>
                                        <!-- End Timeline Item -->
								</c:if>
                                    	<c:if test = "${route!=null}">
                                    	<c:forEach var="route" items="${route}">
                                        <!-- Timeline Item -->
                                        <li class="step-item">
                                            <div class="step-content-wrapper">
                                                <span class="step-icon step-icon-soft-dark">
                                                    <i class="bi-calendar3"></i>
                                                </span>

                                                <div class="step-content">
                                                    <span class="step-title">들려갈 곳이에요</span>
                                                    <h5 class="text-danger">${route}<br><br><br></h5>
                                                </div>
                        
                                            </div>
                                        </li>
                                        <!-- End Timeline Item -->
                                </c:forEach>
								</c:if>
								    <!-- 하트 버튼-->
                                    <div class="h_container" style="float: left; margin-left: 16px;">
                                        <button class="btn_click" onclick="wish(${road.rdNo})"><i id="heart" class="far fa-heart"></i></button>
                                    </div>
                                    <!-- 하트버튼 끝 -->
                                    </ul>
                                    <!-- End Step Timeline -->
                                </div>
                                <!-- 길 경로 나타내주는 곳 끝-->
                                <form action="${path}/schedule/insertSchedule.do" method="POST">
                                    <div class="mb-4">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="input_from">여행 날짜를 선택하세요</label>
                                                <input type="date" class="form-control" id="s_date" name="s_date">
                                            	<input type="hidden" id="rdNo" name="rdNo" value="${road.rdNo}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-grid">
                                        <button type="submit" class="btn btn-primary btn-lg" style="background-color: #7275E8; border-color: #7275E8; float: left; border-radius: 30px;">
                                            여기 갈게요
                                        </button>
                                    </div>
									
                                    <div class="text-center">
                                        <p class="form-text">버튼을 누르면 스케줄러에 등록됩니다</p>
                                    </div>
                                </form>
                                <!-- End Form -->
                            </div>
                        </div>
                        <!-- End Card -->
                    </div>
                </div>
                <!-- End Col -->
            </div>
            <!-- End Row -->
        </div>
    </main>
    
    <!--  나중에 table에 mapx,mapy 데이터 추가하기 -->
    <script id="code">
var pano = null;
function initPanorama() {
    pano = new naver.maps.Panorama("pano", {
        position: new naver.maps.LatLng(${road.mapx}, ${road.mapy}),
        pov: {
            pan: -135,
            tilt: 29,
            fov: 100
        },
        zoomControl: true,
        zoomControlOptions: {
            position: naver.maps.Position.TOP_RIGHT,
            style: naver.maps.ZoomControlStyle.SMALL
        }
    });
}

naver.maps.onJSContentLoaded = initPanorama;

$("#zoom").on("click", function(e) {
    e.preventDefault();

    var el = $(this),
        zoomControlEnabled = pano.getOptions("zoomControl");

    if (!zoomControlEnabled) {
        pano.setOptions({
            zoomControl: true
        });
        el.val("ZoomControl 끄기").addClass("control-on");
    } else {
        pano.setOptions({
            zoomControl: false
        });
        el.val("ZoomControl 켜기").removeClass("control-on");
    }
});

$("#zoomOption").on("click", function(e) {
    e.preventDefault();

    var el = $(this),
        zoomControlEnabled = pano.getOptions("zoomControl");

    if (!zoomControlEnabled) return;

    if (!el.hasClass("control-on")) {
        pano.setOptions({
            zoomControlOptions: {
                style: naver.maps.ZoomControlStyle.LARGE
            }
        });

        el.val("작게 보기").addClass("control-on");
    } else {
        pano.setOptions({
            zoomControlOptions: {
                style: naver.maps.ZoomControlStyle.SMALL
            }
        });

        el.val("크게 보기").removeClass("control-on");
    }
});

</script>
<script type="text/javascript">

function wish(rdno){
	var url = "${path}/wishroad/plusWish.do?rdno=";	
	var requestURL = url + rdno;
	location.replace(requestURL);
}

</script>

    <!-- ========== END MAIN CONTENT ========== -->
    
    
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
    <!-- Swiper Carousel                       -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
    <script>
        var basePath = ''
    </script>
    <!-- Main Theme JS file    -->
    <script src="${path }/resources/js/theme.js"></script>
    
    <script src="${path}/js/theme.min.js"></script>
    
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>