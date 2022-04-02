<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!-- Content-->

 <!-- css, script 추가부분 ---------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
 <style>
    .btn-mid {
        display: block;
        color: #ffffff;
        background-color: #0d1b48;
        border-color: #0d1b48;
        box-shadow: 0 0 24px rgba(27, 22, 66, 0.04), 0 44px 74px rgba(27, 22, 66, 0.06);
    }
</style>
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->
    <!--=============MAIN CONTENT===============-->
    <div class="container mb-5 pb-3">
        <div class="bg-light shadow-lg rounded-3 overflow-hidden">
            <div class="row">
                <section class="col-lg-10 pt-lg-4 pb-4 mb-5">
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
                        <form>
                            <div class="mb-3 pb-2">
                                <label class="form-label" for="unp-product-name">게시글 제목</label>
                                <input class="form-control" type="text" id="unp-product-name">
                                <div class="form-text">최대 100자 이내, html / 이모티콘 제외</div>
                            </div>
                            <div class="file-drop-area mb-3">
                                <div class="file-drop-icon ci-cloud-upload"></div><span class="file-drop-message">사진을 끌어서 올려주세요</span>
                                <input class="file-drop-input" type="file">
                                <button class="file-drop-btn btn btn-primary btn-sm mb-2" type="button">사진 선택하기</button>
                                <div class="form-text">이미지 최적화 사이즈 : 1000x800px</div>
                            </div>
                            <div class="mb-3 py-2">
                                <label class="form-label" for="unp-product-description">게시글 내용</label>
                                <textarea class="form-control" rows="20" id="unp-product-description"></textarea>
                                <div class="bg-gray-300 p-1 fs-ms rounded-bottom"><span class="d-inline-block fw-medium me-2 my-1">Markdown을 지원합니다.</span><br><em class="d-inline-block border-end pe-2 me-2 my-1">기울임 : *Italic*</em><strong class="d-inline-block border-end pe-2 me-2 my-1">강조 : **Bold**</strong>
                                    <span class="d-inline-block border-end pe-2 me-2 my-1">목록 : - List item</span><span class="d-inline-block border-end pe-2 me-2 my-1">제목 : ##Heading##</span><span class="d-inline-block">수평선 : --- Horizontal rule</span></div>
                            </div>
                            <div class="mb-3 py-2">
                                <label class="form-label" for="unp-product-tags">#태그</label>
                                <textarea class="form-control" rows="1" id="unp-product-tags"></textarea>
                                <div class="form-text">게시글에 대한 태그를 작성할 수 있습니다.</div>
                            </div>
                            <button class="btn btn-primary d-block w-30" type="submit"><i
                                    class="ci-cloud-upload fs-lg me-2"></i>작성 완료</button>
                        </form>
                    </div>
                </section>
            </div>
        </div>
    </div>






    <!-- Body End-->