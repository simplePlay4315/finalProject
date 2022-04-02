<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="../views/common/header.jsp"/>

    <link rel="stylesheet" href="${path}/resources/css/directory_css/style.default.css" id="theme-stylesheet">
    <!-- header css end -->

    <!-- Body -->
    <!-- Our picks section-->
    <section class="py-6 bg-gray-100 mt-n5 mb-1">
        <div class="container">
            <div class="row mb-3">
                <div class="col-md-8">
                    <h3 class="text-primary">Search</h3>
                    <h2 class="S_core6" style="width: 1000px;">원하는 여행 길을 찾아보고 일정을 관리해보세요!</h2>
                </div>
            </div>
        </div>
        <!-- 이 부분 사진 임의로 바꿨는데 혹시 다른 거 괜찮은 거 있으면 다른 거로 바꿔주세요~~ -->
        <section class="d-flex align-items-center dark-overlay bg-cover" style="background-image: url(${path}/resources/img/main.jpg); height: 400px;">
            <div class="container py-6 py-lg-7 text-black overlay-content"></div>
        </section>
        <div class="container position-relative mt-n6 z-index-20 mb-5 S_core4">
            <ul class="nav nav-tabs search-bar-nav-tabs" role="tablist">
                <li class="nav-item mr-2"><a class="nav-link active" href="#choice" data-toggle="tab" role="tab">여행길 검색</a></li>
            </ul>
            <div class="search-bar search-bar-with-tabs p-3 p-lg-4">
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="choice" role="tabpanel">
                        <form action="${path}/road/list" method="post" name="roadForm" onsubmit="return send();">
                            <div class="d-flex">
                                <div class="row">
                                    <div class="d-flex align-items-center form-group no-divider form-control" style="width: 18%; margin-left: 7%;">
                                        <select class="selectpicker" name="level" title="난이도" data-style="btn-form-control">
	                                        <option value="3">상</option>
	                                        <option value="2">중</option>
	                                        <option value="1">하</option>
	                                    </select>
                                    </div>
                                    <div class="d-flex align-items-center form-group no-divider form-control" style="width: 18%; margin-left: 2%;">
                                        <select class="selectpicker" name=runTime title="시간" data-style="btn-form-control">
	                                        <option value="1~60">1시간 이하</option>
	                                        <option value="61~120">1시간 ~ 2시간</option>
	                                        <option value="121~180">2시간 ~ 3시간</option>
	                                        <option value="181~240">3시간 ~ 4시간</option>
	                                        <option value="241~300">4시간 ~ 5시간</option>
	                                        <option value="301~900">5시간 이상</option>
	                                    </select>
                                    </div>
                                    <div class="d-flex align-items-center form-group no-divider form-control" style="width: 25%; margin-left: 2%;">
                                        <select class="selectpicker" name="s_location" title="지역" data-style="btn-form-control">
	                                        <option value="서울">서울</option>
	                                        <option value="경기">경기</option>
	                                        <option value="인천">인천</option>
	                                        <option value="대구">대구</option>
	                                        <option value="대전">대전</option>
	                                        <option value="광주">광주</option>
	                                        <option value="부산">부산</option>
	                                        <option value="울산">울산</option>
	                                        <option value="충남">충남</option>
											<option value="충북">충북</option>
											<option value="경남">경남</option>
											<option value="경북">경북</option>
											<option value="전남">전남</option>
											<option value="전북">전북</option>
											<option value="강원">강원</option>
	                                    </select>
                                    </div>
                                    <div class="d-flex align-items-center form-group no-divider form-control" style="width: 18%; margin-left: 2%;">
                                        <select class="selectpicker" name="crsLength" title="거리" data-style="btn-form-control">
	                                        <option value="1~5">1km ~ 5km</option>
	                                        <option value="6~10">6km ~ 10km</option>
	                                        <option value="11~20">11km ~ 20km</option>
	                                        <option value="21~234">20km 이상</option>
	                                    </select>
                                    </div>
                                    <div style="margin-left: 7%; width: 85%;">
                                        <input class="form-control mt-2 text-center" type="search" name="roadNm" placeholder="검색할 길 이름을 입력하세요." aria-label="Search">
                                    </div>
                                </div>
                                <div style="width: 10%; height: 100px;">
                                    <button class="btn btn-primary btn-block mt-2 ml-n5 S_core4" type="submit" style="height: 80%;"> 검색 </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row mb-3">
                <div class="col-md-8">
                    <h3 class="text-primary">Recommend</h3>
                    <h2 class="S_core6">걸어보고서에서 추천하는 테마</h2>
                </div>
                <div class="col-md-4 d-md-flex align-items-center justify-content-end S_core4">
                	<a class="text-muted text-sm" href="${path}/road/allList">전체 여행길 보기<i class="fas fa-angle-double-right ml-2"></i></a>
                </div>
            </div>
            <div class="row">
                <div class="d-flex align-items-lg-stretch mb-4 col-lg-8">
                    <div class="card shadow-lg border-0 w-100 border-0 hover-animate" style="background: center center url(${path}/resources/img/photo/photo-1449034446853-66c86144b0ad.jpg) no-repeat; background-size: cover;">
                        <a class="tile-link" href="${path}/road/theme?theme=산책"> </a>
                        <div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">
                            <h4 class="text-white text-uppercase mb-0 S_core8">산책</h4>
                        </div>
                    </div>
                </div>
                <div class="d-flex align-items-lg-stretch mb-4 col-lg-4">
                    <div class="card shadow-lg border-0 w-100 border-0 hover-animate" style="background: center center url(${path}/resources/img/photo/photo-1429554429301-1c7d5ae2d42e.jpg) no-repeat; background-size: cover;">
                        <a class="tile-link" href="${path}/road/theme?theme=강과 바다를 보며"> </a>
                        <div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">
                            <h4 class="text-white text-uppercase mb-0 S_core8">강과 바다를 보며</h4>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="d-flex align-items-lg-stretch mb-4 col-lg-4">
                    <div class="card shadow-lg border-0 w-100 border-0 hover-animate" style="background: center center url(${path}/resources/img/photo/photo-1523430410476-0185cb1f6ff9.jpg) no-repeat; background-size: cover;">
                        <a class="tile-link" href="${path}/road/theme?theme=역사와 드라마"> </a>
                        <div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">
                            <h4 class="text-white text-uppercase mb-0 S_core8">역사와 드라마</h4>
                        </div>
                    </div>
                </div>
                <div class="d-flex align-items-lg-stretch mb-4 col-lg-4">
                    <div class="card shadow-lg border-0 w-100 border-0 hover-animate" style="background: center center url(${path}/resources/img/photo/photo-1505245208761-ba872912fac0.jpg) no-repeat; background-size: cover;">
                        <a class="tile-link" href="${path}/road/theme?theme=기분 전환"> </a>
                        <div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">
                            <h4 class="text-white text-uppercase mb-0 S_core8">기분 전환</h4>
                        </div>
                    </div>
                </div>
                <div class="d-flex align-items-lg-stretch mb-4 col-lg-4">
                    <div class="card shadow-lg border-0 w-100 border-0 hover-animate" style="background: center center url(${path}/resources/img/photo/photo-1519867850-74775a87e783.jpg) no-repeat; background-size: cover;">
                        <a class="tile-link" href="${path}/road/theme?theme=한국의 산티아고 순례길"> </a>
                        <div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">
                            <h4 class="text-white text-uppercase mb-0 S_core8">한국의 산티아고 순례길</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
    <!-- JavaScript files-->
    <script type="text/javascript">
        function send() {
            var level = document.roadForm.level.value;
            if (level == "") {
                alert("원하는 난이도를 선택해주세요");
                document.roadForm.focus();
                return false;
            }

            var runTime = document.roadForm.runTime.value;
            if (runTime == "") {
                alert("원하는 시간을 선택해주세요");
                document.roadForm.focus();
                return false;
            }

            var s_location = document.roadForm.s_location.value;
            if (s_location == "") {
                alert("원하는 지역을 선택해주세요");
                document.roadForm.focus();
                return false;
            }

            var crsLength = document.roadForm.crsLength.value;
            if (crsLength == "") {
                alert("원하는 거리를 선택해주세요");
                document.roadForm.focus();
                return false;
            }
        }
    </script>
    
    <script>
        // ------------------------------------------------------- //
        //   Inject SVG Sprite - 
        //   see more here 
        //   https://css-tricks.com/ajaxing-svg-sprite/
        // ------------------------------------------------------ //
        function injectSvgSprite(path) {

            var ajax = new XMLHttpRequest();
            ajax.open("GET ", path, true);
            ajax.send();
            ajax.onload = function(e) {
                var div = document.createElement("div ");
                div.className = 'd-none';
                div.innerHTML = ajax.responseText;
                document.body.insertBefore(div, document.body.childNodes[0]);
            }
        }
        // to avoid CORS issues when viewing using file:// protocol, using the demo URL for the SVG sprite
        // use your own URL in production, please :)
        // https://demo.bootstrapious.com/directory/1-0/icons/orion-svg-sprite.svg
        //- injectSvgSprite('${path}icons/orion-svg-sprite.svg'); 
        injectSvgSprite('https://demo.bootstrapious.com/directory/1-4/icons/orion-svg-sprite.svg');
    </script>
    

    <!-- Body End-->
    
    
    <jsp:include page="../views/common/footer.jsp"/>
