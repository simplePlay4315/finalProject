<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="kr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>걸어보고서</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Price Slider Stylesheets -->
    <link rel="stylesheet" href="${ path }/resources/css/directory_css/nouislider.css">
    <!-- Google fonts - Playfair Display-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700">
    <!-- Google fonts - Poppins-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,700">
    <!-- swiper-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css">
    <!-- Magnigic Popup-->
    <link rel="stylesheet" href="${ path }/resources/css/directory_css/magnific-popup.css">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="${ path }/resources/css/custom.css">
    <link rel="stylesheet" href="${path} /resources/css/custom_font.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="${ path }/resources/img/favicon.png">
    <!-- Tweaks for older IEs-->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="${ path }/resources/css/directory_css/prism-okaidia.css">

    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
</head>

<body style="padding-top: 72px;">
    <header class="header S_core8">
        <!-- Navbar-->
        <nav class="navbar navbar-expand-lg fixed-top shadow navbar-light bg-white" style="height: 76px;">
            <div class="container-fluid">
                <div class="d-flex align-items-center" style="margin-right: 30px;">
                    <a class="navbar-brand py-1" href="${path}/"><img src="${path}/resources/img/logo.png" style="height: 77px; width: 160px;"></a>
                    <form class="form-inline d-none d-sm-flex" action="#" id="search">걷기
                        <div class="input-label-absolute input-label-absolute-left input-reset input-expand ml-lg-2 ml-xl-3">
                            <label class="label-absolute" for="search_search"><i class="fa fa-search"></i><span class="sr-only">What are you looking for?</span></label>
                            <input class="form-control form-control-plaintext border-0 shadow-0 bg-gray-200 S_core6" id="search_search" placeholder="검색" aria-label="검색" style="height: 35px;">
                            <button class="btn btn-reset btn-sm" type="reset"><i class="fa-times fas"></i></button>
                        </div>
                    </form>
                </div>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars"></i></button>

                <!-- Weather -->
                <div class="S_core4 weather">
                    <div>오늘의 날씨<img class="weather_img" id="img" src="이미지 url"></div>
                </div>
                <!-- Weather End-->

                <!-- Navbar Collapse -->
                <div id="navbarCollapse">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a class="nav-link" href="${path}/around/around.do">주변검색</a></li>
                        <li class="nav-item"><a class="nav-link" href="${path}/schedule/schedule.do">일정관리</a></li>
                        <li class="nav-item"><a class="nav-link" href="${path}/board/boardList">커뮤니티</a></li>
                        <li class="nav-item"><a class="nav-link" href="${path}/introduceOurTeam.do">TEAM</a></li>
                        <c:choose>
                      		<c:when test="${empty loginMember }">
                      			<li class="nav-item mt-3 mt-lg-0 ml-lg-3 d-lg-none d-xl-inline-block"><a class="btn btn-primary" href="${path}/member/loginPage">로그인</a></li>
                      		</c:when>
                      		<c:otherwise>
                            	<li class="nav-item"><a class="nav-link" href="${path}/member/update">회원 정보</a></li>
                        		<li class="nav-item mt-3 mt-lg-0 ml-lg-3 d-lg-none d-xl-inline-block"><a class="btn btn-primary" href="${path}/logout">로그아웃</a></li>                    
                      		</c:otherwise>
                      	</c:choose>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- /Navbar -->

        <!-- Weather Script -->
        <script>
            // ------------------------------------------------------- //
            //   Inject SVG Sprite - 
            //   see more here 
            //   https://css-tricks.com/ajaxing-svg-sprite/
            // ------------------------------------------------------ //
            function injectSvgSprite(path) {

                var ajax = new XMLHttpRequest();
                ajax.open("GET", path, true);
                ajax.send();
                ajax.onload = function(e) {
                    var div = document.createElement("div");
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


            $(document).ready(function() {
                $.ajax({
                    url: 'http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=7a9b56bfd25dc3148e036193a1b0711a&units=metric&lang=kr',
                    dataType: 'json',
                    type: 'GET',
                    success: function(data) {
                        var $Icon = (data.weather[0].icon).substr(0, 2);
                        let iconurl = "http://openweathermap.org/img/wn/" + $Icon + "d@2x.png";

                        $('.Icon').append(iconurl)
                        $('#img').attr("src", iconurl)
                    }
                })
            });
        </script>
        <!-- Weather Script End-->
    </header>
    <!-- Header End -->