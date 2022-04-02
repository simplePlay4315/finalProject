<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
 <!-- header css -->
    <link rel="stylesheet" href="${path}/resources/css/directory_css/style.default.css" id="theme-stylesheet">
 <!-- header css end -->
 
 
    <section class="py-5">
        <div class="container">
            <div class="d-flex justify-content-between align-items-end mb-5">
                <h1 class="hero-heading mb-0">커뮤니티</h1>
                <a class="btn btn-link btn-primary text-white" href="${path}/board/boardList">목록으로</a>
            </div>
            <div class="container S_core4 shadow">
                <div class="row">
                    <div class="col-xl-8 col-lg-10 mx-auto">
                        <p class="py-3 mb-5 text-muted text-center font-weight-light S_core6">
                            <p class="lead mb-3 S_core5"><c:out value="${board.title}"/></p>
                            <img class="avatar mr-2 avatar-border-white" src="${path}/resources/img/photo/account_Icon.png" alt=""> 작성자 
                            <span class="font-weight-bold"><c:out value="${board.writerId}"></c:out></span>
                            <span class="mx-1">|</span> <fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="${board.createDate}"/><span class="mx-1">|</span>
                            <a class="text-muted">댓글 ${boardReplyCount} </a><span class="mx-1">|</span>
                            <a class="text-muted">조회 ${board.readCount} </a>
                            <hr>
                        </p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-8 col-lg-10 mx-auto">
                        <div class="text-content">
                            <p><c:out value="${board.content}"></c:out></p>
                            <figure class="figure mb-3"><img class="figure-img img-fluid w-100" src="${path}/resources/img/photo/photo-1505245208761-ba872912fac0.jpg" alt="Example blog post alt.">
                                <figcaption class="figure-caption text-center"><c:out value="Photo by ${board.writerId}"></c:out></figcaption>
                            </figure>
                            <hr>
                        </div>
                        <div style="margin-left: 80%;">
					        <table>
							<tr>
								<th colspan="2">
									<c:if test="${ !empty loginMember && (loginMember.id == board.writerId 
														|| loginMember.role == 'ROLE_ADMIN') }">
										<button class="btn btn-primary" type="button" id="btnUpdate">수정</button>
										<button class="btn btn-primary" type="button" id="btnDelete">삭제</button>
									</c:if>
					
								</th>
							</tr>
							</table>
	                        <!-- comments-->
                        </div>
                        <div class="mt-5">
                         <!-- comment form-->
	                        <c:if test="${ loginMember != null }">
	                        <div class="mb-5">
	                            <h5 class="mb-4">댓글 남기기</h5>
	                            <form class="form" id="comment-form" method="post" action="<%=request.getContextPath()%>/board/reply">
	                              	<input type="hidden" name="boardNo" id="" value="${board.no}" />
									<input type="hidden" name="writerId" value="${loginMember.id}" />
	                                <div class="row">
	                                    <div class="col-md-6">
	                                        <div class="form-group">
	                                            <label class="form-label" for="name">작성자 이름 </label>
	                                            <input class="form-control" id="name" type="text" readonly="readonly" value='<c:out value="${loginMember.id}"></c:out>'>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="form-group mb-4">
	                                    <label class="form-label" for="comment">댓글 내용 <span class="required">*</span></label>
	                                    <textarea name="content" class="form-control" id="comment" rows="4" cols="55"></textarea>
	                                </div>
	                                <button class="btn btn-primary" type="submit"><i class="far fa-comment"></i> 작성하기</button>
	                            </form>
	                        </div>
	                        <hr>
	                        </c:if>
                        	<!-- /comment form -->
                            <h6 class="text-uppercase text-muted mb-4">댓글 ${boardReplyCount} 개</h6>
                            <!-- comment-->
                            <c:if test="${ replyList != null }">
								<c:forEach var="reply" items="${ replyList }">
									<div class="media"><img class="avatar mr-4 avatar-border-white" src="${path}/resources/img/photo/account_Icon.png" alt="account_img">
	                                	<div class="media-body flex">
		                                    <h5>${reply.writerId} 님</h5>
		                                    <p class="text-uppercase text-sm text-muted"><i class="far fa-clock"></i><fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="${reply.createDate}"/></p>
		                                    <p class="S_core4">${reply.content}</p>
	                                	</div>
		                                <div>
			                                <c:if test="${ !empty loginMember && (loginMember.id == reply.writerId 	|| loginMember.role == 'ROLE_ADMIN') }">
												<button class="btn btn-primary btn-delete mt-3" onclick="deleteReply('${reply.no}');" >삭제</button>
											</c:if>
		                                </div>
	                            	</div>
	                            <hr>
								</c:forEach>
							</c:if>
                            <!-- /comment-->
                        </div>
                        <!-- /comments-->
                       
                    </div>
                </div>
            </div>
        </div>
    </section>
    
 <script>
	$(document).ready(() => {
		$("#btnUpdate").on("click", (e) => {
			location.href = "${path}/board/update?no=${board.no}";
		});
		
		$("#btnDelete").on("click", (e) => {
			if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
				location.replace("${path}/board/delete?boardNo=${board.no}");
			}
		});
	});
	
	function deleteReply(replyNo){
		var url = "<%=request.getContextPath()%>/board/replydel?replyNo=";
		var requestURL = url + replyNo;
		if(confirm("정말로 댓글을 삭제 하시겠습니까?")){
			location.replace(requestURL);
		}
	}
	
</script>

 <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	