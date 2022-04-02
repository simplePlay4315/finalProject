<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
	<c:set var="path" value="${pageContext.request.contextPath}"/>
    <link rel="stylesheet" href="${path}/resources/css/directory_css/style.default.css" id="theme-stylesheet">
    
 <!--============main content===============-->
    <!-- 스케줄 스크립트 시작 -->
    <!-- 날짜 선택 -->
    <script>
    	function cancle(){
			if(confirm("정말로 일정을 취소하시겠습니까?")) {
				var sNo = $("#sNo").text();
				location.replace("${path}/schedule/delete?sNo=" + sNo);
			}
		}
    
    
        function test(item) {
        	var day_text = $(item).text(); 
            $("#day").text(day_text);
            var sNo; 
            var rdNm; 
            var around; 
            
            if ($(item).hasClass("schedule-active")) {
	            if(day_text == "1"){
	            	sNo = '${scheduleMap.get("2022-03-01").getSno()}';
	            	rdNm = '${scheduleMap.get("2022-03-01").getRoadNm()}'; 
		            around = '${scheduleMap.get("2022-03-01").getAround()}';  	
            	} else if(day_text == "2"){
            		sNo = '${scheduleMap.get("2022-03-02").getSno()}';
                	rdNm = '${scheduleMap.get("2022-03-02").getRoadNm()}'; 
    	            around = '${scheduleMap.get("2022-03-02").getAround()}'; 	
            	}else if(day_text == "3"){
            		sNo = '${scheduleMap.get("2022-03-03").getSno()}';
                	rdNm = '${scheduleMap.get("2022-03-03").getRoadNm()}'; 
    	            around = '${scheduleMap.get("2022-03-03").getAround()}';
            	}else if(day_text == "4"){
            		sNo = '${scheduleMap.get("2022-03-04").getSno()}';
                	rdNm = '${scheduleMap.get("2022-03-04").getRoadNm()}'; 
    	            around = '${scheduleMap.get("2022-03-04").getAround()}';
            	} else if(day_text == "5"){
            		sNo = '${scheduleMap.get("2022-03-05").getSno()}';
                	rdNm = '${scheduleMap.get("2022-03-05").getRoadNm()}'; 
    	            around = '${scheduleMap.get("2022-03-05").getAround()}';
            	} else if(day_text == "6"){
            		sNo = '${scheduleMap.get("2022-03-06").getSno()}';
                	rdNm = '${scheduleMap.get("2022-03-06").getRoadNm()}'; 
    	            around = '${scheduleMap.get("2022-03-06").getAround()}';
            	} else if(day_text == "7"){
            		sNo = '${scheduleMap.get("2022-03-07").getSno()}';
                	rdNm = '${scheduleMap.get("2022-03-07").getRoadNm()}'; 
    	            around = '${scheduleMap.get("2022-03-07").getAround()}';
            	} else if(day_text == "8"){
            		sNo = '${scheduleMap.get("2022-03-08").getSno()}';
                	rdNm = '${scheduleMap.get("2022-03-08").getRoadNm()}'; 
    	            around = '${scheduleMap.get("2022-03-08").getAround()}';
            	} else if(day_text == "9"){
            		sNo = '${scheduleMap.get("2022-03-09").getSno()}';
                	rdNm = '${scheduleMap.get("2022-03-09").getRoadNm()}'; 
    	            around = '${scheduleMap.get("2022-03-09").getAround()}';
            	} else if(day_text == "10"){
            		sNo = '${scheduleMap.get("2022-03-10").getSno()}';
                	rdNm = '${scheduleMap.get("2022-03-10").getRoadNm()}'; 
    	            around = '${scheduleMap.get("2022-03-10").getAround()}';
            	} else if(day_text == "11"){
            		sNo = '${scheduleMap.get("2022-03-11").getSno()}';
                	rdNm = '${scheduleMap.get("2022-03-11").getRoadNm()}'; 
    	            around = '${scheduleMap.get("2022-03-11").getAround()}';
            	} else if(day_text == "12"){
            		sNo = '${scheduleMap.get("2022-03-12").getSno()}';
                	rdNm = '${scheduleMap.get("2022-03-12").getRoadNm()}'; 
    	            around = '${scheduleMap.get("2022-03-12").getAround()}';
            	} else if(day_text == "13"){
            		sNo = '${scheduleMap.get("2022-03-13").getSno()}';
                	rdNm = '${scheduleMap.get("2022-03-13").getRoadNm()}'; 
    	            around = '${scheduleMap.get("2022-03-13").getAround()}';
            	} else if(day_text == "14"){
            		sNo = '${scheduleMap.get("2022-03-14").getSno()}';
                	rdNm = '${scheduleMap.get("2022-03-14").getRoadNm()}'; 
    	            around = '${scheduleMap.get("2022-03-14").getAround()}';
            	} else if(day_text == "15"){
            		sNo = '${scheduleMap.get("2022-03-15").getSno()}';
                	rdNm = '${scheduleMap.get("2022-03-15").getRoadNm()}'; 
    	            around = '${scheduleMap.get("2022-03-15").getAround()}';
            	} else if(day_text == "16"){
            		sNo = '${scheduleMap.get("2022-03-16").getSno()}';
                	rdNm = '${scheduleMap.get("2022-03-16").getRoadNm()}'; 
    	            around = '${scheduleMap.get("2022-03-16").getAround()}';
            	} else if(day_text == "17"){
            		sNo = '${scheduleMap.get("2022-03-17").getSno()}';
                	rdNm = '${scheduleMap.get("2022-03-17").getRoadNm()}'; 
    	            around = '${scheduleMap.get("2022-03-17").getAround()}';
            	} else if(day_text == "18"){
            		sNo = '${scheduleMap.get("2022-03-18").getSno()}';
                	rdNm = '${scheduleMap.get("2022-03-18").getRoadNm()}'; 
    	            around = '${scheduleMap.get("2022-03-18").getAround()}';
            	} else if(day_text == "19"){
            		sNo = '${scheduleMap.get("2022-03-19").getSno()}';
                	rdNm = '${scheduleMap.get("2022-03-19").getRoadNm()}'; 
    	            around = '${scheduleMap.get("2022-03-19").getAround()}';
            	} else if(day_text == "20"){
            		sNo = '${scheduleMap.get("2022-03-20").getSno()}';
                	rdNm = '${scheduleMap.get("2022-03-20").getRoadNm()}'; 
    	            around = '${scheduleMap.get("2022-03-20").getAround()}';
            	} else if(day_text == "21"){
            		sNo = '${scheduleMap.get("2022-03-21").getSno()}';
                	rdNm = '${scheduleMap.get("2022-03-21").getRoadNm()}'; 
    	            around = '${scheduleMap.get("2022-03-21").getAround()}';
            	} else if(day_text == "22"){
            		sNo = '${scheduleMap.get("2022-03-22").getSno()}';
                	rdNm = '${scheduleMap.get("2022-03-14").getRoadNm()}'; 
    	            around = '${scheduleMap.get("2022-03-14").getAround()}';
            	} else if(day_text == "23"){
            		sNo = '${scheduleMap.get("2022-03-23").getSno()}';
                	rdNm = '${scheduleMap.get("2022-03-23").getRoadNm()}'; 
    	            around = '${scheduleMap.get("2022-03-23").getAround()}';
            	} else if(day_text == "24"){
            		sNo = '${scheduleMap.get("2022-03-24").getSno()}';
                	rdNm = '${scheduleMap.get("2022-03-24").getRoadNm()}'; 
    	            around = '${scheduleMap.get("2022-03-24").getAround()}';
            	} else if(day_text == "25"){
            		sNo = '${scheduleMap.get("2022-03-25").getSno()}';
                	rdNm = '${scheduleMap.get("2022-03-25").getRoadNm()}'; 
    	            around = '${scheduleMap.get("2022-03-25").getAround()}';
            	} else if(day_text == "26"){
            		sNo = '${scheduleMap.get("2022-03-26").getSno()}';
                	rdNm = '${scheduleMap.get("2022-03-26").getRoadNm()}'; 
    	            around = '${scheduleMap.get("2022-03-26").getAround()}';
            	} else if(day_text == "27"){
            		sNo = '${scheduleMap.get("2022-03-27").getSno()}';
                	rdNm = '${scheduleMap.get("2022-03-27").getRoadNm()}'; 
    	            around = '${scheduleMap.get("2022-03-27").getAround()}';
            	} else if(day_text == "28"){
            		sNo = '${scheduleMap.get("2022-03-28").getSno()}';
                	rdNm = '${scheduleMap.get("2022-03-28").getRoadNm()}'; 
    	            around = '${scheduleMap.get("2022-03-28").getAround()}';
            	} else if(day_text == "29"){
            		sNo = '${scheduleMap.get("2022-03-29").getSno()}';
                	rdNm = '${scheduleMap.get("2022-03-29").getRoadNm()}'; 
    	            around = '${scheduleMap.get("2022-03-29").getAround()}';
            	} else if(day_text == "30"){
            		sNo = '${scheduleMap.get("2022-03-30").getSno()}';
                	rdNm = '${scheduleMap.get("2022-03-30").getRoadNm()}'; 
    	            around = '${scheduleMap.get("2022-03-30").getAround()}';
            	} else if(day_text == "31"){
            		sNo = '${scheduleMap.get("2022-03-31").getSno()}';
                	rdNm = '${scheduleMap.get("2022-03-31").getRoadNm()}'; 
    	            around = '${scheduleMap.get("2022-03-31").getAround()}';
            	} else {
            		alert("잘못된 접근입니다."); 
            	} 
	            
	            sNo_text = '<div class="d-block">  Schedule No. <span id="sNo">' + sNo + '</span></div>';
	            rdNm_text = '<div class="d-block"> <span> 길 명 : ' + rdNm+ '</span></div>';
	            around_text = '<div class="d-block"> <span> 주변 시설 : ' + around+ '</span></div>';
	         	delete_text = '<div class="d-block"><a onclick="cancle()" style="float: right;">일정 삭제하기</a></div>'
	            result = sNo_text + rdNm_text + around_text + delete_text; 
            	$("#schedule-list").html(result);
            }else{
            	$("#schedule-list").html('<div class="d-block"> <span>일정 없음</span></div>');
            }
        };
    </script>
    <!-- 스케줄 스크립트 끝 -->

    <!-- Body -->
    <div id="eventsSection" class="bg-white">
        <div class="container">
            <div class="w-lg-75 text-left text-black mx-auto mb-5 mt-5">
                <h2 class="h1" id="scheduleHeader">${loginMember.name }님의 일정</h2>
            </div>
            <!-- Month -->
            <div class="w-lg-75 text-left text-black mx-auto">
                <h2 class="h3" id="calenderHeader">2022 03</h2>
            </div>
            <!-- Month ENd -->
            <div id="eventCalendarOne">
                <!-- Table -->
                <div class="table-responsive">
                    <table class="table">
                        <thead class="thead-dark text-center">
                            <tr>
                                <th scope="col">일</th>
                                <th scope="col">월</th>
                                <th scope="col">화</th>
                                <th scope="col">수</th>
                                <th scope="col">목</th>
                                <th scope="col">금</th>
                                <th scope="col">토</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr> 
                                <td></td>
                                <td></td>
                                <td onclick="test(this)" ${empty scheduleMap.get("2022-03-01") ? "" : "class='bg-primary text-white schedule-active'"}>1</td>
                                <td onclick="test(this)" ${empty scheduleMap.get("2022-03-02") ? "" : "class='bg-primary text-white schedule-active'"}>2</td>
                                <td onclick="test(this)" ${empty scheduleMap.get("2022-03-03") ? "" : "class='bg-primary text-white schedule-active'"}>3</td>
                                <td onclick="test(this)" ${empty scheduleMap.get("2022-03-04") ? "" : "class='bg-primary text-white schedule-active'"}>4</td>
                                <td onclick="test(this)" ${empty scheduleMap.get("2022-03-05") ? "" : "class='bg-primary text-white schedule-active'"}>5</td>
                            
                            <tr>
                                <td onclick="test(this)" ${empty scheduleMap.get("2022-03-06") ? '' : "class='bg-primary text-white schedule-active'"}>6</td>
                                <td onclick="test(this)" ${empty scheduleMap.get("2022-03-07") ? '' : "class='bg-primary text-white schedule-active'"}>7</td>
                                <td onclick="test(this)" ${empty scheduleMap.get("2022-03-08") ? '' : "class='bg-primary text-white schedule-active'"}>8</td>
                                <td onclick="test(this)" ${empty scheduleMap.get("2022-03-09") ? '' : "class='bg-primary text-white schedule-active'"}>9</td>
                                <td onclick="test(this)" ${empty scheduleMap.get("2022-03-10") ? '' : "class='bg-primary text-white schedule-active'"}>10</td>
                                <td onclick="test(this)" ${empty scheduleMap.get("2022-03-11") ? '' : "class='bg-primary text-white schedule-active'"}>11</td>
                                <td onclick="test(this)" ${empty scheduleMap.get("2022-03-12") ? '' : "class='bg-primary text-white schedule-active'"}>12</td>
                            </tr>
                            <tr>
                                <td onclick="test(this)" ${empty scheduleMap.get("2022-03-13") ? '' : "class='bg-primary text-white schedule-active'"}>13</td>
                                <td onclick="test(this)" ${empty scheduleMap.get("2022-03-14") ? '' : "class='bg-primary text-white schedule-active'"}>14</td>
                                <td onclick="test(this)" ${empty scheduleMap.get("2022-03-15") ? '' : "class='bg-primary text-white schedule-active'"}>15</td>
                                <td onclick="test(this)" ${empty scheduleMap.get("2022-03-16") ? '' : "class='bg-primary text-white schedule-active'"}>16</td>
                                <td onclick="test(this)" ${empty scheduleMap.get("2022-03-17") ? '' : "class='bg-primary text-white schedule-active'"}>17</td>
                                <td onclick="test(this)" ${empty scheduleMap.get("2022-03-18") ? '' : "class='bg-primary text-white schedule-active'"}>18</td>
                                <td onclick="test(this)" ${empty scheduleMap.get("2022-03-19") ? '' : "class='bg-primary text-white schedule-active'"}>19</td>
                            </tr>
                            <tr>
                                <td onclick="test(this)" ${empty scheduleMap.get("2022-03-20") ? '' : "class='bg-primary text-white schedule-active'"}>20</td>
                                <td onclick="test(this)" ${empty scheduleMap.get("2022-03-21") ? '' : "class='bg-primary text-white schedule-active'"}>21</td>
                                <td onclick="test(this)" ${empty scheduleMap.get("2022-03-22") ? '' : "class='bg-primary text-white schedule-active'"}>22</td>
                                <td onclick="test(this)" ${empty scheduleMap.get("2022-03-23") ? '' : "class='bg-primary text-white schedule-active'"}>23</td>
                                <td onclick="test(this)" ${empty scheduleMap.get("2022-03-24") ? '' : "class='bg-primary text-white schedule-active'"}>24</td>
                                <td onclick="test(this)" ${empty scheduleMap.get("2022-03-25") ? '' : "class='bg-primary text-white schedule-active'"}>25</td>
                                <td onclick="test(this)" ${empty scheduleMap.get("2022-03-26") ? '' : "class='bg-primary text-white schedule-active'"}>26</td>
                            </tr>
                            <tr>
                                <td onclick="test(this)" ${empty scheduleMap.get("2022-03-27") ? '' : "class='bg-primary text-white schedule-active'"}>27</td>
                                <td onclick="test(this)" ${empty scheduleMap.get("2022-03-28") ? '' : "class='bg-primary text-white schedule-active'"}>28</td>
                                <td onclick="test(this)" ${empty scheduleMap.get("2022-03-29") ? '' : "class='bg-primary text-white schedule-active'"}>29</td>
                                <td onclick="test(this)" ${empty scheduleMap.get("2022-03-30") ? '' : "class='bg-primary text-white schedule-active'"}>30</td>
                                <td onclick="test(this)" ${empty scheduleMap.get("2022-03-31") ? '' : "class='bg-primary text-white schedule-active'"}>31</td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- End Table -->
            </div>
            <div style="margin-top: -30px; margin-bottom: 30px;"><span class="text-primary">■</span> : 일정</div>
        </div>
        
        
        
     	
        
        <!-- List -->
        <div class="container  mb-5">
            <div class="card border-0 shadow">
                <div class="card-header bg-dark py-4 border-0">
                    <div class="d-flex align-items-center">
                        <div>
                            <h4 class="h6 subtitle text-sm text-white" style="margin-left: 10px;">3월 <span id="day"></span>일의 일정</h4>
                        </div>
                    </div>
                </div>
                <div class="card-body p-4" id="schedule-list">
                    
                </div>
            </div>
        </div>
        <!-- List End-->
    </div>
    <!-- Body End-->
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
