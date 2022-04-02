<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
        
<link rel="stylesheet" href="${path}/resources/css/directory_css/style.default.css" id="theme-stylesheet">
 
 
<section class="py-5">
	<div class="container">
		<div class="d-flex justify-content-between align-items-end mb-5">
            <h1 class="hero-heading mb-0">커뮤니티</h1>
            <c:if test="${ loginMember != null }">
            	<a class="btn btn-link btn-primary text-white" href="${path}/board/boardOneWrite">글쓰기</a>
            </c:if>
        </div>
        <div class="d-flex justify-content-between align-items-center flex-column flex-lg-row mb-5">
            <div class="me-3">
                <p class="mb-3 mb-lg-0"><strong> <c:out value="${boardCount} 개"/></strong>의 게시물이 있습니다.</p>
            </div>
            <div class="text-center">
              <!-- <label class="form-label me-2" for="form_sort">정렬기준</label>  -->
                <select class="selectpicker me-3 mb-3 mb-lg-0" name="sort" id="form_sort" data-style="btn-selectpicker" title="">
            		<option value="sortBy_0">최신순</option>
               		<option value="sortBy_1">등록순</option>
          		</select>
            </div>
        </div>
            
        <!-- board list null -->
        <c:if test="${ list == null }">
			<tr>
				<td colspan="6">
					조회된 게시글이 없습니다.
				</td>
			</tr>
		</c:if>
		<!-- board list null end -->
			
		<!-- board list -->
        <div class="list-group shadow mb-5">
		<c:if test="${ list != null }">
        <c:forEach var="board" items="${ list }">
            <a class="list-group-item list-group-item-action p-4" href="${path}/board/boardOneView?no=${board.no}">
                <div class="row">
                    <div class="col-lg-2 align-self-center">
                        <div class="d-flex align-items-center mb-3">
                            <span class="badge badge-pill p-2 badge-secondary-light"><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${board.createDate }"/> </span>
                        </div>
                    </div>
                    <div class="col-lg-10">
                        <div class="row">
                            <div class="col-6 col-md-4 col-lg-9 py-3 mb-3 mb-lg-0 ">
                                <h5><c:out value="${board.title}"/></h5>
                                <p class="text-sm text-muted "><c:out value="${board.content}"/></p>
                            </div>
                            <div class="col-12 col-lg-3 align-self-center ">
	                       		<!-- <span class="text-primary text-sm text-uppercase me-4 me-lg-0 ">
                               		<i class="fa fa-check fa-fw me-2 "></i>댓글 ~개
                            	</span><br class="d-none d-lg-block ">  -->
                               	<span class="text-primary text-sm text-uppercase ">
                               		<i class="fa fa-check fa-fw me-2 "> </i>조회 ${board.readCount}
                               	</span>
                                <p><c:out value="${board.writerId}"/>&nbsp;&nbsp;
                                   	<img class="avatar avatar-sm avatar-border-white ms-3 " src="${path}/resources/img/photo/account_Icon.png " alt="account_Icon">
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
       	</c:forEach>
		</c:if>
        </div>
		<!-- board list end -->
            
        <!-- Pagination -->
        <nav aria-label="Page navigation example ">
            <ul class="pagination pagination-template d-flex justify-content-center">
                <li class="page-item ">
                    <a class="page-link " href="${ path }/board/boardList?page=${ pageInfo.prvePage }">
                    	<i class="fa fa-angle-left "></i>
                    </a>
                </li>
                <!-- page list -->
				<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1" varStatus="status">
					<c:if test="${ pageInfo.currentPage == status.current}">
						<li class="page-item active">
							<a class="page-link " href="${ path }/board/boardList?page=${ status.current }">
								<c:out value="${ status.current }"/>
							</a>
						</li>
					</c:if>
					<c:if test="${ pageInfo.currentPage != status.current}">
						 <li class="page-item ">
						 	<a class="page-link " href="${ path }/board/boardList?page=${ status.current }">
						 		<c:out value="${ status.current }"/>
						 	</a>
						 </li>
					</c:if>
				</c:forEach>
				<!-- page list end -->
                <li class="page-item ">
                    <a class="page-link" href="${path}/board/boardList?page=${pageInfo.nextPage}">
                    	<i class="fa fa-angle-right "></i>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- Pagination -->
    </div>
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	